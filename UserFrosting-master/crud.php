<?php 
echo "COOL!";
class crud{	
	public function __construct(){
		$GLOBALS['m'] = new MongoClient();
   		$GLOBALS['db'] = $GLOBALS['m']->mydb;
	}

	public function insert($pubid,$sid, $website, $piwik, $cache,$allowedParameters,$abtest, $mp,$rr, $aw, $awcom){
		$collection = $GLOBALS['db']->publishers;		
		$document = array(
	      	 	"pubid" => $pubid, 
	       		"sid" => $sid,
	      		"website" => $website,
	      		'piwik'  => $piwik,
	      		'cache' => $cache,	 
	      		'allowedParameters' => $allowedParameters,
		        'abtest' => $abtest,
			'mp'=>$mp  
		);
	  	$collection->insert($document);
		
		$collection = $GLOBALS['db']->public_IDs;		
		$document = array(
	      	 	"pubid" => $pubid,  
	      		"website" => $website
		);
	  	$collection->insert($document);

		$collection = $GLOBALS['db']->secondary_IDs;		
		$document = array(
	      	 	"pubid" => $pubid, 
	       		"sid" => $sid, 
/*mp=match parameter*/	"mp" => $mp
		);
	  	$collection->insert($document);

		$collection = $GLOBALS['db']->widget_IDs;
		$document = array(
	      	 	"pubid" => $pubid, 
	       		"sid" => $sid, 
	      		"rr" => $rr,
			"aw" => $aw,
			"awcom" => $awcom
		);
		$collection->insert($document);

	}
	public function delete($sid){
		$collection = $GLOBALS['db']->publishers;
		$collection->remove(array("sid"=>$sid),false);
 		echo "Documents deleted successfully";
		$collection = $GLOBALS['db']->secondary_IDs;
		$collection->remove(array("sid"=>$sid),false);
 		$collection = $GLOBALS['db']->widget_IDs;
		$collection->remove(array("sid"=>$sid),false);
 	}

	public function update($pubid,$sid, $website, $piwik, $cache,$allowedParameters,$abtest, $mp,$rr, $aw, $awcom){
		$collection = $GLOBALS['db']->publishers;
		 $collection->update(array("sid"=>$sid), 
		    array('$set'=>array(
	      	 	"pubid" => $pubid, 
	       		"sid" => $sid,
	      		"website" => $website,
	      		'piwik'  => $piwik,
	      		'cache' => $cache,	 
	      		'allowedParameters' => $allowedParameters,
		        'abtest' => $abtest,
			'mp'=>$mp 
		    )));

		$collection = $GLOBALS['db']->secondary_IDs;
		$collection->update(array("sid"=>$sid),array("pubid" => $pubid,"website" => $website));
		$collection = $GLOBALS['db']->widget_IDs;
		$collection->update(array("sid"=>$sid),array("pubid" => $pubid,"sid" => $sid,"rr" => $rr,"aw" => $aw, "awcom" => $awcom));
	}
	//for a given sid and pubid give all the details of 3 collections: publishers, secondaryIDs and widgets.	
	public function read($pubid,$sid){
		$collection = $GLOBALS['db']->publishers;
		$query = array('pubid' => $pubid,'sid' =>$sid);
		$cursor = $collection->find($query);
		//$cursor = $cursor->sort(array("pubid" => 1));
		foreach ($cursor as $doc){
			print_r($doc);
		}
		$collection = $GLOBALS['db']->secondary_IDs;
		$cursor = $collection->find($query);
		foreach ($cursor as $doc){
			print_r($doc);
		}
		$collection = $GLOBALS['db']->widget_IDs;
		$cursor = $collection->find($query);
		foreach ($cursor as $doc){
			print_r($doc);
		}
	}			
};

?>

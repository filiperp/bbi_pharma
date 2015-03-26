<?php


$BASEPATH= 'C:\\Program Files (x86)\\Ampps\\www\\';
// A list of permitted file extensions
$allowed = array('png', 'jpg', 'gif','zip', 'xlsx', 'xls', 'pdf');


//var_dump ($_POST);
//die();

$labName = $_POST['lablist'];
$seller = $_POST['seller'];
$date = $_POST['date'];
$input = 'uploads\\'.$_FILES['upl']['name'];
$fileNameWOExt = pathinfo($input,PATHINFO_FILENAME);
$output = 'ready\\'.$labName.'_'.$seller.'_'.$fileNameWOExt.'.xlsx';


$macroPath = $BASEPATH.'\\macros\\american_farma.vbs';
//echo $labName;
//die();

if(isset($_FILES['upl']) && $_FILES['upl']['error'] == 0){

	$extension = pathinfo($_FILES['upl']['name'], PATHINFO_EXTENSION);


	if(!in_array(strtolower($extension), $allowed)){
		echo '{"status":"error"}';
		exit;
	}

	if(move_uploaded_file($_FILES['upl']['tmp_name'], 'uploads/'.$labName.'_'.$seller.'_'.$_FILES['upl']['name'])){
        $ex = function_exists('exec');

		$t = 'C:\\Debug\\MacroClia.exe  "'.$input.'"   "'.$output.'"  "'.$macroPath.'" "'.$seller.'" "'.$labName.'" "'.$date.'"  ' ;
		exec($t,$leoutput);
		echo $leoutput;
		echo '{"status":"success", "l": "'.$t.'", "ex":"'.$ex.'" }';
		exit;
	}

}

echo '{"status":"error"}';
exit;



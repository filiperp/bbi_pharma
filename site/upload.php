<?php

// A list of permitted file extensions
$allowed = array('png', 'jpg', 'gif','zip', 'xlsx', 'xls', 'pdf');


exec('taskkill /F /IM "excel.exe"',$superOut,$return_var);
exec('taskkill /F /IM "MacroCli.exe"',$superOut,$return_var);
exec('taskkill /F /IM "cmd.exe"',$superOut,$return_var);
exec('taskkill /F /IM "conhost.exe"',$superOut,$return_var);


//var_dump ($_POST);
//die();


$REGISTEREDMACROS = array(
	"american_farma"=> "American Farma",
	"goyas"=>"Goyas Service",
	"onofre"=> "Onofre",
	"profarma"=>"Profarma"
	);

$labName = $REGISTEREDMACROS[$_POST['lablist']];
$seller = $_POST['seller'];
$date = str_pad( $_POST['day'], 2, "0", STR_PAD_LEFT). '/'.str_pad( $_POST['month'], 2, "0", STR_PAD_LEFT). '/'.$_POST['year'] ;
$input = $_FILES['upl']['name'];
$fileNameWOExt = pathinfo($input,PATHINFO_FILENAME);
$output = $labName.'_'.$seller.'_'.$fileNameWOExt.'.xlsx';


$macroPath = $_POST['lablist']. '.vbs';
//echo $labName;
//die();

if(isset($_FILES['upl']) && $_FILES['upl']['error'] == 0){

	$extension = pathinfo($_FILES['upl']['name'], PATHINFO_EXTENSION);


	if(!in_array(strtolower($extension), $allowed)){
		echo '{"status":"error"}';
		exit;
	}

	if(move_uploaded_file($_FILES['upl']['tmp_name'], 'uploads/'.$labName.'_'.$seller.'_'.$_FILES['upl']['name'])){

		$input = $labName.'_'.$seller.'_'.$_FILES['upl']['name'];
        $ex = function_exists('exec');

		$t = '.\\Debug\\MacroCli.exe  "'.$input.'"   "'.$output.'"  "'.$macroPath.'" "'.$seller.'" "'.$labName.'" "'.$date.'"  ' ;
		shell_exec($t);


		echo '{"status":"success", "l": "'.$t.'", "ex":"'.$ex.'" }';
		exit;

	}

}

echo '{"status":"error"}';
exit;

?>

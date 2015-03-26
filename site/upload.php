<?php


$BASEPATH= 'C:\\\\Program Files (x86)\\\\Ampps\\\\www\\\\';
$BASEPATH2= 'C:\\Program Files (x86)\\Ampps\\www\\';
// A list of permitted file extensions
$allowed = array('png', 'jpg', 'gif','zip', 'xlsx', 'xls', 'pdf');


exec('taskkill /F /IM "excel.exe"',$superOut,$return_var);


//var_dump ($_POST);
//die();

$labName = $_POST['lablist'];
$seller = $_POST['seller'];
$date = str_pad( $_POST['day'], 2, "0", STR_PAD_LEFT). '/'.str_pad( $_POST['month'], 2, "0", STR_PAD_LEFT). '/'.$_POST['year'] ;
$input = 'uploads\\\\'.$_FILES['upl']['name'];
$fileNameWOExt = pathinfo($input,PATHINFO_FILENAME);
$output = 'ready\\'.$labName.'_'.$seller.'_'.$fileNameWOExt.'.xlsx';


$macroPath = $BASEPATH.'macros\\\\american_farma.vbs';
//echo $labName;
//die();

if(isset($_FILES['upl']) && $_FILES['upl']['error'] == 0){

	$extension = pathinfo($_FILES['upl']['name'], PATHINFO_EXTENSION);


	if(!in_array(strtolower($extension), $allowed)){
		echo '{"status":"error"}';
		exit;
	}

	if(move_uploaded_file($_FILES['upl']['tmp_name'], 'uploads/'.$labName.'_'.$seller.'_'.$_FILES['upl']['name'])){

		$input = 'uploads\\\\'.$labName.'_'.$seller.'_'.$_FILES['upl']['name'];
        $ex = function_exists('exec');

		$t = '.\\Debug\\MacroCli.exe  "'.$BASEPATH.$input.'"   "'.$BASEPATH2.$output.'"  "'.$macroPath.'" "'.$seller.'" "'.$labName.'" "'.$date.'"  ' ;
		exec($t,$leoutput);

		echo $leoutput;
		echo '{"status":"success", "l": "'.$t.'", "ex":"'.$ex.'" }';
		exit;

	}

}

echo '{"status":"error"}';
exit;

?>

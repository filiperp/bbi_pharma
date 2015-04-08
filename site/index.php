<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>Pharma Solutions by BBI </title>

    <!-- Google web fonts -->
    <link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700" rel='stylesheet' />
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />
    <!-- The main CSS file -->
    <link href="assets/css/style.css" rel="stylesheet" />
</head>

<body>

<?php
require_once "db.php";
$result = mysqli_query($conn,"SELECT count(*) as total from stack where status = 1");
$row = $result->fetch_assoc();

$total= $row['total'];



    ?>
<div id="msgwait" style="align-content: center; text-align: center;display: none">
    <h3 style="color:#fafafa !important;margin-top:60px;">ENVIANDO DADOS...</h3>

</div>

    <form id="upload" method="post" action="upload.php" enctype="multipart/form-data">
        <img src="assets/img/logo.png" style=" width: 100%;height: auto;margin-bottom: 20px;"/>
        <?php
          if($total==0) {
        ?>
        <label style="color:white;">Nome:</label>
        <input type="text" name="seller" style="width:97%; margin-bottom:10px;font-size:20px;" value="Cristiano"/>

        <div style="color:white;width: 33%;display: inline-block;">Dia:</div>
        <div style="color:white;width: 33%;display: inline-block;">Mês:</div>
        <div style="color:white;width: 30%;display: inline-block;">Ano:</div>


        <input type="number" name="day" min="1" max="31" style="width:30%; margin-bottom:10px;font-size:20px;" value="<?php echo date('d');?>"/>
        <input type="number" name="month" min="1" max="12" style="width:30%; margin-bottom:10px;font-size:20px;" value="<?php echo date('m');?>"/>
        <input type="number" name="year" min="2000" max="9000" style="width:30%; margin-bottom:10px;font-size:20px;" value="<?php echo date('Y');?>"/>
        <label style="color:white;">Escolha o Distribuidor:</label>
        <select name="lablist" style="width:100%; margin-bottom:10px;font-size:20px;">
            <option value="american_farma">American Farma</option>
            <option value="goyas">Goyas Service</option>
            <option value="onofre">Onofre</option>
            <option value="profarma">Profarma</option>


        </select>

        <div id="drop">
            Arraste Aqui
            <a>Procurar</a>
            <input type="file" name="upl" multiple/>
        </div>

        <ul>
            <!-- The file uploads will be shown here -->
        </ul>

              <?php
          }else{
              ?>

              <h3 style="color:#999999 !important;">Há um processo de conversão de mapas em andamento</h3>



              <?php


          }
        ?>
        <div style="align-content: center; text-align: center">
            <a href="index.php" class="lebutton">ATUALIZAR PÁGINA</a>
            <BR>
            <a href="clear.php" class="lebutton" style="background-color: #BA0000 !important">REINICIALIZAR FERRAMENTA (APAGAR TUDO!)</a>


        </div>


    </form>


<footer style="color:white;">
    2015 ® BBI Solutions
    <!--  <h2><a href="http://tutorialzine.com/2013/05/mini-ajax-file-upload-form/"><i>Tutorial:</i> Mini Ajax File Upload Form</a></h2>
     <div id="tzine-actions">

         <a id="tzine-download" href="http://tutorialzine.com/2013/05/mini-ajax-file-upload-form/" title="Download This Example!">Download</a>
     </div> -->
</footer>

<!-- JavaScript Includes -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="assets/js/jquery.knob.js"></script>

<!-- jQuery File Upload Dependencies -->
<script src="assets/js/jquery.ui.widget.js"></script>
<script src="assets/js/jquery.iframe-transport.js"></script>
<script src="assets/js/jquery.fileupload.js"></script>

<!-- Our main JS file -->
<script src="assets/js/script.js"></script>


<!-- Only used for the demos. Please ignore and remove. -
<script src="http://cdn.tutorialzine.com/misc/enhance/v1.js" async></script>
-->
</body>
</html>
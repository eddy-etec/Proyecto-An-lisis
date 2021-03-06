<?php
  include ("conexion/Conexion.php");
  //include ("Encryptar.php");
  $bd = new Conexion();
  //$enc = new Encryptar();
  session_start();
  if(isset($_SESSION["id_usuario"])){
    header("Location: index.php");
  }
?>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Inicio de sesión</title>

    
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon.png">
   



    <!-- Bootstrap Core CSS -->
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    

    <!-- Custom CSS "Color del Fondo" -->
    
    <link href="css/sb-admin.css" rel="stylesheet">
    

    
    <!-- Morris Charts CSS -->
    
    <link href="css/plugins/morris.css" rel="stylesheet">
    


    <!-- Custom Fonts -->
    
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    



</head>

<body>

    <?php
      if(isset($_POST["entrar"])){

        $user = $_POST["user"];
        $pass = $_POST["pass"];

        $query = "SELECT * from usuario where user='$user' and pass='$pass';";

        $result = $bd->select($query);

        if($result->num_rows > 0){

          while($row = $result->fetch_assoc()){
            $id_us = $row["id_usuario"];
            $nombre = $row["nombre"];
            $primer_apellido = $row["primer_apellido"];

          }

          $_SESSION["id_usuario"] = $id_us;
          $_SESSION["nomb_comp"] = $nombre." ".$primer_apellido;
          header("Location: index.php");
        }else{
          echo "<script>alert('Los datos ingresados son incorrectos');</script>";
        }

      }
    ?>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                      <div class="row">
                        <div class="col-md-3">
                          <img src="img/logo2.png" width="65px">
                        </div>
                        <div class="col-md-9">
                          <h3>Inicio de sesión</h3>
                        </div>
                      </div>

                    </div>
                    <div class="panel-body">
                        <form role="form" action="" method="post">
                            <fieldset>

                                <div class="form-group">
                                    <input class="form-control" placeholder="Usuario" name="user" type="text" autofocus>
                                </div>

                                <div class="form-group">
                                    <input class="form-control" placeholder="Contraseña" name="pass" type="password">
                                </div>

                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me"> Recordarme
                                    </label>
                                </div>

                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" name="entrar" class="btn btn-primary btn-block" value="Ingresar">

                            </fieldset>
                        </form>
                    </div>
                    <div class="panel-footer">
                      <p>Bienvenido, por favor ingresa a tu cuenta de usuario. Si no tienes una puedes registrarte. <a href="registro.php">Registrate aqui</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>




    <!-- Bootstrap Core JavaScript -->
    
    <script src="js/bootstrap.min.js"></script>
    

    <!-- Morris Charts JavaScript -->

    
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
    


</body>

</html>

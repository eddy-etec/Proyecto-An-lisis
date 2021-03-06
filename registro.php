<?php
  include ("conexion/Conexion.php");
  $bd = new Conexion();
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

    <title>Registro</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon.png">

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>

    <?php
      if(isset($_POST["registro"])){
        

        $nombre = $_POST["nombre"];
        $primer_apellido = $_POST["primer_apellido"];
        $segundo_apellido = $_POST["segundo_apellido"];
        $edad = $_POST["edad"];
        $correo = $_POST["correo"];
        $user = $_POST["user"];
        $pass = $_POST["pass"];

        $query = "INSERT into usuario(nombre,primer_apellido,segundo_apellido,edad,correo,user,pass) values('$nombre','$primer_apellido','$segundo_apellido','$edad','$correo','$user','$pass');";
        $result = $bd->query($query);
        if($result == true){
          echo "<script>alert('Usuario registrado con éxito!!! Inicia sesión');</script>";
          //header("Location: login.php");
        }else{
          echo "<script>alert('No se pudo registrar el usuario');</script>";
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
                          <img src="img/logo3.png" width="65px">
                        </div>
                        <div class="col-md-9">
                          <h3>Regístrate</h3>
                        </div>
                      </div>

                    </div>
                    <div class="panel-body">
                        <form role="form" action="" method="post">
                            <fieldset>


                                <div class="form-group">
                                    <input class="form-control" placeholder="Nombre" name="nombre" type="nombre" autofocus>
                                </div>


                                 <div class="form-group">
                                    <input class="form-control" placeholder="Primer Apellido" name="primer_apellido" type="primer_apellido" autofocus>
                                </div>

                                <div class="form-group">
                                    <input class="form-control" placeholder="Segundo Apellido" name="segundo_apellido" type="segundo_apellido" autofocus>
                                </div>

                                <div class="form-group">
                                    <input class="form-control" placeholder="Edad" name="edad" type="edad" autofocus>
                                </div>


                                <div class="form-group">
                                    <input class="form-control" placeholder="Correo" name="correo" type="email" autofocus>
                                </div>

                                <div class="form-group">
                                    <input class="form-control" placeholder="Usuario" name="user" type="text">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" placeholder="Contraseña" name="pass" type="password">
                                </div>

                                <input type="submit" name="registro" class="btn btn-primary btn-block" value="Registrarse">
                                
                            </fieldset>
                        </form>
                    </div>
                    <div class="panel-footer">
                      <p>¿Ya estas registrado? <a href="login.php">Inicia sesión aquí</a></p>
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

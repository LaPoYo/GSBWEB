<!DOCTYPE html>
<?php
session_start();
require_once("classConnexion/classConnexion.php");
?>

<html>
    <head><title>Connexion</title>
        <style type="text/css">

            .login{
                margin-bottom: 35px;
            }

            form{
                text-align: center;
            }

            .titre{
                color: black;
            }

            h1{
                font-size : 60px;
                text-align: center;
                color : blue;
            }

            body{
                background-image:url(img/logo.jpg);
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size: 100%;
            }

        </style>


    </head>
    <body>

        <h1>Identifiez vous</h1>


        <form method="POST" action="index.php">  <!--mettre le liens du fichier pour envoyer le code-->
            <label class="titre"> Identifiant : <br /></label> <input type="text" class="login" name="login"/>  <!--zone de saisie pour le login-->
            <br/> <label class="titre"> Mot de passe : <br /></label><div class="pass">  <input type="password" name="pass"/></div> <!--Zone de texte pour le mots de passe -->
            <br/><input type="submit" name="submit" value="Se connecter"/>  <!--Boutton connexion pour se connecter -->
        </form>
        <?php
        //connexion à la base de données
        $Test = new clstBDD();

        $Test_de_connexion = $Test->connecte('mysql:host=localhost:3308;dbname=gsb_context', 'UtilisateurPHP', 'ProjetPHP1');
        //Utilisation d'une requete préparée pour communiquer avec la base 
        $requete = $Test->requeteP('SELECT * FROM VISITEUR');

        //Execute la requête
        $requete->execute();
        $logIndex = filter_input(INPUT_POST, 'login');
        $passIndex = filter_input(INPUT_POST, 'pass');

        //Si il y a une erreur lors de la premère connexion afficher un msg d'erreur
        //if ($_POST['login'] === "" && $_POST['pass'] === "") {
        if ($logIndex === "" && $passIndex === "") {
            echo "Identifiant ou mot de passe incorrect.";
        } else {
            //boucle sur le nombre d'élément dans la base
            while ($donnees = $requete->fetch()) {
                //Récupérer le bout d'une chaine, ici le seulement la date et non l'heure
                $dateEMB = substr($donnees['VIS_DATEEMBAUCHE'], -19, 10);
                // Si le login est = à un matricule de la table visiteur et le le mdp est est correct
               
                //if (($logIndex === $donnees['VIS_MATRICULE']) && ($passIndex === 'eXtr@Us3r5')) { PERMET DE TESTER AVEC UN MDP DEFINIT
                if (($logIndex === $donnees['VIS_MATRICULE']) && ($passIndex === date_format(new DateTime($dateEMB), "d-M-Y"))) {
                    //envoyer vers la page menuCR.php
                    header("location:menuCR.html");
                }
            }
        }
        ?>



    </body>
</html>

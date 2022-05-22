<?php
session_start();
require_once("../classConnexion/classConnexion.php");
?>
<html>
    <head>
        <title>formulaire PRATICIEN</title>
        <style type="text/css">
            <!-- body {background-color: white; color:5599EE; } 
            label.titre { width : 180 ; clear:left; float:left; }
            .zone{ width : 30car; float : left; color:7091BB; }
            mark { background-color: white; color: 5599EE; } -->
        </style>
        <script language = "javascript">
            function chercher($pNumero) {
                var xhr_object = null;
                if (window.XMLHttpRequest) // Firefox 
                    xhr_object = new XMLHttpRequest();
                else if (window.ActiveXObject) // Internet Explorer 
                    xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
                else { // XMLHttpRequest non support� par le navigateur 
                    alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
                    return;
                }
                //traitement � la r�ception des donn�es
                xhr_object.onreadystatechange = function () {
                    if (xhr_object.readyState === 4 && xhr_object.status === 200) {
                        var formulaire = document.getElementById("formPraticien");
                        formulaire.innerHTML = xhr_object.responseText;
                    }
                };
                //communication vers le serveur
                xhr_object.open("POST", "../getInfo/getInfoPrat.php", true);
                xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                var data = "pratNum=" + $pNumero;
                xhr_object.send(data);

            }

            // avance d'une valeur de la liste déroulante
            function suivant() {
                var numeroPraticien;
                var listeLength;
                var numPratSuivant;
                listeLength = document.getElementsByName("lstPrat")[0].length;
                numeroPraticien = parseInt(document.getElementsByName("lstPrat")[0].selectedIndex);
                if (numeroPraticien < listeLength) {
                    numeroPraticien = numeroPraticien + 1;
                    numPratSuivant = document.getElementsByName("lstPrat")[0].options[numeroPraticien].value;
                    chercher(numPratSuivant);
                    document.getElementsByName("lstPrat")[0].value = numPratSuivant;
                }
            }

            // recule d'une valeur de la liste déroulante
            function precedent() {
                var numeroPraticien;
                var numPratPrecedent;
                console.log(document.getElementsByName("lstPrat")[0].selectedIndex);
                numeroPraticien = parseInt(document.getElementsByName("lstPrat")[0].selectedIndex);
                if (0 < numeroPraticien) {
                    numeroPraticien = numeroPraticien - 1;
                    numPratPrecedent = document.getElementsByName("lstPrat")[0].options[numeroPraticien].value;
                    chercher(numPratPrecedent);
                    document.getElementsByName("lstPrat")[0].value = numPratPrecedent;
                }
            }


        </script>
    </head>
    <body>	
        <div name="haut" style="margin: 2 2 2 2 ;height:6%;"><h1><img src="../img/logo.jpg" width="100" height="60"/>Gestion des visites</h1></div>
        <div name="gauche" style="float:left;width:18%; background-color:white; height:100%;">
            <h2>Outils</h2>
            <ul><li>Comptes-Rendus</li>
                <ul>
                    <li><a href="../pages/formRAPPORT_VISITE.htm" >Nouveaux</a></li>
                    <li>Consulter</li>
                </ul>
                <li>Consulter</li>
                <ul><li><a href="../pages/formMEDICAMENT.php" >Médicaments</a></li>
                    <li><a href="../pages/formPRATICIEN.php" >Praticiens</a></li>
                    <li><a href="../pages/formVISITEUR.php" >Autres visiteurs</a></li>
                </ul>
            </ul>
        </div>
        <div name="droite" style="float:left;width:80%;">
            <div name="bas" style="margin : 10 2 2 2;clear:left;background-color:77AADD;color:white;height:88%;">
                <h1> Praticiens </h1>
                <form name="formListeRecherche" >
<?php
set_exception_handler('gestion_erreur');

try {

    //appel du fichier de connexion à la base de données
    include("../classConnexion/connexion.inc");

    // remplir la liste déroulante des praticiens
    echo '<span>Choisissez un praticien :  </span><br />';

    // gestion de l'évènement sur la liste deroulante Praticiens
    echo 'beuteu';
    echo '<select name="lstPrat" class="titre" onClick="chercher(this.value);">';

    $sql = 'select distinct* from PRATICIEN order by PRA_NOM,PRA_PRENOM';
    $leslignes = $conn->query($sql);
    $ligne = $leslignes->fetch();

    // parcours la table des praticiens et remplit la liste déroulante
    if ($ligne != null) {

        /*echo '<option selected value=' . $ligne['PRA_NUM'] . '>' . $ligne['PRA_NOM'] . " " . $ligne['PRA_PRENOM'];
        $ligne = $leslignes->fetch();*/

        while ($ligne != null) {
            echo '<option value=' . $ligne['PRA_NUM'] . '>' . $ligne['PRA_NOM'] . " " . $ligne['PRA_PRENOM'];
            $ligne = $leslignes->fetch();
        }
    }
    echo '</select>';
    echo '<br />';

    echo '<br />';

    // fermeture de la connexion à Mysql
    $conn = null;
} // fin Try
catch (Exception $e) {
    //echo "erreur";
    //throw new Exception('Erreur Exception declenchee');;
    die();
}// fin catch

function gestion_erreur($exception) {
    echo "Une erreur est survenue: " . $exception->getMessage();
    die();
}

//fin gestion_erreur
?>


                </form>
                <form id="formPraticien">

                </form>
            </div>
        </div>
    </body>
</html>
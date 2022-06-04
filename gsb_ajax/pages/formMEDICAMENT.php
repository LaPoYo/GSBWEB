<?php
session_start();
require_once("../classConnexion/classConnexion.php");
?>

<html>
    <head>
        <title>formulaire MEDICAMENT</title>
        <style type="text/css">
            <!-- body {background-color: white; color:5599EE; } 
            label.titre { width : 180 ;  clear:left; float:left; } 
            .zone { width : 30car ; float : left; color:7091BB } -->
        </style>

        <script type="text/javascript">
            function getRequeteHttp()
            {
                // gestion des divers navigateurs
                var requeteHttp;
                if (window.XMLHttpRequest)
                {	// Mozilla
                    requeteHttp = new XMLHttpRequest();
                    if (requeteHttp.overrideMimeType)
                    { // problème firefox
                        requeteHttp.overrideMimeType('text/xml');
                    }
                } else
                {
                    if (window.ActiveXObject)
                    {	// C'est Internet explorer < IE7
                        try
                        {
                            requeteHttp = new ActiveXObject("Msxml2.XMLHTTP");
                        } catch (e)
                        {
                            try
                            {
                                requeteHttp = new ActiveXObject("Microsoft.XMLHTTP");
                            } catch (e)
                            {
                                requeteHttp = null;
                            }
                        }
                    }
                }
                return requeteHttp;
            }


// déclenchée lors d'un changement dans la sélection d'un médicament
            function envoyerRequeteMed(id)
            {
                var requeteHttp = getRequeteHttp();
                if (requeteHttp == null)
                {
                    alert("Impossible d'utiliser Ajax sur ce navigateur");
                } else
                {
                    // declenche un post sur la page getinfoclasse.php puis declenchera recevoirInfoMed
                    requeteHttp.open('POST', '../getInfo/getInfoMed.php', true);
                    requeteHttp.onreadystatechange = function () {
                        recevoirInfoMed(requeteHttp);
                    };
                    requeteHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    requeteHttp.send('MED_DEPOTLEGAL=' + escape(id));
                }
            }

// modifie le document HTML courant à partir de l'information reçue via le flux xml 
            function recevoirInfoMed(requeteHttp)
            {
                if (requeteHttp.readyState == 4)
                {
                    if (requeteHttp.status == 200)
                    {
                        document.getElementById("MED_NOMCOMMERCIAL").innerHTML = requeteHttp.responseText;
                    } else
                    {
                        alert("La requête ne s'est pas correctement exécutée");
                    }
                }
            }

            //Permet de passer au precedent medicament de la liste déroulante
            function precedent() {
                //Récupère le numéro de l'index selectionné
                var numMed = document.getElementById("lstMed").selectedIndex;
                //Retire -1 pour avoir l'indice du precedent
                numMed = numMed - 1;

                //Recupère la valeur de id du precedent
                var numMedprecedent = document.getElementById("lstMed").options[numMed].value;

                //precedent que si c'est possible
                if (numMed >= 0) {
                    //Met a jour les informations dans la page
                    envoyerRequeteMed(numMedprecedent);
                    //Met a jour le nom dans la liste déroulante
                    document.getElementById("lstMed").value = numMedprecedent;
                }

            }

            //Permet de passer au medicament suivant de la liste déroulante
            function suivant() {
                //Récupère la taille de la liste
                var taille = document.getElementById("lstMed").length;

                //Récupère le numéro de l'index selectionné
                var numMed = document.getElementById("lstMed").selectedIndex;
                //ajoute +1 pour avoir l'indice du suivant
                numMed = numMed + 1;

                //Recupère la valeur de id du precedent
                var numMedsuivant = document.getElementById("lstMed").options[numMed].value;

                //suivant que si c'est possible
                if (numMed < taille) {
                    //Met a jour les informations dans la page
                    envoyerRequeteMed(numMedsuivant);
                    //Met a jour le nom dans la liste déroulante
                    document.getElementById("lstMed").value = numMedsuivant;
                }
            }
             
        </script>

    </head>
    <body>
        <div style="margin: 2 2 2 2 ;height:6%;"><h1><img src="../img/logo.jpg" width="100" height="60"/>Gestion des visites</h1></div>
        <div style="float:left;width:18%; background-color:white; height:100%;">
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
        <div style="float:left;width:80%;">
            <div style="margin : 10 2 2 2;clear:left;background-color:77AADD;color:white;height:88%;">
                <form name="formMEDICAMENT" method="post" id="formMEDICAMENT">
                    <h1> Infos Médicaments </h1>

                    <!-- formulaire médicament -->

                    <?php
                    set_exception_handler('gestion_erreur');


                    try {

                        //appel du fichier de connexion à la base de données
                        include("../classConnexion/connexion.inc");

                        // remplir la liste déroulante des médicaments
                        echo '<span>Liste des médicaments :  </span><br />';

                        // gestion de l'évènement sur la liste deroulante Médicaments
                        echo '<select id="lstMed" onchange="javascript:envoyerRequeteMed(this.value)">';

                        //Recupère tout les champs de la table médicament (et tri les médicament par ordre alphabetique)
                        $sql = 'select distinct * from MEDICAMENT order by MED_NOMCOMMERCIAL';
                        $leslignes = $conn->query($sql);
                        $ligne = $leslignes->fetch();

                        // parcours la table des médicaments et remplit la liste déroulante
                        if ($ligne != null) {
                            $nomMED = $ligne['MED_NOMCOMMERCIAL'];

                            echo '<option selected value=' . $ligne['MED_DEPOTLEGAL'] . '>' . $ligne['MED_NOMCOMMERCIAL'];
                            $ligne = $leslignes->fetch();

                            while ($ligne != null) {
                                echo '<option value=' . $ligne['MED_DEPOTLEGAL'] . '>' . $ligne['MED_NOMCOMMERCIAL'];
                                $ligne = $leslignes->fetch();
                            }
                        } else {
                            $nomMED = null;
                        }
                        echo '</select>';

                        echo '<br />';
                        echo '<br />';

                        // $nomMED est fourni par le biais de la function envoyerRequeteMed
                        echo '<span id="MED_NOMCOMMERCIAL">' . $nomMED . '</span>';


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
            </div>
        </div>
    </body>
</html>


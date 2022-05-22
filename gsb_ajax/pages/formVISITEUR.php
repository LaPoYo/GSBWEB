<?php
session_start();
require_once("../classConnexion/classConnexion.php");
?>
<html>
    <head>
        <title>formulaire VISITEUR</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <style type="text/css">
            body {
                background-color: white;
                color: 5599 EE;
            }

            .titre {
                width: 180;
                clear: left;
                float: left;
            }

            .zone {
                width: 30 car;
                float: left;
                color: 7091 BB
            }
        </style>

        <script type="text/javascript">

            //Permet de pouvoir naviguer entre les visiteurs
            var cacheVisiteurs = [], currentIndex = 0;


            document.onkeydown = checkKey;

            function checkKey(e, subevent) {
                if (e !== null) {
                    e = e || window.event;
                    subevent = e.keyCode;
                }

                var index = currentIndex;

                if (index > cacheVisiteurs.length - 1) {
                    index = -1;
                } else if (index < 0) {
                    index = cacheVisiteurs.length;
                }

                if (subevent === 37) {
                    // left arrow
                    index -= 1;
                } else if (subevent === 39) {
                    // right arrow
                    index += 1;
                }
                currentIndex = index;
                updateFormulaire(currentIndex);
                document.getElementById("listeVisiteurs").options.selectedIndex = currentIndex;
            }


            function getRequeteHttp() {
                // gestion des divers navigateurs
                var requeteHttp;
                if (window.XMLHttpRequest) {	// Mozilla
                    requeteHttp = new XMLHttpRequest();
                    if (requeteHttp.overrideMimeType) { // problème firefox
                        requeteHttp.overrideMimeType('text/xml');
                    }
                } else {
                    if (window.ActiveXObject) {	//Internet explorer < IE7
                        try {
                            requeteHttp = new ActiveXObject("Msxml2.XMLHTTP");
                        } catch (e) {
                            try {
                                requeteHttp = new ActiveXObject("Microsoft.XMLHTTP");
                            } catch (e) {
                                requeteHttp = null;
                            }
                        }
                    }
                }
                return requeteHttp;
            }

            //POUR LE CHARGEMENT DE LA LISTE DEROULANTE DES DEPARTEMENTS
            // déclenchée lors d'un changement dans la sélection d'une classe
            function envoyerRequeteLibellecomplet(_this) {
                var requeteHttp = getRequeteHttp();
                if (requeteHttp === null) {
                    alert("Impossible d'utiliser Ajax sur ce navigateur");
                } else {
                    var id = _this.value;
                    // declenche un post sur la page getinfoclasse.php puis declenchera recevoirInfoClasse
                    requeteHttp.open('POST', '../getInfo/getInfoVis.php', true);
                    requeteHttp.onreadystatechange = function () {
                        recevoirInfoClasse(requeteHttp);
                    };
                    requeteHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    requeteHttp.send('departement_code=' + escape(id));
                }
            }

            // modifie l'objet libelle_long du document HTML courant à partir de l'information reçue via le flux xml
            function recevoirInfoClasse(requeteHttp) {
                if (requeteHttp.readyState === 4) {
                    if (requeteHttp.status === 200) {
                        document.getElementById("listeVisiteurs").innerHTML = "";

                        while (cacheVisiteurs.length) {
                            cacheVisiteurs.pop();
                        }
                        document.getElementById("VIS_NOM").value = "";

                        requeteHttp.responseXML.childNodes[0].childNodes.forEach(modifierListeSecondaire);
                        currentIndex = 0;
                        updateFormulaire(0);
                        console.log(cacheVisiteurs);
                    } else {
                        alert("La requête ne s'est pas correctement exécutée");
                    }
                }
            }

            //Affichage de la seconde liste secondaire avec : "nom du visiteur prenom du visiteur - numéro de département du visieur"
            function modifierListeSecondaire(item, index) {
                cacheVisiteurs.push(item);
                var opt = document.createElement('option'), select = document.getElementById("listeVisiteurs");
                opt.value = index;
                opt.innerHTML = item.getElementsByTagName("nomVIS")[0].innerHTML + " " + item.getElementsByTagName("prenomVIS")[0].innerHTML + " - " + item.getElementsByTagName("cpVIS")[0].innerHTML;
                select.appendChild(opt);
            }
            
            //Pour mettre a jour le formulaire des visiteur au changement de visiteur
            function updateFormulaire(index) {
                if (index !== undefined) {
                    var visiteur = cacheVisiteurs[index];
                    if (visiteur) {
                        document.getElementById("VIS_NOM").value = visiteur.getElementsByTagName("nomVIS")[0].innerHTML;
                        document.getElementById("Vis_PRENOM").value = visiteur.getElementsByTagName("prenomVIS")[0].innerHTML;
                        document.getElementById("VIS_ADRESSE").value = visiteur.getElementsByTagName("adresseVIS")[0].innerHTML;
                        document.getElementById("VIS_CP").value = visiteur.getElementsByTagName("cpVIS")[0].innerHTML;
                        document.getElementById("VIS_VILLE").value = visiteur.getElementsByTagName("villeVIS")[0].innerHTML;
                        document.getElementById("SEC_CODE").value = visiteur.getElementsByTagName("secVIS")[0].innerHTML;
                    }
                }
            }
        </script>
    </head>
    <body>
        <div name="haut" style="margin: 2 2 2 2 ;height:6%;"><h1><img src="../img/logo.jpg" width="100" height="60"/>Gestion des
                visites</h1></div>
        <div name="gauche" style="float:left;width:18%; background-color:white; height:100%;">
            <h2>Outils</h2>
            <ul>
                <li>Comptes-Rendus</li>
                <ul>
                    <li><a href="../pages/formRAPPORT_VISITE.htm">Nouveaux</a></li>
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
                <form name="formVISITEUR" method="post" action="recupVISITEUR.php">
                    <h1> VISITEUR </h1>
                    <div id="departement_nom"></div>

                    <?php
                    set_exception_handler('gestion_erreur');


                    try {

                        //appel du fichier de connexion à la base de données
                        include("../classConnexion/connexion.inc");

                        // remplir la liste déroulante des Départements
                        echo '<span>Liste des Départements :  </span><br />';

                        // gestion de la  liste deroulante départements
                        echo '<select name="departement_code" onchange="javascript:envoyerRequeteLibellecomplet(this)">';

                        //Séléctionne tout les départements et les classe par ordre alph
                        $sql = 'select * from DEPARTEMENT ORDER BY departement_code ASC';
                        $leslignes = $conn->query($sql);
                        $ligne = $leslignes->fetch();

                        // parcours la table des départements et remplit la liste déroulante des départements
                        if ($ligne != null) {
                            $nomDEP = $ligne['departement_nom'];
                            echo "<option>Selectionner un département</option>";
                            while ($ligne != null) {
                                echo "<option value=" . $ligne['departement_code'] . ">" . $ligne['departement_code'] . " - " . utf8_decode($ligne['departement_nom']) . "</option>";
                                $ligne = $leslignes->fetch();
                            }
                        } else {
                            $nomDEP = null;
                        }
                        echo '</select>';
                        echo '<br />';

                        echo '<br />';
                    } // fin Try
                    catch (\Exception $e) {
                        die($e->getMessage());
                    }// fin catch

                    function gestion_erreur($exception) {
                        echo "Une erreur est survenue: " . $exception->getMessage();
                        die();
                    }
                    ?>
                    <!--Pour faire l'appel de la fonction permettant d'actualiser le formulaire d'affichage des visiteurs-->
                    <span>Liste des visiteurs :  </span><br />
                    <select name="visiteur" id="listeVisiteurs" onchange="javascript:updateFormulaire(this.value)">
                    </select>
                    <br/>
                    <br/>

                    <!-- Différents champs de visiteurs -->
                    <label class="titre">NOM :</label><input type="text" size="25" id="VIS_NOM" class="zone"/>
                    <label class="titre">PRENOM :</label><input type="text" size="50" id="Vis_PRENOM" class="zone"/>
                    <label class="titre">ADRESSE :</label><input type="text" size="50" id="VIS_ADRESSE" class="zone"/>
                    <label class="titre">CP :</label><input type="text" size="5" id="VIS_CP" class="zone"/>
                    <label class="titre">VILLE :</label><input type="text" size="30" id="VIS_VILLE" class="zone"/>
                    <label class="titre">SECTEUR :</label><input type="text" size="1" id="SEC_CODE" class="zone"/>
                    <label class="titre">&nbsp;</label>
                    
                    <!-- Flèches de changement de visiteur-->
                    <input class="zone" type="button" value="<" onclick="checkKey(null, 37)"/>
                    <input class="zone"  type="button"  value=">" onclick="checkKey(null, 39)">
                </form>
            </div>
        </div>
    </body>
</html>


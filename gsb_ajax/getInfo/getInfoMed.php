<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

set_exception_handler('gestion_erreur');


try {
    //appel du fichier de connexion à la base de données
    include("../classConnexion/connexion.inc");
$medDEPOT = filter_input(INPUT_POST, 'MED_DEPOTLEGAL');
    $sql = 'select * from MEDICAMENT where MED_DEPOTLEGAL =' . '"'  . $medDEPOT . '"';
    $lesMED = $conn->query($sql);
    $unMED = $lesMED->fetch();

//Affichage des informations du médicament sélectionné
    echo '
      <br />
      <label class="titre">DEPOT LEGAL :</label><input type = "text" value="' . $unMED["MED_DEPOTLEGAL"] . '" size = "10" name = "MED_DEPOTLEGAL" class = "zone" readonly />
          <br />
          <br />
      <label class="titre">FAMILLE :</label><input type="text" value="' . $unMED["FAM_CODE"] . '" size="10" name="FAM_CODE" class="zone" readonly />
          <br />
          <br />
      <label class="titre">COMPOSITION :</label><input type = "text" value="' . $unMED["MED_COMPOSITION"] . '" size = "66" name = "MED_COMPOSITION" class = "zone" readonly />
          <br />
          <br />
      <label class="titre">EFFETS :</label><textarea rows="5" cols="50" size = "10" name = "MED_EFFETS" class = "zone" readonly >' . $unMED["MED_EFFETS"] . '</textarea>
          <br />
          <br />
      <label class="titre">CONTRE INDICATIONS:</label><textarea rows="5" cols="50" size = "10" name = "MED_CONTREINDIC" class = "zone" readonly >' . $unMED["MED_CONTREINDIC"] . '</textarea>
          <br />
          <br />
      <label class="titre">PRIX ECHANTILLON :</label><input type = "text" value="' . $unMED["MED_PRIXECHANTILLON"] . '" size = "10" name = "MED_PRIXECHANTILLON" class = "zone" readonly />';
    echo '<label class="titre">&nbsp;</label><div class="zone"><input type="button" value="<" onClick="precedent();"></input><input type="button" value=">" onClick="suivant();"></input>
      ';

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
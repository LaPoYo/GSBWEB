<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// se connecte à la base de données pour récupérer le libellé long  à partir du numero reçu en post
// construit un flux XML

set_exception_handler('gestion_erreur');


try {
    //appel du fichier de connexion à la base de données
    include("../classConnexion/connexion.inc");
        
    $sql = 'select * from PRATICIEN where PRA_NUM=' . '"' . $_POST['pratNum']. '"';
    $lesPrat = $conn->query($sql);
    $unPrat = $lesPrat->fetch();
    $sql_TYP_CODE = 'select * from TYPE_PRATICIEN where TYP_CODE=' . '"' . $unPrat["TYP_CODE"]. '"';
    $code_prat = $conn->query($sql_TYP_CODE);
    $un_typ_prat = $code_prat->fetch();
    
    echo '
        <label class="titre">NUMERO :</label><label name="PRA_NUM"><mark>'.$unPrat["PRA_NUM"].'</mark></label>
        <br />
        <br />
	<label class="titre">NOM :</label><label name="PRA_NOM"><mark>'.$unPrat["PRA_NOM"].'</mark></label>
        <br />
        <br />
	<label class="titre">PRENOM :</label><label name="PRA_PRENOM"><mark>'.$unPrat["PRA_PRENOM"].'</mark></label>
        <br />
        <br />
	<label class="titre">ADRESSE :</label><label name="PRA_ADRESSE"><mark>'.$unPrat["PRA_ADRESSE"].'</mark></label>
        <br />
        <br />
	<label class="titre">CP :</label><label name="PRA_CP"><mark>'.$unPrat["PRA_CP"].' '.$unPrat["PRA_VILLE"].'</mark></label>
        <br />
        <br />
	<label class="titre">COEFF. NOTORIETE :</label><label name="PRA_COEFNOTORIETE"><mark>'.$unPrat["PRA_COEFNOTORIETE"].'</mark></label>
        <br />
        <br />
	<label class="titre">TYPE :</label><label name="TYP_CODE"><mark>'.$un_typ_prat["TYP_LIBELLE"].'</mark></label>
        <br />
        <br />
	<label class="titre">&nbsp;</label><div class="zone"><input type="button" value="<" onClick="precedent();"></input><input type="button" value=">" onClick="suivant();"></input>
        
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

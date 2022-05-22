<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
header('Content-Type: application/xml; charset=utf-8');
// se connecte à la base de données pour récupérer le libellé long  à partir du numero reçu en post
// construit un flux XML
echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<visiteurs>';


//gestion_erreur
function gestion_erreur($exception)
{
    echo "Une erreur est survenue: " . $exception->getMessage();
    die();
}
set_exception_handler('gestion_erreur');


if(isset($_POST['departement_code'])){
    try
    {
        //appel du fichier de connexion à la base de données
        include("../classConnexion/connexion.inc");
        
        //Selectionne toutes les information de la classe visiteur quand le VIS_CP ( département ) est egal au département séléctionné
        $sql = 'select * from VISITEUR WHERE VIS_CP LIKE "'.$_POST['departement_code'].'%"';
        $lesVIS = $conn->query($sql);
        $unVIS = $lesVIS->fetchAll(\PDO::FETCH_ASSOC);
        
        foreach ($unVIS as $row){
            //Passe tout les caractères du nom de visiteur et autres champs en majuscules
            $row['VIS_NOM'] = strtoupper($row['VIS_NOM']);
            $row['Vis_PRENOM'] = strtoupper($row['Vis_PRENOM']);
            $row['VIS_ADRESSE'] = strtoupper($row['VIS_ADRESSE']);
            
            echo "<visiteur><nomVIS>{$row['VIS_NOM']}</nomVIS>"
            . "<prenomVIS>{$row['Vis_PRENOM']}</prenomVIS>"
            . "<adresseVIS>{$row['VIS_ADRESSE']}</adresseVIS>"
            . "<cpVIS>{$row['VIS_CP']}</cpVIS>"
            . "<villeVIS>{$row['VIS_VILLE']}</villeVIS>"
            . "<secVIS>{$row['SEC_CODE']}</secVIS></visiteur>";
        }


/*        echo '<nomVIS>' . $unVIS['VIS_NOM'] . '</nomVIS>' . "<br />";
        echo '<prenomVIS>' . $unVIS['Vis_PRENOM'] . '</prenomVIS>' . "<br />";
        echo '<adresseVIS>' . $unVIS['VIS_ADRESSE'] . '</adresseVIS>' . "<br />";
        echo '<cpVIS>' . $unVIS['VIS_CP'] . '</cpVIS>' . "<br />";
        echo '<villeVIS>' . $unVIS['VIS_VILLE'] . '</villeVIS>' . "<br />";
        // echo '<secteurVIS>' . $unVIS['VIS_SEC_CODE'] . '</secteurVIS>' . "<br />";

*/
        // fermeture de la connexion à Mysql
        $conn = null;
    }

//catch
    catch (\Exception $e)
    {
        echo $e->getMessage();
        die();
    }

}else{
    echo "Le champs departement_code est manquant.";
}

echo '</visiteurs>';
?>

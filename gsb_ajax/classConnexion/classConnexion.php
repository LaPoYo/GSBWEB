<?php
/*-------------------------- D�claration de la classe -----------------------------*/
class clstBDD {
/*----------------Propri�t�s de la classe  -----------------------------------*/
var $connexion ;
var $dsn ="" ;
/*---------------------- Acc�s aux propri�t�s --------------------------------------*/
    function getConnexion() {
        return $this->connexion;
        
    }
/* --------------   Connexion � une base via PDO-------------- ------------------- */
    
    function connecte($pNomDSN, $pUtil, $pPasse) {                                 
        //tente d'�tablir une connexion � une base de donn�es                   
        //connexion � la base de donn�es version PHP5
        $this->connexion= new PDO($pNomDSN,$pUtil,$pPasse);
        // version ODBC php4
        //$this->connexion = odbc_connect( $pNomDSN , $pUtil, $pPasse );
        return $this->connexion;
    }
    
/* --------------   Requetes sur la base -------------- ------------------- */
    function requeteAction($req) {
        //ex�cute une requ�te action (insert, update, delete), ne retourne pas de r�sultat
        // version PDO php5
        $nombre_element=$this->connexion->exec($req);
        return $nombre_element;
        // version PHP4
        //odbc_do($this->connexion,$req);
    }
    
    function requeteSelect($req) {
        //interroge la base (select) et retourne le curseur correspondant
        // version PDO php5
        $lesenregistrements=$this->connexion->query($req);
        // version PHP4
        //$lesenregistrements = odbc_do($this->connexion,$req) ;
        return $lesenregistrements;
    }

    function close() {
        // version PDO php5
        $this->connexion=null;
        // version PHP4
        //odbc_close($this->connexion);
    }

    function requeteP($req){
        $lesenregistrements=$this->connexion->prepare($req);
        return $lesenregistrements;
    }
}
?>

<?php

//connexion au serveur de bases de données en PHP5 avec PDO
// Connect to an ODBC database using driver invocation 
$serveur = 'mysql:host=localhost:3308;dbname=gsb_context;charset=utf8';
$login = 'UtilisateurPHP';
$mdp = 'ProjetPHP1';

$conn = new PDO($serveur, $login, $mdp);
// pour declencher la gestion des erreurs en relation avec la base de données
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

/* function connexionPDO() {
  $login = "root";
  $mdp = "";
  $bd = "gsb_context";
  $serveur = "localhost";
  try {
  $conn = new PDO('mysql:host=$serveur; dbname=$bd', $login, $mdp);
  return $conn;
  } catch (PDOExeption $e) {
  return "erreur de connexion";
  die();
  }
  } */
?>
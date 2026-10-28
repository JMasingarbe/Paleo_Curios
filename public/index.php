<?php

include '../vendor/autoload.php';

session_start();

//récupération de l'URL (composante)
$url = parse_url($_SERVER["REQUEST_URI"]);

//extraction du path
$path = isset($url["path"]) ? $url["path"] : "/";

//importer les variables d'environnement 
$dotenv = Dotenv\Dotenv::createImmutable('../');
$dotenv->load();

// Pages Controllers
use App\Controller\HomeController;
$homeController = new HomeController();

use App\Controller\CollectionsController;
$collectionsController = new CollectionsController();

// Router
switch ($path) {
    case '/':
        $homeController->home();
        break;
    case '/about':
        $homeController->about();
        break;
    case '/legal-notices':
        $homeController->legalNotices();
        break;
    case '/collections':
        $collectionsController->collections();
        break;
    default :
        echo 'page 404';
        break;
}
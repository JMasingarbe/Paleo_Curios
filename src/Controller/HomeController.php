<?php

namespace App\Controller;

use App\Controller\AbstractController;

class HomeController extends AbstractController
{
    public function home(): mixed
    {
        return $this->render('home', 'Accueil - Paléo Curios', $data = []);
    }

    public function about(): mixed
    {
        return $this->render('about', 'À propos - Paléo Curios');
    }

    public function legalNotices(): mixed{
        return $this->render('legal_notices', 'Mentions légales - Paléo Curios');
    }
}
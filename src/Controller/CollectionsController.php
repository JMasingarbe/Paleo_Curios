<?php

namespace App\Controller;

use App\Controller\AbstractController;

class CollectionsController extends AbstractController
{
    public function collections(): mixed
    {
        return $this->render('collections', 'Collections - Paléo Curios');
    }
}
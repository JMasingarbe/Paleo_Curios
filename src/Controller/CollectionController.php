<?php

namespace App\Controller;

use App\Controller\AbstractController;
use App\Repository\FossilRepository;

class CollectionController extends AbstractController
{
    public function collection(): mixed
    {
        $collection = $_GET["collection"];
        
        $fossilRepository = new FossilRepository();

        $data = $fossilRepository->selectAllFossils();
        
        if ($collection == "vertebrates") {
            $data["breadcrumbs"] = "Vertébrés";
            return $this->render('collection', 'Vertébrés - Paléo Curios', $data);
        }

        if ($collection == "invertebrates") {
            $data["breadcrumbs"] = "Invertébrés";
            return $this->render('collection', 'Invertébrés - Paléo Curios', $data);
        }

        if ($collection == "insects") {
            $data["breadcrumbs"] = "Insectes";
            return $this->render('collection', 'Insectes - Paléo Curios', $data);
        }

        if ($collection == "plants") {
            $data["breadcrumbs"] = "Plantes";
            return $this->render('collection', 'Plantes - Paléo Curios', $data);
        }

        if ($collection == "other-fossils") {
            $data["breadcrumbs"] = "Autres fossiles";
            return $this->render('collection', 'Autres fossiles - Paléo Curios', $data);
        }
        
        $data["breadcrumbs"] = "Toutes les Collections";
        return $this->render('collection', 'Toutes les Collections - Paléo Curios', $data);
    }
}
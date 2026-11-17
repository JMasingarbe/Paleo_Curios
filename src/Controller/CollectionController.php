<?php

namespace App\Controller;

use App\Controller\AbstractController;
use App\Service\CollectionService;

class CollectionController extends AbstractController
{
    private CollectionService $collection_service;

    public function __construct()
    {
        $this->collection_service = new CollectionService;
    }

    public function collection(): mixed
    {
        $collection = $_GET["collection"] ?? "";

        $data = $this->collection_service->getFossils($_GET);
        
        if ($collection == "vertebrates") {
            $data["breadcrumbs"] = "Vertébrés";

            $data["meta_description"] = "Dinosaures, oiseaux, mammifères… Découvrez les fossiles de vertébrés de Paléo Curios, avec leur période géologique et leur datation.";

            return $this->render('collection', 'Vertébrés - Paléo Curios', $data);
        }

        if ($collection == "invertebrates") {
            $data["breadcrumbs"] = "Invertébrés";

            $data["meta_description"] = "Trilobites, ammonites, coquillages… Parcourez les fossiles d'invertébrés de Paléo Curios, avec leur période géologique et leur datation.";

            return $this->render('collection', 'Invertébrés - Paléo Curios', $data);
        }

        if ($collection == "insects") {
            $data["breadcrumbs"] = "Insectes";

            $data["meta_description"] = "Des libellules géantes aux plus petits insectes : parcourez les fossiles d'insectes de Paléo Curios, avec leur période géologique et leur datation.";

            return $this->render('collection', 'Insectes - Paléo Curios', $data);
        }

        if ($collection == "plants") {
            $data["breadcrumbs"] = "Plantes";

            $data["meta_description"] = "Feuilles, fougères, bois fossilisé… Parcourez les fossiles de plantes de Paléo Curios, avec leur période géologique et leur datation.";

            return $this->render('collection', 'Plantes - Paléo Curios', $data);
        }

        if ($collection == "other-fossils") {
            $data["breadcrumbs"] = "Autres fossiles";

            $data["meta_description"] = "Les fossiles qui n'entrent dans aucune autre catégorie : découvrez la collection « Autres » de Paléo Curios, avec la période et la datation de chacun.";
            
            return $this->render('collection', 'Autres fossiles - Paléo Curios', $data);
        }
        
        $data["breadcrumbs"] = "Toutes les Collections";

        $data["meta_description"] = "Tous les fossiles de Paléo Curios réunis : vertébrés, invertébrés, insectes et plantes. Filtrez par continent, pays ou fossiles exposés.";

        return $this->render('collection', 'Toutes les Collections - Paléo Curios', $data);
    }
}
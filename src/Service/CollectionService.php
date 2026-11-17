<?php

namespace App\Service;

use App\Repository\FossilRepository;

class CollectionService
{
    private FossilRepository $fossil_repository;

    public function __construct()
    {
        $this->fossil_repository = new FossilRepository();
    }

    public function getFossils(array $get)
    {
        $data = [];

        if (isset($get)) {
            $data["trend"] = $this->fossil_repository->selectFossilsTrendByCollection($get["collection"]);
            $data["fossils"] = $this->fossil_repository->selectFossilsByFilters($get);
        } else {
            $data["trend"] = $this->fossil_repository->selectAllFossilsTrend();
            $data["fossils"] = $this->fossil_repository->selectAllFossils();
        }
        
        if (isset($get["collection"]) && !empty($get["collection"])) {
            $data["trend"] = $this->fossil_repository->selectFossilsTrendByCollection($get["collection"]);
        } else {
            $data["trend"] = $this->fossil_repository->selectAllFossilsTrend();
        }

        return $data;
    }
}
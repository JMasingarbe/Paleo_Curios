<?php

namespace App\Entity;
use App\Entity\Continent;

class Country
{
    private ?int $id = null;
    private string $name;
    private Continent $continent;

    public function __construct(
        string $name,
        Continent $continent
    )
    {
        $this->name = $name;
        $this->continent = $continent;
    }

    // Get functions
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getContinent(): Continent
    {
        return $this->continent;
    }

    // Set functions
    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function setName(string $name): void
    {
        $this->name = $name;
    }

    public function setContinent(Continent $continent): void
    {
        $this->continent = $continent;
    }

    // Méthodes

    public static function hydrate(array $data): Country
    {
        $continent = Continent::hydrate([
            "id_continent"=> $data["id_continent"],
            "continent_name"=> $data["continent_name"]
        ]);

        $country = new Country(
            $data["country_name"], 
            $continent
        );

        $country->setId($data["id_country"] ?? null);
        return $country;
    }
}
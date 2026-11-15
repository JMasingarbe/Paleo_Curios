<?php

namespace App\Entity;

class Continent
{
    private ?int $id = null;
    private string $name;

    public function __construct(
        string $name
    )
    {
        $this->name = $name;
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

    // Set functions
    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function setName(string $name): void
    {
        $this->name = $name;
    }

    // Méthodes

    /**
     * Méthode statique qui transforme un tableau associatif en objet Continent
     * @param array $data tableau associatif (BDD requête)
     * @return Continent $continent objet Continent;
     */
    public static function hydrate(array $data): Continent
    {
        $continent = new Continent($data["continent_name"]);
        $continent->setId($data["id_continent"] ?? null);

        return $continent;
    }
}
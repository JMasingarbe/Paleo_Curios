<?php

namespace App\Entity;

class Collection
{
    private ?int $id = null;
    private string $name;

    public function __construct(
        string $name
    )
    {
        $this->name = $name;
    }

    public function getId(): ?int
    {
        return $this->id;
    }
    
    public function getName(): string
    {
        return $this->name;
    }

    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function setName(string $name): void
    {
        $this->name = $name;
    }

    // Methods

    public static function hydrate(array $data): Collection
    {
        $collection = new Collection($data["collection_name"]);

        $collection->setId($data["id_collection"] ?? null);
        
        return $collection;
    }
}
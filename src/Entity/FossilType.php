<?php

namespace App\Entity;

class FossilType
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

    public static function hydrate(array $data): FossilType
    {
        $fossil_type = new FossilType($data["fossil_type_name"]);

        $fossil_type->setId($data["id_fossil_type"] ?? null);

        return $fossil_type;
    }
}
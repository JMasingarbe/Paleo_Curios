<?php

namespace App\Entity;

class Role
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

    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function setName(string $name): void
    {
        $this->name = $name;
    }

    // Method

    public static function hydrate(array $data): Role
    {
        $role = new Role($data["role_name"]);

        $role->setId($data["id_role"] ?? null);

        return $role;
    }
}
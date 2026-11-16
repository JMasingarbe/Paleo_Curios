<?php

namespace App\Entity;

// use App\Entity\User;

class Owner
{
    private ?int $id = null;
    private string $type;
    private ?string $first_name = null;
    private string $name;
    private string $email;
    // private ?User $user = null;

    public function __construct(
        string $type,
        string $name,
        string $email
    )
    {
        $this->type = $type;
        $this->name = $name;
        $this->email = $email;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getType(): string
    {
        return $this->type;
    }

    public function getFirstName(): ?string
    {
        return $this->first_name;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getEmail(): string
    {
        return $this->email;
    }

    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function setType(string $type): void
    {
        $this->type = $type;
    }

    public function setFirstName(?string $first_name): void
    {
        $this->first_name = $first_name;
    }

    public function setName(string $name): void
    {
        $this->name = $name;
    }

    public function setEmail(string $email): void
    {
        $this->email = $email;
    }

    // Methods

    public static function hydrate(array $data): Owner
    {
        $owner = new Owner($data["owner_type"], $data["owner_name"], $data["owner_email"]);

        $owner->setFirstName($data["owner_first_name"] ?? null);

        $owner->setId($data["id_owner"] ?? null);

        return $owner;
    }
}
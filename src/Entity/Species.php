<?php

namespace App\Entity;

class Species
{
    private ?int $id = null;
    private string $name;
    private ?string $link = null;

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

    public function getLink(): ?string
    {
        return $this->link;
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

    public function setLink(string $link): void
    {
        $this->link = $link;
    }
}
<?php

namespace App\Entity;

class Period
{
    private ?int $id = null;
    private string $name;
    private float $start;
    private float $end;

    public function __construct(
        string $name,
        float $start,
        float $end
    )
    {
        $this->name = $name;
        $this->start = $start;
        $this->end = $end;
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

    public function getStart(): float
    {
        return $this->start;
    }

    public function getEnd(): float
    {
        return $this->end;
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

    public function setStart(float $start): void
    {
        $this->start = $start;
    }

    public function setEnd(float $end): void
    {
        $this->end = $end;
    }
}
<?php

namespace App\Entity;

use App\Entity\Collection;
use App\Entity\FossilType;
use App\Entity\Owner;
use App\Entity\Species;
use App\Entity\Continent;
use App\Entity\Period;
use App\Entity\Place;
use DateTimeImmutable;

class Fossil
{
    private ?int $id = null;
    private string $name;
    private string $description;
    private ?float $dating_min = null;
    private ?float $dating_max = null;
    private bool $researchable;
    private int $click = 0;
    private \DateTimeImmutable $added_at;
    private Collection $collection;
    private FossilType $fossil_type;
    private Owner $owner;
    private ?Species $species = null;
    private ?Continent $continent = null;
    private ?Period $period = null;
    private ?Place $extraction_place = null;
    private ?Place $exhibition_place = null;

    public function __construct(
        string $name,
        string $description,
        bool $researchable,
        Collection $collection,
        FossilType $fossil_type,
        Owner $owner
    )
    {
        $this->name = $name;
        $this->description = $description;
        $this->researchable = $researchable;
        $this->added_at = new DateTimeImmutable();
        $this->collection = $collection;
        $this->fossil_type = $fossil_type;
        $this->owner = $owner;
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

    public function getDescription(): string
    {
        return $this->description;
    }

    public function getDatingMin(): ?float
    {
        return $this->dating_min;
    }

    public function getDatingMax(): ?float
    {
        return $this->dating_max;
    }

    public function getResearchable(): bool
    {
        return $this->researchable;
    }

    public function getClick(): int
    {
        return $this->click;
    }

    public function getAddedAt(): DateTimeImmutable
    {
        return $this->added_at;
    }

    public function getCollection(): Collection
    {
        return $this->collection;
    }

    public function getFossilType(): FossilType
    {
        return $this->fossil_type;
    }

    public function getOwner(): Owner
    {
        return $this->owner;
    }

    public function getSpecies(): ?Species
    {
        return $this->species;
    }

    public function getContinent(): ?Continent
    {
        return $this->continent;
    }

    public function getPeriod(): ?Period
    {
        return $this->period;
    }

    public function getExtractionPlace(): ?Place
    {
        return $this->extraction_place;
    }

    public function getExhibitionPlace(): ?Place
    {
        return $this->exhibition_place;
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

    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    public function setDatingMin(float $dating_min): void
    {
        $this->dating_min = $dating_min;
    }

    public function setDatingMax(float $dating_max): void
    {
        $this->dating_max = $dating_max;
    }

    public function setResearchable(bool $researchable): void
    {
        $this->researchable = $researchable;
    }

    public function setClick(int $click): void
    {
        $this->click = $click;
    }

    public function setAddedAt(DateTimeImmutable $added_at): void
    {
        $this->added_at = $added_at;
    }

    public function setCollection(Collection $collection): void
    {
        $this->collection = $collection;
    }

    public function setFossilType(FossilType $fossil_type): void
    {
        $this->fossil_type = $fossil_type;
    }

    public function setOwner(Owner $owner): void
    {
        $this->owner = $owner;
    }

    public function setSpecies(Species $species): void
    {
        $this->species = $species;
    }

    public function setContinent(Continent $continent): void
    {
        $this->continent = $continent;
    }

    public function setPeriod(Period $period): void
    {
        $this->period = $period;
    }

    public function setExtractionPlace(Place $extraction_place): void
    {
        $this->extraction_place = $extraction_place;
    }

    public function setExhibitionPlace(Place $exhibition_place): void
    {
        $this->exhibition_place = $exhibition_place;
    }

    // Méthodes

    public static function hydrate(array $data)
    {
    // private ?int $id = null;
    // private string $name;
    // private string $description;
    // private ?float $dating_min = null;
    // private ?float $dating_max = null;
    // private bool $researchable;
    // private int $click = 0;
    // private \DateTimeImmutable $added_at;
    // private Collection $collection;
    // private FossilType $fossil_type;
    // private Owner $owner;
    // private ?Species $species = null;
    // private ?Continent $continent = null;
    // private ?Period $period = null;
    // private ?Place $extraction_place = null;
    // private ?Place $exhibition_place = null;

        
    }
}
<?php

namespace App\Entity;

use App\Entity\Collection;
use App\Entity\FossilType;
use App\Entity\Owner;
use App\Entity\Species;
use App\Entity\Continent;
use App\Entity\Period;
use App\Entity\Place;
use \DateTimeImmutable;

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
        \DateTimeImmutable $added_at,
        Collection $collection,
        FossilType $fossil_type,
        Owner $owner
    )
    {
        $this->name = $name;
        $this->description = $description;
        $this->researchable = $researchable;
        $this->added_at = $added_at;
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

    public function getAddedAt(): \DateTimeImmutable
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
    public function setId(?int $id): void
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

    public function setDatingMin(?float $dating_min): void
    {
        $this->dating_min = $dating_min;
    }

    public function setDatingMax(?float $dating_max): void
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

    public function setAddedAt(\DateTimeImmutable $added_at): void
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

    public function setSpecies(?Species $species): void
    {
        $this->species = $species;
    }

    public function setContinent(?Continent $continent): void
    {
        $this->continent = $continent;
    }

    public function setPeriod(?Period $period): void
    {
        $this->period = $period;
    }

    public function setExtractionPlace(?Place $extraction_place): void
    {
        $this->extraction_place = $extraction_place;
    }

    public function setExhibitionPlace(?Place $exhibition_place): void
    {
        $this->exhibition_place = $exhibition_place;
    }

    // Methods

    public static function hydrate(array $data): Fossil
    {
        $collection = Collection::hydrate([
            "id_collection"=> $data["id_collection"],
            "collection_name"=> $data["collection_name"]
        ]);

        $fossil_type = FossilType::hydrate([
            "id_fossil_type"=> $data["id_fossil_type"],
            "fossil_type_name"=> $data["fossil_type_name"]
        ]);

        $owner = Owner::hydrate([
            "id_owner"=> $data["id_owner"],
            "owner_type"=> $data["owner_type"],
            "owner_first_name"=> $data["owner_first_name"],
            "owner_name"=> $data["owner_name"],
            "owner_email"=> $data["owner_email"]
        ]);

        $fossil = new Fossil(
            $data["fossil_name"], 
            $data["fossil_description"], 
            $data["fossil_researchable"], 
            new \DateTimeImmutable($data["fossil_added_at"]), 
            $collection, 
            $fossil_type, 
            $owner
        );

        $fossil->setDatingMin($data["fossil_dating_min"] ?? null);
        $fossil->setDatingMax($data["fossil_dating_max"] ?? null);
        
        $fossil->setClick($data["fossil_click"] ?? 0);
    
        if (isset($data["id_species"])){
            $fossil->setSpecies(Species::hydrate([
                "id_species"=> $data["id_species"],
                "species_name"=> $data["species_name"],
                "species_link"=> $data["species_link"]
            ]));
        }

        if (isset($data["id_continent"])){
            $fossil->setContinent(Continent::hydrate([
                "id_continent"=> $data["id_continent"],
                "continent_name"=> $data["continent_name"]
            ]));
        }
    
        if (isset($data["id_period"])){
            $fossil->setPeriod(Period::hydrate([
                "id_period"=> $data["id_period"],
                "period_name"=> $data["period_name"],
                "period_start"=> $data["period_start"],
                "period_end"=> $data["period_end"]
            ]));
        }

        if (isset($data["id_extraction_place"])){
            $fossil->setExtractionPlace(Place::hydrate([
                "id_place"=> $data["id_extraction_place"],
                "place_name"=> $data["extraction_place_name"],
                "place_is_sensitive"=> $data["extraction_place_is_sensitive"],
                "place_link"=> $data["extraction_place_link"],
                "place_address"=> $data["extraction_place_address"],
                "place_postcode"=> $data["extraction_place_postcode"],
                "place_city"=> $data["extraction_place_city"],
                "place_region"=> $data["extraction_place_region"],
                "place_latitude"=> $data["extraction_place_latitude"],
                "place_longitude"=> $data["extraction_place_longitude"],
                "id_country"=> $data["id_extraction_country"], 
                "country_name"=> $data["extraction_country_name"], 
                "id_continent"=> $data["id_extraction_continent"],
                "continent_name"=> $data["extraction_continent_name"]
            ]));
        }

        if (isset($data["id_exhibition_place"])){
            $fossil->setExhibitionPlace(Place::hydrate([
                "id_place"=> $data["id_exhibition_place"],
                "place_name"=> $data["exhibition_place_name"],
                "place_is_sensitive"=> $data["exhibition_place_is_sensitive"],
                "place_link"=> $data["exhibition_place_link"],
                "place_address"=> $data["exhibition_place_address"],
                "place_postcode"=> $data["exhibition_place_postcode"],
                "place_city"=> $data["exhibition_place_city"],
                "place_region"=> $data["exhibition_place_region"],
                "place_latitude"=> $data["exhibition_place_latitude"],
                "place_longitude"=> $data["exhibition_place_longitude"],
                "id_country"=> $data["id_exhibition_country"], 
                "country_name"=> $data["exhibition_country_name"], 
                "id_continent"=> $data["id_exhibition_continent"],
                "continent_name"=> $data["exhibition_continent_name"]
            ]));
        }

        $fossil->setId($data["id_fossil"] ?? null);

        return $fossil;
    }
}
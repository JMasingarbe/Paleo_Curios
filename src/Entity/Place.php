<?php

namespace App\Entity;
use App\Entity\Country;

class Place
{
    private ?int $id = null;
    private string $name;
    private ?string $link = null;
    private ?string $address = null;
    private ?string $post_code = null;
    private ?string $city = null;
    private ?string $region = null;
    private ?float $latitude = null;
    private ?float $longitude = null;
    private bool $is_sensitive;
    private ?Country $country = null;

    public function __construct(
        string $name,
        bool $is_sensitive
    )
    {
        $this->name = $name;
        $this->is_sensitive = $is_sensitive;
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

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function getPostCode(): ?string
    {
        return $this->post_code;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function getRegion(): ?string
    {
        return $this->region;
    }

    public function getLatitude(): ?float
    {
        return $this->latitude;
    }

    public function getLongitude(): ?float
    {
        return $this->longitude;
    }

    public function getIsSensitive(): bool
    {
        return $this->is_sensitive;
    }

    public function getCountry(): ?Country
    {
        return $this->country;
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

    public function setLink(?string $link): void
    {
        $this->link = $link;
    }

    public function setAddress(?string $address): void
    {
        $this->address = $address;
    }

    public function setPostCode(?string $post_code): void
    {
        $this->post_code = $post_code;
    }

    public function setCity(?string $city): void
    {
        $this->city = $city;
    }

    public function setRegion(?string $region): void
    {
        $this->region = $region;
    }

    public function setLatitude(?float $latitude): void
    {
        $this->latitude = $latitude;
    }

    public function setLongitude(?float $longitude): void
    {
        $this->longitude = $longitude;
    }

    public function setIsSensitive(bool $is_sensitive): void
    {
        $this->is_sensitive = $is_sensitive;
    }

    public function setCountry(?Country $country): void
    {
        $this->country = $country;
    }

    // Methods

    public static function hydrate(array $data): Place
    {
        $place = new Place($data["place_name"], $data["place_is_sensitive"]);

        $place->setId($data["id_place"] ?? null);

        $place->setLink($data["place_link"] ?? null);

        $place->setAddress($data["place_address"] ?? null);

        $place->setPostCode($data["place_postcode"] ?? null);

        $place->setCity($data["place_city"] ?? null);

        $place->setRegion($data["place_region"] ?? null);

        $place->setLatitude($data["place_latitude"] ?? null);

        $place->setLongitude($data["place_longitude"] ?? null);

        if (isset($data["id_country"])){
            $place->setCountry(Country::hydrate([
                "id_country"=> $data["id_country"], 
                "country_name"=> $data["country_name"], 
                "id_continent"=> $data["id_continent"],
                "continent_name"=> $data["continent_name"]
            ]));
        }

        return $place;
    }
}
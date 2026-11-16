<?php

namespace App\Repository;

use App\Entity\Fossil;
use App\Database\Mysql;

class FossilRepository {
    private \PDO $connection;

    public function __construct()
    {
        $this->connection = Mysql::connectBdd();
    }

    public function selectAllFossils(): array
    {
        $fossils = [];

        try {
            // Query
            $sql = "SELECT f.id_fossil, f.fossil_name, f.fossil_description, f.fossil_researchable, f.fossil_added_at, f.fossil_dating_min, f.fossil_dating_max, f.fossil_click, 
            col.id_collection, col.collection_name,
            ft.id_fossil_type, ft.fossil_type_name,
            o.id_owner, o.owner_type, o.owner_first_name, o.owner_name, o.owner_email,
            sp.id_species, sp.species_name, sp.species_link,
            con.id_continent, con.continent_name,
            p.id_period, p.period_name, p.period_start, p.period_end,
            ext.id_place AS id_extraction_place, ext.place_name AS extraction_place_name, ext.place_is_sensitive AS extraction_place_is_sensitive, ext.place_link AS extraction_place_link, ext.place_address AS extraction_place_address, ext.place_postcode AS extraction_place_postcode, ext.place_city AS extraction_place_city, ext.place_region AS extraction_place_region, ext.place_latitude AS extraction_place_latitude, ext.place_longitude AS extraction_place_longitude,
            ext_c.id_country AS id_extraction_country, ext_c.country_name AS extraction_country_name,
            ext_con.id_continent AS id_extraction_continent, ext_con.continent_name AS extraction_continent_name,
            exh.id_place AS id_exhibition_place, exh.place_name AS exhibition_place_name, exh.place_is_sensitive AS exhibition_place_is_sensitive, exh.place_link AS exhibition_place_link, exh.place_address AS exhibition_place_address, exh.place_postcode AS exhibition_place_postcode, exh.place_city AS exhibition_place_city, exh.place_region AS exhibition_place_region, exh.place_latitude AS exhibition_place_latitude, exh.place_longitude AS exhibition_place_longitude,
            exh_c.id_country AS id_exhibition_country, exh_c.country_name AS exhibition_country_name,
            exh_con.id_continent AS id_exhibition_continent, exh_con.continent_name AS exhibition_continent_name
            FROM fossil AS f
            INNER JOIN `collection` AS col ON col.id_collection = f.id_collection
            INNER JOIN fossil_type AS ft ON ft.id_fossil_type = f.id_fossil_type
            INNER JOIN `owner` AS o ON o.id_owner = f.id_owner
            LEFT JOIN species AS sp ON sp.id_species = f.id_species
            LEFT JOIN continent AS con ON con.id_continent = f.id_continent
            LEFT JOIN geological_period AS p ON p.id_period = f.id_period
            LEFT JOIN place AS ext ON ext.id_place = f.id_extraction_place
            LEFT JOIN country AS ext_c ON ext_c.id_country = ext.id_country
            LEFT JOIN continent AS ext_con ON ext_con.id_continent = ext_c.id_continent
            LEFT JOIN place AS exh ON exh.id_place = f.id_exhibition_place
            LEFT JOIN country AS exh_c ON exh_c.id_country = exh.id_country
            LEFT JOIN continent AS exh_con ON exh_con.id_continent = exh_c.id_continent
            ORDER BY f.fossil_added_at ASC";

            $stmt = $this->connection->prepare($sql);
            $stmt->execute();
            $data = $stmt->fetchAll(\PDO::FETCH_ASSOC);

            foreach ($data as $fossil) {
                $fossils[] = Fossil::hydrate($fossil);
            }

        } catch (\PDOException $e) {
            $error["error"] = "Erreur : " . $e->getMessage();
            return $error;
        }
        return $fossils;
    }
}
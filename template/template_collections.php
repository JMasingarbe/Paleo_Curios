<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./asset/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./style/css/main.css">
    <link rel="stylesheet" href="./style/css/collections.css">
    <title><?= $title ?? "" ?></title>
</head>

<body>
    <!-- Header -->
    <?php include 'component/header.php'?>

    <!-- Main -->
    <main>
        <!-- Search bar & filter button -->
        <div id="searchbar_filter">
            <div id="searchbar">
                <input type="search" id="searchbar_input" name="searchbar_input" placeholder="Rechercher" aria-label="Champ de recherche" maxlength="150">
                <button type="button" aria-label="Bouton de recherche"><img src="./asset/icons/noun-search-2738105.png" alt="Icône de recherche"></button>
            </div>
            <button type="button" id="filters_button" aria-label="Bouton d'affichage des filtres de recherche"><img src="./asset/icons/noun-filter-5208249.png" alt="Icône de filtrage"></button>
        </div>

        <!-- Filter -->
        <form action="/collection" method="get">
            <fieldset>
                <legend>Filtres :</legend>
                <button type="button" id="closing_filters"><img src="./asset/icons/noun-close-75759.png" alt="Icône de fermeture"></button>
                
                <!-- Checkbox: fossil is exposed ? -->
                <div>
                    <input type="checkbox" name="is_exposed" id="is_exposed">
                    <label for="is_exposed"><div id="custom_checkbox_exposed"></div> Exposé</label>
                </div>

                <!-- Dropdown continent -->
                <div>
                    <label for="continent">Continent :</label>
                    <select name="continent" id="continent">
                        <option value="none_continent">Aucun sélectionné</option>
                        <option value="africa">Afrique</option>
                        <option value="north_america">Amérique du Nord</option>
                        <option value="south_america">Amérique du Sud</option>
                        <option value="antartica">Antarctique</option>
                        <option value="asia">Asie</option>
                        <option value="europa">Europe</option>
                        <option value="oceania">Océanie</option>
                    </select>
                </div>

                <!-- Dropdown collection -->
                <div id="dropdown_collection">
                    <label for="collection">Collection :</label>
                    <select name="collection" id="collection">
                        <option value="all_collections">Toutes</option>
                        <option value="vertebrates">Vertébrés</option>
                        <option value="invertebrates">Invertébrés</option>
                        <option value="insects">Insectes</option>
                        <option value="plants">Plantes</option>
                        <option value="other_fossils">Autres</option>
                    </select>
                </div>

                <!-- Search country -->
                <div>
                    <label for="search_country">Pays :</label>
                    <input type="text" name="search_country" id="search_country" placeholder="Pays" maxlength="50">
                </div>

                <button type="submit" id="submit_filters_button" class="sec_link_button">Appliquer</button>
            </fieldset>
        </form>

        <!-- Collections -->
        <section id="particulars_collections">
            <a href="/collection?collection=vertebrates" id="vertebrate">
                <article>
                    <img src="./asset/pictures/Archaeopteryx_lithographica_(Berlin_specimen).jpg" alt="Photo de la collection des fossiles de vertébrés">
                    <h2>Vertébrés</h2>
                </article>
            </a>
    
            <a href="/collection?collection=invertebrates" id="invertebrate">
                <article>
                    <img src="./asset/pictures/Alokistocare_sp_4.JPG" alt="Photo de la collection des fossiles de invertébrés">
                    <h2>Invertébrés</h2>
                </article>
            </a>
    
            <a href="/collection?collection=insects" id="insect">
                <article>
                    <img src="./asset/pictures/Meganeura_monyi_au_Museum_de_Toulouse.jpg" alt="Photo de la collection des fossiles de insectes">
                    <h2>Insectes</h2>
                </article>
            </a>
    
            <a href="/collection?collection=plants" id="plant">
                <article>
                    <img src="./asset/pictures/Caesalpina_eocenica_322.jpg" alt="Photo de la collection des fossiles de plantes">
                    <h2>Plantes</h2>
                </article>
            </a>
    
            <a href="/collection?collection=other-fossils" id="other_fossils">
                <article>
                    <img src="./asset/pictures/il_1588xN.3078041578_40cs.webp" alt="Photo de la collection des autres fossiles">
                    <h2>Autres</h2>
                </article>
            </a>
        </section>

        <a href="/collection?collection=all-collections" id="all_collections"><h2>Toutes les collections</h2></a>

        <a href="statistics.php" class="link_button">Statistiques générales</a>
    </main>

    <!-- Footer -->
    <?php include 'component/footer.php' ?>

    <!-- Scripts -->
    <script src="./script/main.js"></script>
    <script src="./script/collections.js"></script>
</body>
</html>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./asset/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./style/css/main.css">
    <link rel="stylesheet" href="./style/css/collections.css">
    <meta name="description" content="Parcourez les collections de fossiles de Paléo Curios : vertébrés, invertébrés, insectes, plantes… Filtrez par continent, pays ou fossiles exposés.">
    <title><?= $title ?? "" ?></title>
</head>

<body>
    <!-- Header -->
    <?php include 'component/header.php'?>

    <!-- Main -->
    <main>
        <!-- Search bar & filter button -->
        <search>
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
                        <label for="is_exposed"><span id="custom_checkbox_exposed"></span> Exposé</label>
                    </div>

                    <!-- Dropdown continent -->
                    <div>
                        <label for="continent">Continent :</label>
                        <select name="continent" id="continent">
                            <option value="">Aucun sélectionné</option>
                            <option value="africa">Afrique</option>
                            <option value="north-america">Amérique du Nord</option>
                            <option value="south-america">Amérique du Sud</option>
                            <option value="antarctica">Antarctique</option>
                            <option value="asia">Asie</option>
                            <option value="europa">Europe</option>
                            <option value="oceania">Océanie</option>
                        </select>
                    </div>

                    <!-- Dropdown collection -->
                    <div id="dropdown_collection">
                        <label for="collection">Collection :</label>
                        <select name="collection" id="collection">
                            <option value="">Toutes</option>
                            <option value="vertebrates">Vertébrés</option>
                            <option value="invertebrates">Invertébrés</option>
                            <option value="insects">Insectes</option>
                            <option value="plants">Plantes</option>
                            <option value="other-fossils">Autres</option>
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
        </search>

        <!-- Collections -->
        <section id="particulars_collections">
            <a href="/collection?collection=vertebrates" id="vertebrate">
                <article>
                    <img src="./asset/pictures/Cover_vertebrate_fossils.webp" alt="Photo de la collection des fossiles de vertébrés" loading="lazy">
                    <h2>Vertébrés</h2>
                </article>
            </a>
    
            <a href="/collection?collection=invertebrates" id="invertebrate">
                <article>
                    <img src="./asset/pictures/Cover_invertebrate_fossils.webp" alt="Photo de la collection des fossiles de invertébrés" loading="lazy">
                    <h2>Invertébrés</h2>
                </article>
            </a>
    
            <a href="/collection?collection=insects" id="insect">
                <article>
                    <img src="./asset/pictures/Cover_insect_fossils.webp" alt="Photo de la collection des fossiles de insectes" loading="lazy">
                    <h2>Insectes</h2>
                </article>
            </a>
    
            <a href="/collection?collection=plants" id="plant">
                <article>
                    <img src="./asset/pictures/Cover_plant_fossils.webp" alt="Photo de la collection des fossiles de plantes" loading="lazy">
                    <h2>Plantes</h2>
                </article>
            </a>
    
            <a href="/collection?collection=other-fossils" id="other_fossils">
                <article>
                    <img src="./asset/pictures/Cover_other_fossils.webp" alt="Photo de la collection des autres fossiles" loading="lazy">
                    <h2>Autres</h2>
                </article>
            </a>
        </section>

        <a href="/collection" id="all_collections"><h2>Toutes les collections</h2></a>

        <a href="/statistics" class="link_button">Statistiques générales</a>
    </main>

    <!-- Footer -->
    <?php include 'component/footer.php' ?>

    <!-- Scripts -->
    <script src="./script/main.js"></script>
    <script src="./script/collections.js"></script>
</body>
</html>
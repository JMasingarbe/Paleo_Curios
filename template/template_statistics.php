<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./asset/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./style/css/main.css">
    <title>Paléo Curios - Statistiques</title>
</head>

<body>
    <!-- Header -->
    <?php include 'component/header.php'?>

    <!-- Main -->
    <main>
        <!-- Breadcrumbs -->
        <ul class="breadcrumbs">
            <li><a href="collections.php">Collections</a></li>
            <li><a href="collection.php">Collection</a></li>
            <li>Statistiques</li>
        </ul>

        <!-- Statistic filter -->
        <div>
            <h4>Types de statistiques :</h4>

            <input type="checkbox" name="geographical_stat" id="geographical_stat">
            <label for="geographical_stat">Géographique</label>

            <input type="checkbox" name="taxonomy_stat" id="taxonomy_stat">
            <label for="taxonomy_stat">Taxonomie</label>

            <input type="checkbox" name="type_stat" id="type_stat">
            <label for="type_stat">Types de fossile</label>

            <input type="checkbox" name="date_stat" id="date_stat">
            <label for="date_stat">Datation</label>
        </div>

        <!-- Statistic display section -->
        <!-- !!!!!! Temporary style !!!!!!!! -->
        <div id="statistic_graph" style="width: 80vw; height: 1vh; background-color: red;">

        </div>

        <!-- Selected fossils -->
        <h3>Fossiles sélectionnés :</h3>

            <!-- 13 fossils cards -->
        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <a href="fossil.php">
            <article>
                <img src="https://placehold.co/200" alt="Photo du fossile">
                <h3>Nom du fossile</h3>
                <p>Datation</p>
            </article>
        </a>

        <!-- Page nav -->
        <div class="catalogue_nav">
            <button type="button"><-</button>
            <button type="button">1</button>
            <button type="button">2</button>
            <button type="button">3</button>
            <span>...</span>
            <button type="button">-></button>
        </div>
    </main>

    <!-- Footer -->
    <?php include 'component/footer.php' ?>

    <!-- Scripts -->
    <script src="./script/main.js"></script>
</body>
</html>
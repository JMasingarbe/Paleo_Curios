<?php

namespace App\Controller;

abstract class AbstractController
{
    /**
     * Méthode pour rendre une vue avec un template
     * @param string $template Le nom du template à inclure
     * @param string|null $title Le titre de la page
     * @param array $data Les données à passer au template
     * @return mixed
     */
    protected function render(string $template, ?string $title, array $data = []): mixed
    {
       return include __DIR__ . "/../../template/template_" . $template . ".php";
    }

    /**
     * Méthode pour générer un composant
     * @param string $component Le nom du template à inclure
     * @param array $data Les données à passer au composant
     * @return void
     */
    protected function renderComponent(string $component, array $data = []): void
    {
        include __DIR__ . "/../../templates/components/component_" . $component . ".php";
    }
}
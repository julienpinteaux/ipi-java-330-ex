<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="tags/header.jsp" %>

<div class="container">
    <div class="jumbotron">
        <h1>Bienvenue dans l'interface de gestion des ${nbr} employés !</h1>
        <p>Cette application web est paramètre pour communiquer avec une API REST accessible Ã  l'adresse <code>http://localhost:5367</code>.</p>
        <p>Il est nécessaire de développer les services webs nécessaires pour que cette application fonctionne. Voici l'ensemble des fonctionnalités :</p>
        <ul class="list-group">
            <li class="list-group-item">
                <h4 class="list-group-item-heading">1 - Compter le nombre d'employÃ©s</h4>
                <p class="list-group-item-text">A cÃ´tÃ© du lien <em>Liste des employÃ©s</em>, on doit voir apparaÃ®tre le nombre d'employÃ©s. L'appel qui est effectuÃ© est <code>GET /employes/count</code>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">2 - Afficher un employé	</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/5">ici</a>, on peut afficher les informations basiques de l'employÃ© d'identifiant 5 (matricule M00001). On consulte l'URL <code>/employes/5</code>. En cliquant <a href="/employes/0">ici</a>, on essaye d'afficher l'employÃ© d'identifiant 0 mais on doit obtenir une erreur 404 car il n'existe pas.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">3 - Recherche par matricule</h4>
                <p class="list-group-item-text">Lorsqu'on recherche le matricule <em>C00019</em> dans la barre de recherche, on tombe sur <em>Sarah Renault</em>. L'URL auquel on accÃ¨de est <code>/?matricule=C00019</code>. Lorsqu'on recherche un matricule inexistant commme <em>ABCDEF</em>, on obtient une erreur 404.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">4 - Liste des employÃ©s</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes?page=0&size=10&sortDirection=ASC&sortProperty=matricule">ici</a>, tous les employÃ©s sont affichÃ©s, de maniÃ¨re paginÃ©e. Il est possible de changer de page en utilisant les boutons. L'URL utilisÃ© est <code>/employes?page=0&size=10&sortProperty=matricule&sortDirection=ASC</code></p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">5 - CrÃ©ation d'un Commercial</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/new/commercial">ici</a> ou via le bouton <em>Nouvel employÃ©</em>, <em>Commercial</em>, prÃ©sent dans la liste des employÃ©s, on accÃ¨de au formulaire de crÃ©ation d'un commercial. L'appel qui est effectuÃ© est <code>POST /commercials/save</code> avec les donnÃ©es du formulaire qui sont envoyÃ©es.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">6 - Modification d'un Commercial</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/8">ici</a> ou en consultant les dÃ©tails du commercial de matricule <em>C00002</em> (id 8), il est possible de modifier les informations du commercial d'identifiant 8 qui sont persistÃ©es en base de donnÃ©e lorsqu'on clique sur le bouton <em>Enregistrer</em>. L'URL qui est appelÃ© est <code>POST /commercials/8</code> avec les donnÃ©es du formulaire qui sont envoyÃ©es.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">7 - Suppression d'un Commercial</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/22">ici</a> ou en consultant les dÃ©tails du commercial de matricule <em>C00018</em> (id 22), il est possible de supprimer ce dernier lorsqu'on clique sur le bouton <em>Supprimer</em>. L'appel qui est effectuÃ© est <code>GET /employes/22/delete</code>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">8 - CrÃ©ation, modification et suppression d'un Technicien</h4>
                <p class="list-group-item-text">Faire la mÃªme chose que les trois questions prÃ©cÃ©dentes pour les techniciens. Le chemin de l'API est <code>/techniciens</code>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">9 - CrÃ©ation, modification et suppression d'un Manager</h4>
                <p class="list-group-item-text">Faire la mÃªme chose que la question prÃ©cÃ©dente pour les managers. Le chemin de l'API est <code>/managers</code>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">10 - Ajouter ou supprimer un technicien dans l'Ã©quipe d'un manager</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/532">ici</a> ou en consultant le dÃ©tail du manager <em>M00528</em> (id 532), il est possible de supprimer (Appel API <code>GET /managers/532/techniciens/576/delete</code>) un membre de son Ã©quipe (ici le technicien d'id 576) avec le bouton <span class="glyphicon glyphicon-remove"></span> et d'ajouter (Appel API <code>GET /managers/532/techniciens/add?matricule=T00110</code>) un membre Ã  l'Ã©quipe en renseignant son matricule (dans l'exemple T00110) et en cliquant sur le bouton <span class="glyphicon glyphicon-plus"></span>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">11 - Ajouter ou supprimer un manager Ã  un technicien</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/576">ici</a> ou en consultant le dÃ©tail du technicien <em>T00572</em> (id 576), il est possible de supprimer (GET /techniciens/576/manager/remove) son manager avec le bouton <span class="glyphicon glyphicon-remove"></span> et d'ajouter (Appel API <code>GET /techniciens/576/manager/M00528/add</code>) un manager en renseignant son matricule (dans l'exemple M00528) et en cliquant sur le bouton <span class="glyphicon glyphicon-plus"></span>.</p>
            </li>
        </ul>
    </div>
</div>
<%@ include file="tags/footer.jsp" %>


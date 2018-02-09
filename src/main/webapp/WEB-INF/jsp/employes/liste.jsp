<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../tags/header.jsp" %>
<% Integer p = (Integer) pageContext.findAttribute("page"); %>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1>Liste des employés</h1>
            <div class="btn-group">
                <a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Nouvel employé
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/employes/new/technicien">Technicien</a></li>
                    <li><a href="commercial/new">Commercial</a></li>
                    <li><a href="/employes/new/manager">Manager</a></li>
                </ul>
            </div>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th scope="col">
                        Matricule <a href=""><span class="glyphicon glyphicon-chevron-up"></span></a>
                    </th>
                    <th scope="col">
                        Nom <a href=""><span class="glyphicon glyphicon-chevron-down"></span></a>
                    </th>
                    <th scope="col">
                        <a href="">Prénom</a>
                    </th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="emp" items="${emps.getContent()}">
   					
                    <tr>
                        <th scope="row"><c:out value = "${emp.getMatricule()}"/></th>
                        <th scope="row"><c:out value = "${emp.getNom()}"/></th>
                        <th scope="row"><a href="/employes/<c:out value = "${emp.getId()}"/>"><c:out value = "${emp.getPrenom()}"/></a></th>                   
                    </tr>
   					
				</c:forEach>

                </tbody>
            </table>
            <div class="row">
                <div class="col-lg-6">
                    <p> Affichage des employés ${start} à ${end} sur un total de ${total} ${test} </p>
                </div>
                <div class="col-lg-6">
                    <ul class="pagination">
					<% if(p > 0) { %>
                        <li ><a href="/employes?page=${page-1}&size=10&sortProperty=matricule&sortDirection=ASC"><</a></li>
                        <% } %>
                        <li><a href="">Page ${page+1}</a></li>
                        <c:if test = "${page < nbrpage-1}">
                        <li ><a href="/employes?page=${page+1}&size=10&sortProperty=matricule&sortDirection=ASC">></a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../tags/footer.jsp" %>
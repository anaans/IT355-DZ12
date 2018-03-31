<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<h2>Apartman Results</h2>

<portlet:actionURL var="changeSearchUrl">
	<portlet:param name="execution" value="${flowExecutionKey}" />
	<portlet:param name="_eventId" value="changeSearch" />
</portlet:actionURL>
<a href="${changeSearchUrl}">Change Search</a>
	
<table class="summary">
	<thead>
		<tr>
			<th>Name</th>
			<th>Address</th>
			<th>City, State</th>
			<th>Zip</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="apartman" items="${apartmans}">
			<tr>
				<td>${apartman.name}</td>
				<td>${apartman.address}</td>
				<td>${apartman.city}, ${apartman.state}, ${apartman.country}</td>
				<td>${apartman.zip}</td>
				<td>
					<portlet:actionURL var="actionUrl">
						<portlet:param name="execution" value="${flowExecutionKey}" />
						<portlet:param name="_eventId" value="select" />
						<portlet:param name="apartmanId" value="${apartman.id}" />
					</portlet:actionURL>
					<a href="${actionUrl}">View Apartman</a>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${empty apartmans}">
		<tr>
			<td colspan="5">No apartmans found</td>
		</tr>
		</c:if>
	</tbody>
</table>

<c:if test="${searchCriteria.page > 0}">
	<portlet:actionURL var="prevResultsUrl">
		<portlet:param name="execution" value="${flowExecutionKey}" />
		<portlet:param name="_eventId" value="previous" />
	</portlet:actionURL>
	<a href="${prevResultsUrl}">Previous Results</a>
</c:if>
<c:if test="${not empty apartmans && fn:length(apartmans) == searchCriteria.pageSize}">
	<portlet:actionURL var="moreResultsUrl">
		<portlet:param name="execution" value="${flowExecutionKey}" />
		<portlet:param name="_eventId" value="next" />
	</portlet:actionURL>
	<a href="${moreResultsUrl}">More Results</a>
</c:if>		


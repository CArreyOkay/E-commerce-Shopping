<ol class="cntrtxt dropdown-menu " aria-labelledby="dropdownMenu1">
	<c:forEach items="${categories}" var="category"><li>
			<a href="${contextRoot}/show/category/${category.id}/products"
				id="a_${category.name}">${category.name}</a></li>
		</c:forEach>
		</ol>
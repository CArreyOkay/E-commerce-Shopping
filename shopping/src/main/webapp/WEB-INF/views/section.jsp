<c:forEach items="${categories}" var="category">

	<section class="padsection">
		<div class="container">
			<div class="row align-items-center">
			<c:if test="${category.id %2 != 0 }">
			<div class="col-lg-4 ">
					<div class="p-5"><a href="${contextRoot}/show/category/${category.id}/products">
						<img class="img-fluid rounded-circle" src="${images}/ad${category.id}.jpg" alt="ad${category.id}.jpg">
						</a>
					</div>
				</div>
				<div class="col-lg-4 ">
					<div class="p-5">
						<h2 class="display-4">${category.name}...</h2>
						<p>${category.description}</p>
					</div>
				</div><div class = "col-lg-4"></div>
			</c:if>
			<c:if test="${category.id %2 == 0 }">
			<div class = "col-lg-4"></div>
			<div class="col-lg-4 ">
					<div class="p-5">
						<h2 class="display-4">${category.name}...</h2>
						<p>${category.description}</p>
					</div>
				</div>
			<div class="col-lg-4 ">
					<div class="p-5"><a href="${contextRoot}/show/category/${category.id}/products">
						<img class="img-fluid rounded-circle" src="${images}/ad${category.id}.jpg" alt="ad${category.id}.jpg">
						</a>
					</div>
				</div>
			</c:if>
				
			</div>
		</div>
	</section>
	</c:forEach>
	
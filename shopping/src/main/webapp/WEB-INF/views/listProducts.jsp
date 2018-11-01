
<b>

	<div class="body1 wrapper container">

		<div class="row">

			<!-- to display the actual products -->
			<div class="col-md-12 footgeniusbreadcrump">

				<!-- Added breadcrumb component -->
				<div class="row">

					<div class="col-lg-12">

						<c:if test="${userClickAllProducts == true}">

							<script>
								window.categoryId = '';
							</script>

							<ol class="breadcrumb">


								<li><a href="${contextRoot}/home">Home</a></li>
								<li class="active">All Products</li>


							</ol>
						</c:if>


						<c:if test="${userClickCategoryProducts == true}">
							<script>
								window.categoryId = '${category.id}';
							</script>

							<ol class="breadcrumb">


								<li><a href="${contextRoot}/home">Home</a></li>
								<li class="active">Category</li>
								<li class="active">${category.name}</li>


							</ol>
						</c:if>


					</div>


				</div>


				<div class="col-lg-12">

					<div class="col-lg-12">
						<b>

							<table id="productListTable"
								class="table table-striped table-borderd ">
								<div class = "table-responsive"></div>
								<thead>

									<tr>
										<th></th>
										<th>Name</th>
										<th>Brand</th>
										<th>Price</th>
										<th>Qty.Avl</th>
										<th></th>

									</tr>

								</thead>



								<tfoot>

									<tr>
										<th></th>
										<th>Name</th>
										<th>Brand</th>
										<th>Price</th>
										<th>Qty.Avl</th>
										<th></th>

									</tr>

								</tfoot>
							</table>
						</b>
					</div>

				</div>


			</div>



		</div>






	</div>
</b>
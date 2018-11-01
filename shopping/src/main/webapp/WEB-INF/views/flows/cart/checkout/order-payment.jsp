<%@include file="../../flows-shared/header.jsp"%>
<div class="container">

	<div class="body1 row">
		<!--  To display all the goods -->
		<div class="col-md-6">

			<div class="row">
				<c:forEach items="${checkoutModel.cartLines}" var="cartLine">
					<div class="col-xs-12">

						<div>
							<h3>${cartLine.product.name}</h3>
							<hr />
							<h4>Quantity -${cartLine.productCount}</h4>
							<h5>Buying Price - &#8377; ${cartLine.buyingPrice}/-</h5>
						</div>
						<hr />
						<div class="text-right">
							<h3>Grand Total - &#8377; ${cartLine.total}/-</h3>
						</div>
					</div>
				</c:forEach>
			</div>


		</div>

		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Payment Details</h3>
				</div>
				<div class="panel-body">
					<div class="radio">
						<label class="radio-inline"><input type="radio"
							id="radio1" name="optradio" checked>
							<form role="form">
								<fieldset>
									<div class="form-group">
										<label for="cardNumber"> CARD NUMBER</label>
										<div class="input-group">
											<input type="number" min=1000000000000000
												max=9999999999999999 class="form-control" id="cardNumber"
												onkeypress="validatecardlength(cardNumber,16)" 
												placeholder="Valid Card Number" maxlength="16" required
												autofocus /> <span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-7 col-md-7">
											<div class="form-group">
												<label for="expityMonth">EXPIRY DATE</label> <br />
												<div class="col-xs-6 col-lg-6 pl-ziro">
													<input type="number" min=0 max=12 class="form-control"
														id="expityMonth" placeholder="MM" maxlength="2"  required />
												</div>
												<div class="col-xs-6 col-lg-6 pl-ziro">
													<input type="number" min=18 max=30 class="form-control"
														id="expityYear" placeholder="YY" maxlength="2" required />
												</div>
											</div>
										</div>
										<div class="col-xs-5 col-md-5 pull-right">
											<div class="form-group">
												<label for="cvCode"> CV CODE</label> <input type="number"
													min=100 max=999 class="form-control" id="cvCode"
													pattern="\d{10}$" placeholder="CV" maxlength="3" required />
											</div>
										</div>
									</div>
								</fieldset>
							</form></label> <label class="radio-inline"><input type="radio"
							id="radio2" name="optradio">Cash on delivery</label>
					</div>
				</div>
			</div>
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a href="#"><span
						class="badge pull-right"> &#8377;
							${checkoutModel.checkoutTotal}/-</span> Final Payment</a></li>
			</ul><div id="values"></div>
			<br /> <a href="${flowExecutionUrl}&_eventId_pay"
				id="ProceedPayment" class="btn btn-success btn-lg btn-block"
				role="button" >Pay</a>

		</div>
		<script>
		var cn = document.getElementById("cardNumber").value.toString();
		var em = document.getElementById("expityMonth").value.toString();
		var ey = document.getElementById("expityYear").value.toString();
		var cvv = document.getElementById("cvCode").value.toString();
		function onclickvalidator(){
			if(cn.length == 16 && em.length == 2 && cn.length == 2 && cn.length == 3){
				return true;	
			}
			else{
				return false;
			}
			
		}
		</script>

	</div>
</div>
</div>
<%@include file="../../flows-shared/footer.jsp"%>
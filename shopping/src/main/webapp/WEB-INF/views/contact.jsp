
<div class="body1 container">

	<div class="row">

		<h1>Contact Us</h1>
		<hr>
		<div class="container contact-form">
			<div class="contact-image">
				<img src="http://www.faxback.com/Images/Support/ContactSupport.png"
					alt="rocket_contact" />
			</div>
			<form action="${contextRoot }/contact/feedback" method="get">
				<h3>Drop Us a Message</h3>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" name="name" class="form-control"
								placeholder="Your Name *" value="" />
						</div>
						<div class="form-group">
							<input type="text" name="email" class="form-control"
								placeholder="Your Email *" value="" />
						</div>
						<div class="form-group">
							<input type="text" name="number" class="form-control"
								placeholder="Your Phone Number *" value="" />
						</div>
						
					</div>
					<div class="col-md-6">
					<div class="form-group">
							<select name="product" class="form-control" >
							<c:forEach items="${products}" var="product">
							<option value="${product.name }">${product.name }</option>
							</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<textarea name="message" class="form-control" max=500
								placeholder="Your Message *" style="width: 100%; height: 150px;"></textarea>
						</div>
					</div>
					<div class = "col-md-12">
					<div class="form-group">
							<input type="submit" name="btnSubmit" class="btnContact"
								value="Send Message" />
						</div>
					</div>
				</div>
			</form>
		</div>

	</div>

</div>
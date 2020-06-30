<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="App/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/v/bs4/dt-1.10.18/b-1.5.2/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.4.0/sc-1.5.0/sl-1.2.6/datatables.min.css" />
<title>Credit card transaction verification.</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">-->

<!-- Custom styles for this template-->
<link href="App/css/sb-admin.css" rel="stylesheet">

<link rel="stylesheet" href="App/css/bootstrap.min.css">
<link rel="stylesheet" href="App/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="App/css/css-loader.css">
<script src="App/js/jquery.min.js"></script>
<script src="App/js/bootstrap.min.js"></script>
</head>

<body onload="mueveReloj()">
	<div class="loader loader-default" data-blink id="loaderDisplay"></div>
	<!--   
      <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
         <h5 class="my-0 mr-md-auto font-weight-normal">AmericaÃ¢â¬â¢s International PoC Development Team</h5>
         <nav class="my-2 my-md-0 mr-md-3"> <a class="p-2 text-dark" href="#">Features</a> <a class="p-2 text-dark" href="#">Enterprise</a> <a class="p-2 text-dark" href="#">Support</a> <a class="p-2 text-dark" href="#">Pricing</a> </nav>
         <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#settings-modal">
			Settings
			</button>
      </div>
      
      -->


	<script>
		document.getElementById('loaderDisplay').classList.add('is-active');
		document.getElementById("loaderDisplay").setAttribute("data-text",
				"Loading Page");
	</script>
	<nav class="navbar navbar-expand navbar-dark static-top"
		style="background-color: #F8F8F8;">
		<a class="navbar-brand mr-1" href="/"></a>
		<h4 style="font-weight: bold">America&#8216;s International PoC
			Development Team</h4>
		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<form name="form_reloj">
				<input type="text" name="reloj" size="35" id="relojDenver"
					style="background-color: #F8F8F8; color: black; font-family: Verdana, Arial, Helvetica; font-size: 10pt; border: none; text-align: center; float: right"
					onfocus="window.document.form_reloj.reloj.blur()">
			</form>
		</form>
		<a type="button" href="https://breeze2-196.collaboratory.avaya.com/services/AAADEVPoCDemoPage/Demos" class="btn btn-success mx-1" style="float: right;">Back to Demo Page</a>
		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" id="userDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black; cursor: pointer;"> 
					User
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item">${sessionScope.UserBeanSession.userName}</a>
					<div class="dropdown-divider"></div>
					<button type="button" class="dropdown-item"
						data-toggle="modal" data-target="#settings-modal">
						Settings</button>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
				
				
		</ul>

	</nav>


	<div class="pricing-header px-3 pt-md-5 pb-md-4 mx-auto text-center">
		<h1 class="display-4">Credit card transaction verification</h1>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-6">
				<div class="card mb-6 shadow-sm">
					<div class="card-header">
						<h4 class="my-0 font-weight-normal">Transactions</h4>
					</div>
					<div class="card-body" style="overflow-x: auto;">
						<table id="transactions-table" class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Amount</th>
									<th>Acoount</th>
									<th>Date</th>
									<th>Merch. Name</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>ID</th>
									<th>Amount</th>
									<th>Acoount</th>
									<th>Date</th>
									<th>Merch. Name</th>
								</tr>
							</tfoot>
						</table>
	
	
	
	
					</div>
	
					<button type="button" class="btn btn-success btn-lg"
						data-toggle="modal" data-target="#add-transaction-modal">Add</button>
					<!-- Modal Add Customer Modal -->
					<div class="modal fade" id="add-customer-modal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Add Customer</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form id="add-customer-frm">
										<div class="form-group">
											<label for="AccountLabel">Account</label> <input type="number"
												class="form-control" id="accountnum" placeholder="1">
										</div>
										<div class="form-group">
											<label for="EmailLabel">Email</label> <input type="email"
												class="form-control" id="email" placeholder="email@test.com">
										</div>
										<div class="form-group">
											<label for="FirstNameLabel">First Name</label> <input
												type="text" class="form-control" id="firstname"
												placeholder="John">
										</div>
										<div class="form-group">
											<label for="LastnameLabel">Last Name</label> <input
												type="text" class="form-control" id="lastname"
												placeholder="Doe">
										</div>
										<div class="form-group">
											<label for="PhoneLabel">Phone</label> <input type="tel"
												class="form-control" id="phone" placeholder="5555-6666">
										</div>
										<div class="form-group">
											<label for="PreferneceLabel">Preference</label><select
												id="preference" class="form-control">
												<option value="sms">SMS</option>
												<option value="email">Email</option>
												<option value="both">Both</option>
											</select>
										</div>
								</div>
								<div class="modal-footer">
									<input class="btn btn-success btn-lg" type="submit" value="Save">
									<button type="button" class="btn btn-secondary btn-lg"
										data-dismiss="modal">Cancel</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Fin Add Customer Modal -->
					<!-- Modal Edit Customer Modal -->
					<div class="modal fade" id="edit-customer-modal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Edit
										Customer</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form id="edit-customer-frm">
										<div class="form-group">
											<label for="AccountLabel">Account</label> <input type="number"
												class="form-control" id="accountnum-edit" placeholder="1"
												disabled>
										</div>
										<div class="form-group">
											<label for="EmailLabel">Email</label> <input type="email"
												class="form-control" id="email-edit"
												placeholder="email@test.com">
										</div>
										<div class="form-group">
											<label for="FirstNameLabel">First Name</label> <input
												type="text" class="form-control" id="firstname-edit"
												placeholder="John">
										</div>
										<div class="form-group">
											<label for="LastnameLabel">Last Name</label> <input
												type="text" class="form-control" id="lastname-edit"
												placeholder="Doe">
										</div>
										<div class="form-group">
											<label for="PhoneLabel">Phone</label> <input type="tel"
												class="form-control" id="phone-edit"
												placeholder="5555-6666-edit">
										</div>
										<div class="form-group">
											<label for="PreferneceLabel">Preference</label><select
												id="preference-edit" class="form-control">
												<option value="sms">SMS</option>
												<option value="email">Email</option>
												<option value="both">Both</option>
											</select>
										</div>
								</div>
								<div class="modal-footer">
									<input class="btn btn-success btn-lg" type="submit" value="Save">
									<button type="button" class="btn btn-secondary btn-lg"
										data-dismiss="modal">Cancel</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Fin Edit Customer Modal -->
					<!-- Modal Delete Customer Modal -->
					<div class="modal fade" id="delete-customer-modal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Delete
										Customer</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form id="delete-customer-frm">
										<div class="form-group">
											<label for="AccountLabel">Account</label> <input type="number"
												class="form-control" id="accountnum-delete" placeholder="1"
												disabled>
										</div>
										<div class="form-group">
											<label for="EmailLabel">Email</label> <input type="email"
												class="form-control" id="email-delete"
												placeholder="email@test.com" disabled>
										</div>
										<div class="form-group">
											<label for="FirstNameLabel">First Name</label> <input
												type="text" class="form-control" id="firstname-delete"
												placeholder="John" disabled>
										</div>
										<div class="form-group">
											<label for="LastnameLabel">Last Name</label> <input
												type="text" class="form-control" id="lastname-delete"
												placeholder="Doe" disabled>
										</div>
										<div class="form-group">
											<label for="PhoneLabel">Phone</label> <input type="tel"
												class="form-control" id="phone"
												placeholder="5555-6666-delete" disabled>
										</div>
										<div class="form-group">
											<label for="PreferneceLabel">Preference</label> <input
												type="text" class="form-control" id="preference-delete"
												placeholder="SMS" disabled>
										</div>
								</div>
								<div class="modal-footer">
									<input class="btn btn-danger btn-lg" type="submit"
										value="Delete">
									<button type="button" class="btn btn-secondary btn-lg"
										data-dismiss="modal">Cancel</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Fin Delete Customer Modal -->
	
					<!-- Modal Add Transactions Modal -->
					<div class="modal fade" id="add-transaction-modal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Add
										Transaction</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form id="add-transaction-frm">
										<div class="form-group">
											<label for="AccountLabel">Transaction</label> <input
												type="number" class="form-control" id="transaction"
												placeholder="1">
										</div>
										<div class="form-group">
											<label for="AmmountLabel"></label>Ammount <input type="number"
												min="0.00" max="10000.00" step="0.01" class="form-control"
												id="ammount" placeholder="0.00">
										</div>
										<div class="form-group">
											<label for="AccountLabel"> </label>Account Number <input
												type="number" class="form-control" id="accountnumber">
										</div>
										<div class="form-group">
											<label for="TransactionLabel"> </label>Transaction Date <input
												type="date" class="form-control" id="transdate"
												placeholder="Doe">
										</div>
										<div class="form-group">
											<label for="MerchLabel"></label>Merchant <input type="text"
												class="form-control" id="merchantname" placeholder="Avaya">
										</div>
								</div>
								<div class="modal-footer">
									<input class="btn btn-success btn-lg" type="submit" value="Save">
									<button type="button" class="btn btn-secondary btn-lg"
										data-dismiss="modal">Cancel</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Fin Add Transactions Modal -->
					<!-- Modal Edit Transactions Modal -->
					<div class="modal fade" id="edit-transaction-modal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Edit
										Transaction</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form id="edit-transaction-frm">
										<div class="form-group">
											<label for="AccountLabel">Transaction</label> <input
												type="number" class="form-control" id="transaction-edit"
												placeholder="1">
										</div>
										<div class="form-group">
											<label for="AmmountLabel"></label>Ammount <input type="number"
												min="0.00" max="10000.00" step="0.01" class="form-control"
												id="ammount-edit" placeholder="0.00">
										</div>
										<div class="form-group">
											<label for="AccountLabel"> </label>Account Number <input
												type="number" class="form-control" id="accountnumber-edit">
										</div>
										<div class="form-group">
											<label for="TransactionLabel"> </label>Transaction Date <input
												type="date" class="form-control" id="transdate-edit"
												placeholder="Doe">
										</div>
										<div class="form-group">
											<label for="MerchLabel"></label>Merchant <input type="text"
												class="form-control" id="merchantname-edit"
												placeholder="Avaya">
										</div>
								</div>
								<div class="modal-footer">
									<input class="btn btn-success btn-lg" type="submit" value="Save">
									<button type="button" class="btn btn-secondary btn-lg"
										data-dismiss="modal">Cancel</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Fin Edit Transactions Modal -->
					<!-- Modal Delete Transactions Modal -->
					<div class="modal fade" id="delete-transaction-modal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Delete
										Customer</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form id="delete-transaction-frm">
										<div class="form-group">
											<label for="AccountLabel">Transaction</label> <input
												type="number" class="form-control" id="transaction-delete"
												placeholder="1" disabled>
										</div>
										<div class="form-group">
											<label for="AmmountLabel"></label>Ammount <input type="number"
												min="0.00" max="10000.00" step="0.01" class="form-control"
												id="ammount-delete" placeholder="0.00" disabled>
										</div>
										<div class="form-group">
											<label for="AccountLabel"> </label>Account Number <input
												type="number" class="form-control" id="accountnumber-delete"
												disabled>
										</div>
										<div class="form-group">
											<label for="TransactionLabel"> </label>Transaction Date <input
												type="date" class="form-control" id="transdate-delete"
												placeholder="Doe" disabled>
										</div>
										<div class="form-group">
											<label for="MerchLabel"></label>Merchant <input type="text"
												class="form-control" id="merchantname-delete"
												placeholder="Avaya" disabled>
										</div>
								</div>
								<div class="modal-footer">
									<input class="btn btn-danger btn-lg" type="submit"
										value="Delete">
									<button type="button" class="btn btn-secondary btn-lg"
										data-dismiss="modal">Cancel</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Fin Delete Transactions Modal -->
				</div>
			</div>
			<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-6">
				<div class="card mb-6 shadow-sm">
					<div class="card-header">
						<h4 class="my-0 font-weight-normal">Customers</h4>
					</div>
					<div class="card-body" style="overflow-x: auto;">
	
						<table id="customers-table"
							class="table table-bordered table-striped display">
							<thead>
								<tr>
									<th>Account</th>
									<th>Email</th>
									<th>F. Name</th>
									<th>L. Name</th>
									<th>Phone</th>
									<th>Preference</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Account</th>
									<th>Email</th>
									<th>F. Name</th>
									<th>L. Name</th>
									<th>Phone</th>
									<th>Preference</th>
								</tr>
							</tfoot>
						</table>
	
					</div>
					<button type="button" class="btn btn-success btn-lg"
						data-toggle="modal" data-target="#add-customer-modal">Add</button>
				</div>
			</div>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 border-top">
		<div>
			<div class="col-12 col-md-12">
				<small class="d-block mb-3 text-muted">&copy;Avaya</small>
			</div>
		</div>
	</footer>


	<div class="modal" tabindex="-1" role="dialog" id="success-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Success</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Your Data has been successfully saved.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Settings -->
	<div class="modal fade" id="settings-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Settings</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group">
						<select class="custom-select" id="lang-select"
							aria-label="Example select with button addon">
							<option selected>Choose...</option>
							<option value="es-ES_LauraVoice">EspaÃÂ±ol</option>
							<option value="pt-BR_IsabelaVoice">Portuguese</option>
							<option value="en-US_AllisonVoice">English</option>
						</select>
					</div>

					<label for="basic-url">EndPoints</label>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon3">EventConnector</span>
						</div>
						<input type="text" class="form-control" id="endpoint-url"
							aria-describedby="basic-addon3">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon3">Transactions</span>
						</div>
						<input type="text" class="form-control" id="endpoint1-url"
							aria-describedby="basic-addon3">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon3">Customers</span>
						</div>
						<input type="text" class="form-control" id="endpoint2-url"
							aria-describedby="basic-addon3">
					</div>

					<div class="input-group-append">
						<button class="btn btn-outline-secondary" id="savesettings-btn"
							type="button">Save</button>
					</div>

				</div>

			</div>
		</div>



	</div>
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">¿Seguro deseas
						salir?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">Selecciona Logout para cerrar sesion y
					salir</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" id="logOutButton">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="App/js/jquery-3.3.1.min.js"></script>
	<!-- <script type="text/javascript" src="App/js/bootstrap.bundle.min.js"></script> -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<script type="text/javascript" src="App/js/datastorage.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.18/b-1.5.2/sl-1.2.6/datatables.min.js"></script>
	<script type="text/javascript" src="App/js/timeDenver.js"></script>
	<script type="text/javascript" src="App/js/custom.js"></script>
</body>
</html>
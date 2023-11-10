<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<title>Ejemplos de CIBERTEC - Jorge Jacinto</title>
</head>
<body>

<form id="id_form"> 
	<div class="container">
		<h3>Consulta Cliente</h3>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-6">
				<label class="control-label" for="id_nombres">Nombres y	Apellidos</label> 
				<input class="form-control" type="text" id="id_nombres"	name="paranomApe">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_estado">Estado</label> 
				<input class="form-control" type="checkbox" id="id_estado" name="paramEstado" checked="checked">
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_dni">DNI</label>
				<input class="form-control" id="id_dni" name="dni" placeholder="Ingrese el número de dni" type="text" maxlength="8"/>

			</div>

		</div>

		<div class="row" style="margin-top: 3%">
			<div class="col-md-12" align="center">
				<button type="button" class="btn btn-primary" id="id_btn_filtra">FILTRA</button>
				<button type="button" class="btn btn-primary" id="id_btn_reporte">PDF</button>
			</div>
		</div>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-12">
				<table id="id_table" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 5%">ID</th>
							<th style="width: 22%">Nombre</th>
							<th style="width: 23%">DNI</th>
							<th style="width: 15%">ESTADO</th>
							<th style="width: 15%">País</th>
							<th style="width: 15%">CATEGORIA</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</form>
<script type="text/javascript">













//para el boton del pdf con le form limpia todo pq es un form
$("#id_btn_reporte").click(function(){
	
	$("#id_form").attr('action','reporteEmpleadoPdf');
	$("#id_form").submit();
	
});









$("#id_btn_filtra").click(function(){
	var varEstado = $("#id_estado").is(':checked') ? 1 : 0;  

	var varNomApe = $("#id_nombres").val();
	var varDni = $("#id_dni").val();

	
	console.log(">> varEstado >> " + varEstado );
	console.log(">> varNomApe >> " + varNomApe );
	console.log(">> varDni >> " + varDni );



	
	$.getJSON("consultaCliente", {"estado": varEstado, 
								   "nombre": varNomApe, 
								   "dni": varDni
								   }, function(data){
		agregarGrilla(data);
	});
});


function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: false,
			columns:[
				{data: "idCliente"},
				{data: "nombre"},
				{data: "dni"},
				{data: "fechaNacimiento"},
				{data: "pais.nombre"},
				{data: function(row, type, val, meta){
					var salida = (row.estado == 1) ? 'Activo' : "Inactivo" ;
					return salida;
				},className:'text-center'},	
			]                                     
	    });
}

</script>

</body>
</html>









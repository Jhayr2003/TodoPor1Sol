<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Productos</title>
      
        <script src="node_modules/bootstrap/dist/ js/bootstrap.min.js"></script>
        <link href="resources/css/RegistroProducto/EstiloRegProd.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="body-RegiProd">

          
<!-- CONTENEDOR REGISTRO DE NUEVOS PRODUCTOS -->
<div class="Container-RegistroProductos negrita"> 
    
    <!--INGRESAR DATOS -->
    <div class="IngreseDatos"> Ingrese los Datos</div>
    <form id="form-validation" action="gu ardar.jsp" method="post" novalidate>
        <div class="form-group">
            <span> Nombre </span>
            <input type="text" style="text-align: center" placeholder="" required>
            <small id="nombre-help" style="display: none;">Ingresar nombre</small>
        </div>
        <!--DESCRIPCI�N-->
        <div class="form-group">
            <span> Descripci�n </span>
            <textarea rows="4" cols="20" placeholder="" ></textarea>
            <small id="descripcion-help" style="display: none;"></small>
        </div>
        <!--FECHA DE VENCIMIENTO-->
        <div class="form-group">
            <span> Fecha de Vencimiento </span>
            <input type="date" id="fecha-vencimiento" name="fecha-vencimiento" required>
            <small id="fecha-help" style="display: none;">Ingresar fecha de vencimiento</small>
        </div>
        <!--STOCK-->
        <div class="form-group">
            <span> Stock </span>
            <input type="number" placeholder="" min="0" required>
            <small id="stock-help" style="display: none;">Ingresar stock</small>
        </div>
        <!--PRECIO-->
        <div class="form-group">
            <span> Precio </span>
            <input type="number" placeholder="" min="0" step="any" required> <!--any para que reciba decimales-->
            <small id="precio-help" style="display: none;">Ingresar precio</small>
        </div>
        <!--PROVEEDORES-->
        <div class="form-group">
            <span> Proveedor </span>
            <select id="proveedores" name="proveedores" required>
                <option value="" selected="selected"></option>
                <option value="Lab">Lab</option>
                <option value="Dove">Dove</option>
            </select>
            <small id="proveedor-help" style="display: none;">Ingresar proveedor</small>
        </div>
        <!--CATEGORIA-->
        <div class="form-group"  >
            <span class="categoria"> Categoria </span>
            <select id="categoria" name="categoria" required>
                <option value="" selected="selected"></option>
                <option value="Generico">Generico</option>
                <option value="Original">Original</option>
            </select>
            <small id="categoria-help" style="display: none;">Ingresar categoria</small>
        </div>
        <div class="button" style="text-align: center">
            <input type="submit" value="Guardar">
        </div>
    </form>
</div>

 <!--SCRIPT PARA VALIDAR EL INGRESO DE DATOS-->
<script>
document.getElementById("form-validation").addEventListener("submit", function(e) {
    e.preventDefault(); // Evita que el formulario sea enviado sin antes ser revisado
    const form = e.target;
    mostrarMensajesAyuda(form);

    if (form.checkValidity()) {
        form.submit(); // Si el formulario es v�lido, proceder a enviarlo
    }
});

function mostrarMensajesAyuda(form) { 
    const formGroups = form.querySelectorAll('.form-group'); //Seleccionar todos los grupos form-group que estan dentro del formulario
    formGroups.forEach(formGroup => {
        const input = formGroup.querySelector('input, textarea, select'); //Selecciona a todos los input, textarea y select
        const small = formGroup.querySelector('small');//Selecciona a todos los small
        if (!input.validity.valid) {
            small.style.display = 'block'; //si el campo no es v�lido, se muestra el mensaje de ayuda
        } else {
            small.style.display = 'none'; //si el campo es v�lido, no se muestra el mensaje de ayuda 
        }
    });
}

</script>

</body>
</html>


$(document).ready(function () {

    $("#form-login").submit(function (event) {

        event.preventDefault();
        autenticarUsuario();
    });

    $("#form-register").submit(function (event) {

        event.preventDefault();
        registrarUsuario();
    });


});

function autenticarUsuario() {


    let id_usuario = $("#id_usuario").val();
    let contrasena_usuario = $("#contrasena_usuario").val();

    $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletUsuarioLogin",
        data: $.param({
            id_usuario: id_usuario,
            contrasena_usuario: contrasena_usuario
        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {
                $("#login-error").addClass("d-none");
                let id_usuario = parsedResult['id_usuario'];
                document.location.href = "home.html?id_usuario=" + id_usuario;
            } else {
                $("#login-error").removeClass("d-none");
            }
        }
    });
}
function registrarUsuario() {

    let id_usuario = $("#input-id_usuario").val();
    let contrasena_usuario = $("#input-contrasena_usuario").val();
    let contrasenaConfirmacion = $("#input-contrasena-repeat").val();
    let nombre = $("#input-nombre").val();
    let apellidos = $("#input-apellidos").val();
    let correo = $("#input-correo").val();
    let telefono = $("#input-telefono").val();
    let premium = $("#input-premium").prop("checked");

    if (contrasena == contrasenaConfirmacion) {

        $.ajax({
            type: "GET",
            dataType: "html",
            url: "./ServletUsuarioRegister",
            data: $.param({
                id_usuario: id_usuario,
                contrasena_usuario: contrasena_usuario,
                nombre: nombre,
                apellidos: apellidos,
                correo: correo,
                telefono: telefono,
                premium: premium
            }),
            success: function (result) {
                let parsedResult = JSON.parse(result);

                if (parsedResult != false) {
                    $("#register-error").addClass("d-none");
                    let id_usuario = parsedResult['id_usuario'];
                    document.location.href = "home.html?id_usuario=" + id_usuario;
                } else {
                    $("#register-error").removeClass("d-none");
                    $("#register-error").html("Error en el registro del usuario");
                }
            }
        });
    } else {
        $("#register-error").removeClass("d-none");
        $("#register-error").html("Las contraseÃ±as no coinciden");
    }
}

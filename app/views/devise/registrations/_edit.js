/*FUNCIÓN PARA MOSTRAR LOS CAMPOS PARA CAMBIAR CONTRASEÑA*/
function habilitar_cambio_contraseña(){
    $("#cambiar-contraseña").hide();
    $("#hide").hide();
    $("#show").show();
    $("#hide").click(function(){
        $("#cambiar-contraseña").hide();
        $('#user_password_confirmation').attr('required', false);
        $("#hide").hide();
        $("#show").show();
    });
    $("#show").click(function(){
        $("#cambiar-contraseña").show();
        $('#user_password_confirmation').attr('required', true);
        $("#hide").show();
        $("#show").hide();
    });
}
function habilitar_campos() {
  if($('#user_tipo_participacion').val()=="2")
  {
    $('#otros_campos_participacion_centro').show();
    $('#user_centers_id').attr('disabled', true);
    $('#campos_institucion').hide();
    $('#user_tipo_institucion').attr('required', false);
    $('#user_institucion').attr('required', false);
  }
  else{
    $('#otros_campos_participacion_centro').hide();
    $('#user_centers_id').attr('disabled', false);
    $('#campos_institucion').show();
    $('#user_tipo_institucion').attr('required', true);
    $('#user_institucion').attr('required', true);
  }
}
// function habilitar_div_otros_campos_center() {
//   $('#otros_campos_center').hide();
//   if($('#user_tipo_institucion').val()=="1")
//        {
//         $('#otros_campos_center').show();
//         $('#user_centers_id').attr('required', true);
//         $('#otros_campos_institucion').hide();
//         $('#user_institucion').attr('required', false);
//   }
//   else{
//         $('#otros_campos_center').hide();
//         $('#user_centers_id').attr('required', false);
//         $('#otros_campos_institucion').show();
//         $('#user_institucion').attr('required', true);
//   }
// }
// function habilitar_div_otros_change_tipoInstitucion(){
//   $('#user_tipo_institucion').change(function () {
//       if($(this).val()=="")
//          {
//          $('#otros_campos_center').hide();
//          $('#user_centers_id').attr('required', false);
//          }else{
//               if($(this).val()=="1"){
//                 $('#otros_campos_center').show();
//                 $('#user_centers_id').attr('required', true);
//                 $('#otros_campos_institucion').hide();
//                 $('#user_institucion').attr('required', false);
//               }
//               else{
//                 $('#otros_campos_center').hide();
//                 $('#user_centers_id').attr('required', false);
//                 $('#otros_campos_institucion').show();
//                 $('#user_institucion').attr('required', true);
//               }
//         }
//       });
// }
/*FUNCIÓN QUE INVOCA A TODAS LAS ANTERIORES*/
function start() {
  habilitar_cambio_contraseña();
  habilitar_campos();
}

/*FUNCIÓN INVOCADA AL CARGAR LA PÁGINA*/
window.onload = start;

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
function habilitar_div_otros_campos_autor() {
  if($('#user_tipo_participacion').val()=="1")
       {
        $('#otros_campos_autor').show();
        $('#user_authors_id').attr('required', true);
       }else{
            $('#otros_campos_autor').hide();
            $('#user_authors_id').attr('required', false);
       }
}
/*FUNCIÓN PARA MOSTRAR LOS CAMPOS AUXILIARES DE Universidad,
organismo y centro*/
// function habilitar_div_otros() {
//   if($('#user_universidad').val()==parseInt("4"))
//        {
//         $('#div_otra_universidad').show();
//         $('#user_otra_universidad').attr('required', true);
//        }else{
//             $('#div_otra_universidad').hide();
//             $('#user_otra_universidad').attr('required', false);
//        }
//   if($('#user_organismo').val()==parseInt("4"))
//        {
//         $('#div_otro_organismo').show();
//         $('#user_otro_organismo').attr('required', true);
//        }else{
//             $('#div_otro_organismo').hide();
//             $('#user_otro_organismo').attr('required', false);
//        }
//   if($('#user_centro').val()==parseInt("4"))
//        {
//         $('#div_otro_centro').show();
//         $('#user_otro_centro').attr('required',true);
//        }else{
//             $('#div_otro_centro').hide();
//             $('#user_otro_centro').attr('required',false);
//        }
// }
/*FUNCIÓN PARA MOSTRAR LOS CAMPOS AUXILIARES CUANDO CAMBIA EL VALOR DEL SELECT CORRESPONDIENTE*/
function habilitar_div_otros_change(){
  $('#user_tipo_participacion').change(function () {
      if($(this).val()=="")
         {
         $('#otros_campos_login').hide();
         $('#otros_campos_autor').hide();
         $('#user_authors_id').attr('required', false);
         }else{
              if($(this).val()=="1"){
                  $('#otros_campos_autor').show();
                  $('#user_authors_id').attr('required', true);
              }
              else{
                  $('#otros_campos_autor').hide();
                  $('#user_authors_id').attr('required', false);
              }
              $('#otros_campos_login').show();
        }
      });
  // $('#user_tipo_participacion').change(function () {
  //     if($(this).val()==parseInt("1"))
  //        {
  //        $('#div_tipo_beca').show();
  //        $('#user_tipo_beca').attr('required', true);
  //        }else{
  //             $('#div_tipo_beca').hide();
  //             $('#user_tipo_beca').attr('required', false);
  //       }
  //     });
// $('#user_tipo_participacion').change(function () {
//     if($(this).val()==parseInt("1"))
//        {
//        $('#div_tipo_beca').show();
//        $('#user_tipo_beca').attr('required', true);
//        }else{
//             $('#div_tipo_beca').hide();
//             $('#user_tipo_beca').attr('required', false);
//       }
//     });
// $('#user_organismo').change(function () {
//     if($(this).val()==parseInt("4"))
//        {
//        $('#div_otro_organismo').show();
//        $('#user_otro_organismo').attr('required', true);
//        }else{
//             $('#div_otro_organismo').hide();
//             $('#user_otro_organismo').attr('required', false);
//        }
//     });
// $('#user_universidad').change(function () {
//     if($(this).val()==parseInt("4"))
//        {
//        $('#div_otra_universidad').show();
//        $('#user_otra_universidad').attr('required', true);
//        }else{
//             $('#div_otra_universidad').hide();
//             $('#user_otra_universidad').attr('required', false);
//        }
//     });
// $('#user_centro').change(function () {
//     if($(this).val()==parseInt("4"))
//        {
//        $('#div_otro_centro').show();
//        $('#user_otro_centro').attr('required',true);
//        }else{
//             $('#div_otro_centro').hide();
//             $('#user_otro_centro').attr('required',false);
//        }
//     });
}
/*FUNCIÓN QUE INVOCA A TODAS LAS ANTERIORES*/
function start() {
  habilitar_cambio_contraseña();
  habilitar_div_otros_campos_autor();
  habilitar_div_otros_change();
}

/*FUNCIÓN INVOCADA AL CARGAR LA PÁGINA*/
window.onload = start;

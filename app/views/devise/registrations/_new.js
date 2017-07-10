function habilitar_div_otros_campos() {
  if(document.getElementById("user_tipo_participacion").value == "")
       {
        $('#otros_campos_login').hide();
        $('#campos_institucion').hide();
        $('#otros_campos_participacion_centro').hide();
       }else{
            $('#otros_campos_login').show();
       }
}
function habilitar_div_otros_change_tipoParticipacion(){
$('#user_tipo_participacion').change(function () {
    if($(this).val()=="")
       {
       $('#otros_campos_login').hide();
       $('#campos_institucion').hide();
       $('#otros_campos_participacion_centro').hide();
       }else{
            if($(this).val()=="1"){
            //Se eligió participación Autor
              $('#campos_institucion').show();
              $('#user_institucion').attr('required', true);
              $('#user_tipo_institucion').attr('required', true);
              $('#user_centers_id').attr('required', true);
              $('#otros_campos_participacion_centro').hide();
            }
            else if ($(this).val()=="2") {
            //Se eligió participación Centro
              $('#otros_campos_participacion_centro').show();
              $('#campos_institucion').hide();
              $('#user_centers_id').attr('required', true);
              $('#user_institucion').attr('required', false);
              $('#user_tipo_institucion').attr('required', false);
              window.alert('Atención: Tenga en cuenta que solo un representante del centro se podrá inscribir bajo esta modalidad, se recomienda que el mismo sea la Autoridad máxima del centro.');
            }
            else{
            //Se eligió participación Asistente
              $('#campos_institucion').show();
              $('#user_institucion').attr('required', true);
              $('#user_tipo_institucion').attr('required', true);
              $('#otros_campos_participacion_centro').hide();
              $('#user_centers_id').attr('required', false);
            }
            $('#otros_campos_login').show();
      }
    });
}

function habilitar_div_otros_change_tipoInstitucion(){
  $('#user_tipo_institucion').change(function () {
      if($(this).val()=="")
      {
         $('#campos_institucion').hide();
         $('#user_institucion').attr('required', false);
         $('#user_tipo_institucion').attr('required', false);
      }
      else
      {
        $('#campos_institucion').show();
        $('#user_institucion').attr('required', true);
        $('#user_tipo_institucion').attr('required', true);
      }
  });
}

/*FUNCIÓN QUE INVOCA A TODAS LAS ANTERIORES*/
function start() {
  document.getElementById("user_tipo_participacion").value = "";
  habilitar_div_otros_campos();
  habilitar_div_otros_change_tipoParticipacion();
  habilitar_div_otros_change_tipoInstitucion();
}

/*FUNCIÓN INVOCADA AL CARGAR LA PÁGINA*/
window.onload = start;

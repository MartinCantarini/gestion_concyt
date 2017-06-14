function habilitar_div_otros_campos() {
  if($('#user_tipo_participacion').val()=="")
       {
        $('#otros_campos_login').hide();
        $('#otros_campos_autor').hide();
       }else{
            $('#otros_campos_login').show();
       }
}
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
}
/*FUNCIÓN QUE INVOCA A TODAS LAS ANTERIORES*/
function start() {
  habilitar_div_otros_campos();
  habilitar_div_otros_change();
}

/*FUNCIÓN INVOCADA AL CARGAR LA PÁGINA*/
window.onload = start;

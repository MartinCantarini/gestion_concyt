# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#FORMATOS DE POSTERS
Format.create(nombre: 'Formato 1');
Format.create(nombre: 'Formato 2');

#TIPO DE DNI USUARIOS
Document.create(nombre: 'Documento Nacional de Identidad');
Document.create(nombre: 'Libreta Cívica');
Document.create(nombre: 'Libreta de Enrolamiento');

#PARTICIPACION USUARIOS
Participation.create(nombre: 'Autor');
Participation.create(nombre: 'Asistente');

#TIPO DE AUTORES
Author.create(nombre: 'Investigador');
Author.create(nombre: 'Personal de Apoyo');
Author.create(nombre: 'Becario (CIC)');

#INSTITUCION USUARIOS
Institution.create(nombre: 'Centro');
Institution.create(nombre: 'Empresa');
Institution.create(nombre: 'ONG');
Institution.create(nombre: 'Organismo Público');
Institution.create(nombre: 'Universidad');
Institution.create(nombre: 'Otro');

#ESTADOS DE TRABAJOS
State.create(nombre: 'Evaluación');
State.create(nombre: 'Aprobado');
State.create(nombre: 'Seleccionado para exponer');
State.create(nombre: 'Desaprobado');

#SESIONES DE TRABAJO
Session.create(nombre: 'Desarrollo socio-territorial y la planificación urbano-regional frente a los retos hídricos');
Session.create(nombre: 'Energías para el desarrollo sostenible');
Session.create(nombre: 'Medioambiente y riesgo salud');
Session.create(nombre: 'Diseños institucionales para integrar conocimiento en las políticas públicas');

#USUARIOS DE PRUEBA

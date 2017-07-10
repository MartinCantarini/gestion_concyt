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
Participation.create(nombre: 'Centro');
Participation.create(nombre: 'Asistente');

#TIPO DE AUTORES
Author.create(nombre: 'Investigador');
Author.create(nombre: 'Personal de Apoyo');
Author.create(nombre: 'Becario (CIC)');
Author.create(nombre: 'Ninguna');

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
State.create(nombre: 'En admisión');

#SESIONES DE TRABAJO
Session.create(nombre: 'Desarrollo socio-territorial y la planificación urbano-regional frente a los retos hídricos');
Session.create(nombre: 'Energías para el desarrollo sostenible');
Session.create(nombre: 'Medioambiente y riesgo salud');
Session.create(nombre: 'Diseños institucionales para integrar conocimiento en las políticas públicas');
Session.create(nombre: 'Otra');

#CENTROS DE INVESTACIÓN
Center.create(siglas: '', nombre:'', director:'');
Center.create(siglas: 'LINTA', nombre:'Laboratorio de Investigación del Territorio y el Ambiente', director:'Alfredo CONTI',inscripto:0);
Center.create(siglas: 'LAL', nombre:'Laboratorio de Acústica y Luminotécnia', director:'Pablo IXTAINA ',inscripto:0);
Center.create(siglas: 'CEMECA', nombre:'Centro de Investigación en Metrología y Calidad', director:'Luis MARTORELLI',inscripto:0);
Center.create(siglas: 'CST', nombre:'Centro de Servicios Tecnológicos e Innovación Productiva', director:'',inscripto:0);
Center.create(siglas: 'LEMIT', nombre:'Laboratorio de Entrenamiento Multidisciplinario para la investigación Tecnólogica', director:'Luis Pascual TRAVERSA',inscripto:0);
Center.create(siglas: 'CEREN', nombre:'Centro de Estudios en Rehabilitación Nutricional y Desarrollo Infantil', director:'María Susana ORTALE',inscripto:0);
Center.create(siglas: 'CESGI', nombre:'Centro de Investigación y Servicios en Gestión de Información', director:'Marisa Raquel DE GIUSTI',inscripto:0);
Center.create(siglas: 'CIDEPINT', nombre:'Centro de Investigación y Desarrollo en Tecnología de Pinturas', director:'Dr. Roberto ROMAGNOLI',inscripto:0);
Center.create(siglas: 'CIOP', nombre:'Centro de Investigaciones Opticas', director:'Dr. Jorge Omar TOCHO',inscripto:0);
Center.create(siglas: 'CETMIC', nombre:'Centro de Tecnología de Recursos Minerales y Cerámica', director:'Dr. Alberto Néstor SCIAN',inscripto:0);
Center.create(siglas: 'IMBICE', nombre:'Instituto Multidisciplinario de Biología Celular', director:'Dr. Mario Roberto ERMACORA',inscripto:0);
Center.create(siglas: 'CIVETAN', nombre:'Centro de Investigación en Veterinaria Tandil', director:'Dr. Carlos LANUSSE',inscripto:0);
Center.create(siglas: 'CIFICEN', nombre:'Centro de Investigación en Física e Ingeniería del Centro de la Provincia de Buenos Aires', director:'Dr. Alberto Somoza',inscripto:0);
Center.create(siglas: 'PLAPIMU-LASEISIC', nombre:'Planta Piloto Multipropositos', director:'Dr. Horacio THOMAS',inscripto:0);
Center.create(siglas: 'CIDCA', nombre:'Centro de Investigacion y Desarrollo en Criotecnologia de Alimentos', director:'Dra. Andrea Gomez Zavaglia',inscripto:0);
Center.create(siglas: 'INREMI', nombre:'Instituto de Recursos Minerales', director:'Dr. Isidoro SCHALAMUK',inscripto:0);
Center.create(siglas: 'IHLLA', nombre:'Instituto de Hidrología de Llanuras', director:'Dr. Luis VIVES',inscripto:0);
Center.create(siglas: 'PLADEMA', nombre:'Laboratorio de Plasmas Densos Magnetizados', director:'Dr. Marcelo VENERE',inscripto:0);
Center.create(siglas: 'IDIP', nombre:'Instituto de Desarrollo e Investigaciónes Pediatricas', director:'Dr. Horacio GONZALEZ',inscripto:0);
Center.create(siglas: 'CEDETS', nombre:'Centro de Emprendedorismo y Desarrollo Territorial Sustentable', director:'Dr. José PORRAS',inscripto:0);
Center.create(siglas: 'IAR', nombre:'Instituto Argentino de Radioastronomía', director:' Dr. Marcelo ARNAL',inscripto:0);
Center.create(siglas: 'IGCyC', nombre:'Instituto de Geología de Costas y del Cuaternario', director:'Dr. Julio Luis del RÍO',inscripto:0);
Center.create(siglas: 'CGAMA', nombre:'Centro de Geología Aplicada, Agua y Medio Ambiente', director:'Dra. Silvina Andrea MARFIL',inscripto:0);
Center.create(siglas: 'INTI-CUEROS', nombre:'Centro de Investigación de tecnología del Cuero', director:'Ing. Carlos MONTES',inscripto:0);
Center.create(siglas: 'CDI', nombre:'Centro de Investigación, Desarrollo e Innovación en Diseño Industrial', director:'Heraldo Roberto DE ROSE',inscripto:0);
Center.create(siglas: 'LIFIA', nombre:'Laboratorio de Investigación y Formación en Informática y Avanzada', director:'Dr. Gustavo Rossi',inscripto:0);
Center.create(siglas: 'CUDEMYP', nombre:'Centro Universitario de Estudios Microbiológicos y Parasitológicos', director:'Dr. Basualdo Farjat Juan Ángel',inscripto:0);
Center.create(siglas: 'CeTAD', nombre:'Centro de Técnicas Analógico/Digitales', director:'Ing. José Antonio Rapallini ',inscripto:0);
Center.create(siglas: 'CIProVe', nombre:'Centro de Investigación de Proteinas Vegetales', director:'Dr. Nestor Oscar CAFFINI',inscripto:0);
Center.create(siglas: 'III-LIDI', nombre:'Instituto de Investigación en Informatica', director:'Ing. Armando Eduardo DE GIUSTI',inscripto:0);
Center.create(siglas: 'LIDMA', nombre:'Laboratorio de Investigación y Desarrollo de Métodos Analíticos', director:'Dra. Cecilia Beatriz CASTELLS',inscripto:0);
Center.create(siglas: 'CEIDE', nombre:'Centro de Estudios Integrales de la Dinámica Exógena', director:'Dr. Eduardo Emilio KRUSE',inscripto:0);
Center.create(siglas: 'LIOMM', nombre:'Laboratorio de Investigaciones en Osteopatías y Metabolismo Mineral', director:'Dra. Ana Maria CORTIZO',inscripto:0);
Center.create(siglas: 'BIOLAB AZUL', nombre:'Laboratorio de Biología Funcional y Biotecnología', director:'Dr. Jhon ROGERS ',inscripto:0);
Center.create(siglas: 'ECienTec', nombre:'Grupo de Investigación Educación en Ciencias con Tecnologías', director:'Dra. Graciela SANTOS',inscripto:0);
Center.create(siglas: 'NEES', nombre:'Núcleo de Estudios Educacionales y Sociales', director:'Dra. Gregoria María Ana MANZIONE',inscripto:0);
Center.create(siglas:'LIDTUA' ,nombre: 'Laboratorio de Investigación, Desarrollo y Transferencia FIUA', director:'Dr. Victor Angel HERRERO',inscripto:0);
Center.create(siglas: 'ISCo', nombre:'IIstituto de Salud Colectiva "Leonardo Julio Werthein"', director:'Dr. Hugo Spinelli',inscripto:0);
Center.create(siglas: 'CIDEFI', nombre:'Centro de Investigaciones en Fitopatología', director:'Dr. Pedro BALATTI',inscripto:0);
Center.create(siglas: 'CEIPIL', nombre:'Centro de Estudios Interdisciplinarios en Problemáticas Internacionales y Locales', director:'Mag. José María J. Araya',inscripto:0);
Center.create(siglas: 'CINIBA', nombre:'Centro de Investigaciones Inmunológicas Básicas y Aplicadas', director:'Dra. Amada SEGAL EIRAS',inscripto:0);
Center.create(siglas: 'LADECOR', nombre:'Laboratorio de Estudio de Compuestos Ogánicos', director:'Dr. Rodolfo BRAVO',inscripto:0);
Center.create(siglas: 'I4', nombre:'Instituto de Investigaciones en Ingeniería Industrial', director:'Dr. Ing. Oscar Manuel PASCAL',inscripto:0);
Center.create(siglas: 'IIPAAS', nombre:'Instituto de Investigación sobre Producción Agropecuaria Ambiente y Salud', director:'Dr. César Gabriel LOPÉZ',inscripto:0);
Center.create(siglas: 'IIT&E', nombre:'Instituto de Investigaciones de Tecnología y Educación', director:'Dra. Marta Susana COMOGLIO',inscripto:0);
Center.create(siglas: 'IIB', nombre:'Instituto de Investigaciones Biológicas', director:'Dr. Gustavo Raúl DALEO',inscripto:0);
Center.create(siglas: 'CeBio', nombre:'Centro de BioInvestigaciones', director:'Dr. Rolando RIVERA POMAR',inscripto:0);
Center.create(siglas: 'IDI', nombre:'Instituto de Diseño e Investigación', director:'Mg. María de las Mercedes FILPE',inscripto:0);
Center.create(siglas: 'ITT', nombre:'Instituto de Investigación y Transferencia en Tecnología', director:'Mg. Hugo Dionisio RAMÓN',inscripto:0);
Center.create(siglas: 'II-UNS', nombre:'Instituto de Ingeniería de la Universidad Nacional del Sur', director:'Dr. Ing. Néstor Francisco ORTEGA',inscripto:0);
Center.create(siglas: 'LabEA', nombre:'Laboratorio de Estudios Apícolas', director:'Ing. Agr. Liliana María GALLEZ',inscripto:0);
Center.create(siglas: 'LISSI', nombre:'Laboratorio de Investigación + Desarrollo en Ingeniería de Software y Sistemas de Información', director:'Dr. Pablo Rubén FILLOTTRANI',inscripto:0);
Center.create(siglas: 'IIB-INTECH', nombre:'Instituto de Investigaciones Biotecnológicas - Instituto Tecnológico Chascomús', director:'Dr. Alberto Carlos C. FRASCH',inscripto:0);
Center.create(siglas: 'ICS', nombre:'Instituto de Ciencias de la Salud', director:'Dr. Arnaldo MEDINA',inscripto:0);

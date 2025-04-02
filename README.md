= Redmine Category Watchers Plugin

Este plugin permite asignar automáticamente seguidores a las peticiones según la categoría. 
Se añade una pestaña en el menú del proyecto para configurar los seguidores.

== Instalación

1. Clona o descarga el proyecto en la carpeta de plugins de Redmine.
   (Asegúrate de que la carpeta se llame 'redmine_category_watchers').

2. Ejecuta la migración de la base de datos:

3. Configura los permisos en la página "Roles y Permisos" (dentro del proyecto).

== Uso

1. Accede a la pestaña "Seguidores de Categorías" en el menú del proyecto.
2. Configura los seguidores predeterminados para cada categoría.
3. Los seguidores configurados se añadirán automáticamente a las peticiones creadas en esas categorías.

== Requisitos

- Redmine 4.x o superior.
- Ruby on Rails compatible con la versión de Redmine.

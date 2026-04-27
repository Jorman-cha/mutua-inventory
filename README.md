# 📦 mutua-inventory

> Sistema web de inventario y gestión de mantenimiento de equipos para la Fundación Mutua.

---

## 📋 Descripción

**mutua-inventory** es una aplicación web desarrollada como proyecto de prácticas laborales para la **Fundación Mutua**, una organización con más de 40 años de trayectoria en Bogotá, Colombia.

El sistema permite registrar y hacer seguimiento de todos los equipos de la fundación (computadores, impresoras, neveras, aires acondicionados, entre otros), y genera alertas automáticas cuando un equipo requiere mantenimiento preventivo o correctivo, indicando qué tipo de mantenimiento se debe realizar.

---

## ✨ Funcionalidades

- 📋 **Registro de equipos** — nombre, tipo, marca, modelo, número de serie, ubicación y estado
- 🔔 **Alertas de mantenimiento** — notificación en pantalla cuando un equipo tiene mantenimiento próximo o vencido
- 🛠️ **Historial de mantenimientos** — registro de cada intervención realizada con fecha, descripción y técnico responsable
- 📍 **Gestión por sede** — filtrado y visualización de equipos por sede o área
- 👥 **Control de usuarios** — roles diferenciados (administrador, técnico, consulta)
- 📊 **Reportes** — exportación de listados de equipos y mantenimientos en PDF o Excel

---

## 🛠️ Stack tecnológico

| Capa | Tecnología |
|---|---|
| Frontend | HTML, CSS, JavaScript |
| Backend | PHP |
| Base de datos | MySQL |
| Servidor | Hosting compartido (cPanel) |

---

## 📁 Estructura del proyecto

```
mutua-inventory/
├── index.php               # Página principal / dashboard
├── login.php               # Inicio de sesión
├── logout.php              # Cierre de sesión
│
├── equipos/
│   ├── lista.php           # Listado de todos los equipos
│   ├── agregar.php         # Formulario para registrar equipo
│   ├── editar.php          # Editar información de un equipo
│   └── detalle.php         # Vista detalle de un equipo
│
├── mantenimientos/
│   ├── lista.php           # Historial de mantenimientos
│   ├── agregar.php         # Registrar nuevo mantenimiento
│   └── alertas.php         # Equipos con mantenimiento pendiente
│
├── usuarios/
│   ├── lista.php           # Gestión de usuarios
│   └── agregar.php         # Crear usuario
│
├── reportes/
│   ├── equipos.php         # Reporte de inventario
│   └── mantenimientos.php  # Reporte de mantenimientos
│
├── assets/
│   ├── css/
│   │   └── styles.css
│   ├── js/
│   │   └── main.js
│   └── img/
│       └── logo.png
│
├── config/
│   └── db.php              # Conexión a la base de datos
│
├── includes/
│   ├── header.php
│   ├── footer.php
│   └── funciones.php
│
└── database/
    └── mutua_inventory.sql # Script de creación de la base de datos
```

---

## ⚙️ Instalación y configuración

### Requisitos previos

- PHP 7.4 o superior
- MySQL 5.7 o superior
- Servidor web con cPanel o XAMPP para desarrollo local

### Pasos para instalar

1. **Clona el repositorio**
   ```bash
   git clone https://github.com/tu-usuario/mutua-inventory.git
   ```

2. **Copia los archivos al servidor**  
   Sube el contenido de la carpeta al directorio `public_html` de tu hosting o a la carpeta `htdocs` de XAMPP.

3. **Crea la base de datos**  
   Desde cPanel o phpMyAdmin, crea una base de datos llamada `mutua_inventory` e importa el archivo:
   ```
   database/mutua_inventory.sql
   ```

4. **Configura la conexión**  
   Edita el archivo `config/db.php` con tus credenciales:
   ```php
   <?php
   $host     = "localhost";
   $usuario  = "tu_usuario_db";
   $password = "tu_contraseña_db";
   $base     = "mutua_inventory";

   $conn = new mysqli($host, $usuario, $password, $base);

   if ($conn->connect_error) {
       die("Error de conexión: " . $conn->connect_error);
   }
   ?>
   ```

5. **Accede al sistema**  
   Abre el navegador y entra a `http://localhost/mutua-inventory` (local) o al dominio del hosting.

---

## 📸 Capturas de pantalla

> _Las capturas se agregarán una vez el sistema esté en desarrollo._

| Vista | Descripción |
|---|---|
| Dashboard | Panel principal con resumen de equipos y alertas activas |
| Lista de equipos | Tabla con todos los equipos registrados y su estado |
| Alertas | Equipos con mantenimiento próximo o vencido |
| Detalle de equipo | Información completa e historial de mantenimientos |

---

## 🚀 Estado del proyecto

```
[🔄] En desarrollo — Fase: levantamiento de requerimientos
```

- [x] Levantamiento de información con la fundación
- [ ] Diseño de base de datos
- [ ] Maquetado de interfaces
- [ ] Desarrollo del backend
- [ ] Pruebas
- [ ] Despliegue en hosting

---

## 👤 Autor

**Nicolay** — Estudiante de Tecnología en Informática, quinto semestre  
UNIMINUTO — Corporación Universitaria Minuto de Dios  
Prácticas laborales — Fundación Mutua, Bogotá, Colombia

---

## 📄 Licencia

Este proyecto fue desarrollado con fines académicos como parte de las prácticas laborales del programa de Tecnología en Informática de UNIMINUTO.

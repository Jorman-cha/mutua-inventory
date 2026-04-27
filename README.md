# 📦 mutua-inventory

> Sistema web de inventario y gestión de activos (equipos y muebles) con alertas de mantenimiento para la Fundación Mutua.

---

## 📋 Descripción

**mutua-inventory** es una aplicación web desarrollada como proyecto de prácticas laborales para la **Fundación Mutua**, una organización con más de 40 años de trayectoria en Bogotá, Colombia, ubicada en el barrio Patio Bonito, localidad de Kennedy.

El sistema permite registrar y hacer seguimiento de todos los activos de la fundación — equipos (computadores, impresoras, neveras, aires acondicionados, entre otros) y mobiliario — a través de la hoja de vida de cada activo. Genera alertas automáticas cuando un activo requiere mantenimiento preventivo o correctivo, indicando qué tipo de mantenimiento se debe realizar, y produce reportes para apoyar la toma de decisiones administrativas.

🌐 Sitio web de la fundación: [fundacionpt.org](https://fundacionpt.org)

---

## ✨ Funcionalidades

- 📋 **Registro de activos** — equipos y muebles con nombre, tipo, marca, modelo, número de serie, ubicación y estado
- 📄 **Hoja de vida por activo** — historial completo de cada equipo o mueble desde su adquisición
- 🔔 **Alertas de mantenimiento** — notificación en pantalla cuando un activo tiene mantenimiento próximo o vencido
- 🛠️ **Historial de mantenimientos** — registro de cada intervención con fecha, descripción y técnico responsable
- 📍 **Gestión por sede** — filtrado y visualización de activos por sede o área
- 👥 **Control de usuarios** — roles diferenciados (administrador, técnico, consulta)
- 📊 **Reportes** — exportación de listados de activos y mantenimientos en PDF o Excel
- 📘 **Manual de uso** — documentación técnica y guía para el equipo administrativo

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
├── activos/
│   ├── lista.php           # Listado de todos los activos
│   ├── agregar.php         # Formulario para registrar activo
│   ├── editar.php          # Editar información de un activo
│   └── detalle.php         # Vista detalle / hoja de vida del activo
│
├── mantenimientos/
│   ├── lista.php           # Historial de mantenimientos
│   ├── agregar.php         # Registrar nuevo mantenimiento
│   └── alertas.php         # Activos con mantenimiento pendiente
│
├── usuarios/
│   ├── lista.php           # Gestión de usuarios
│   └── agregar.php         # Crear usuario
│
├── reportes/
│   ├── activos.php         # Reporte de inventario
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
├── docs/
│   └── manual_de_uso.pdf   # Manual para el equipo administrativo
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
| Dashboard | Panel principal con resumen de activos y alertas activas |
| Lista de activos | Tabla con todos los equipos y muebles registrados |
| Hoja de vida | Historial completo de un activo desde su adquisición |
| Alertas | Activos con mantenimiento próximo o vencido |

---

## 🚀 Estado del proyecto

```
[🔄] En desarrollo — Fase: levantamiento de requerimientos
```

- [x] Diagnóstico inicial y levantamiento de requerimientos
- [ ] Diseño de la arquitectura del aplicativo
- [ ] Diseño de base de datos
- [ ] Maquetado de interfaces
- [ ] Desarrollo de módulos principales (inventario, hojas de vida, alertas, reportes)
- [ ] Pruebas y ajustes con retroalimentación del equipo administrativo
- [ ] Despliegue en hosting
- [ ] Capacitación al equipo administrativo
- [ ] Entrega de manual de uso y documentación técnica

---

## 👥 Información del proyecto

| | |
|---|---|
| **Autor** | Nicolay — Estudiante de Tecnología en Informática, quinto semestre |
| **Universidad** | UNIMINUTO — Corporación Universitaria Minuto de Dios |
| **Entidad** | Fundación Mutua — Patio Bonito, Kennedy, Bogotá |
| **Acompañante práctica** | Yamile Torres (Administradora de empresas) |
| **Supervisor** | Gabriel Umaña (Comunicador social) |
| **Año** | 2026 |

---

## 📄 Licencia

Este proyecto fue desarrollado con fines académicos como parte de las prácticas laborales del programa de Tecnología en Informática de UNIMINUTO.

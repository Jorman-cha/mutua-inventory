# 📦 mutua-inventory

> **Fundación Mutua** · Sistema web de inventario y gestión de activos (equipos y mobiliario) con módulo de alertas automáticas de mantenimiento, hojas de vida individuales por activo y generación de reportes — migrando del control manual en Excel a una plataforma centralizada, funcional y escalable.

![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)

---

## 📋 Descripción

**mutua-inventory** es una solución tecnológica desarrollada como proyecto de prácticas laborales para la **Fundación Mutua**, organización social con más de 40 años de trayectoria ubicada en el barrio Patio Bonito, localidad de Kennedy, Bogotá.

La fundación contaba con un registro parcial de sus activos en hojas de cálculo de Excel, con información incompleta, hojas de vida inexistentes y sin ningún mecanismo para programar o anticipar los mantenimientos necesarios. Esto generaba fallas inesperadas en equipos, desconocimiento del historial técnico de los activos y gastos correctivos evitables.

El sistema centraliza el registro de todos los activos de la fundación — equipos tecnológicos, electrodomésticos y mobiliario — a través de **hojas de vida individuales**, genera **alertas automáticas de mantenimiento** preventivo y correctivo, y produce **reportes exportables** para apoyar la toma de decisiones administrativas.

🌐 Sitio web de la fundación: [fundacionpt.org](https://fundacionpt.org)

---

## ✨ Funcionalidades principales

* 🔐 **Control de acceso por roles:** Paneles diferenciados para Administrador, Técnico y Usuario de consulta.
* 📋 **Inventario de activos:** Registro completo de equipos y mobiliario con todos sus datos técnicos y administrativos.
* 📄 **Hoja de vida por activo:** Historial cronológico completo de cada activo desde su adquisición hasta el estado actual.
* 🛠️ **Módulo de mantenimientos:** Registro de cada intervención con fecha, tipo, descripción, técnico o proveedor, costo y próxima fecha programada.
* 🔔 **Alertas automáticas:** Panel de avisos en el dashboard que muestra activos con mantenimiento vencido o próximo a vencer (configurable: 7, 15 o 30 días de anticipación).
* 📊 **Reportes exportables:** Generación de listado de activos, historial de mantenimientos y activos con mantenimiento pendiente en formato PDF y Excel.
* 🗂️ **Gestión de usuarios (CRUD):** Registro, edición y eliminación de usuarios con asignación de roles desde el panel administrativo.
* 📘 **Documentación incluida:** Manual de usuario y guía de despliegue en hosting compartido para garantizar la sostenibilidad del sistema.

---

## 🛠️ Stack tecnológico

| Capa | Tecnología | Propósito |
| :--- | :--- | :--- |
| **Frontend** | HTML5, CSS3, JavaScript | Interfaz de usuario y lógica del lado del cliente |
| **Backend** | PHP 7.4+ | Lógica del servidor, rutas y procesamiento de datos |
| **Base de datos** | MySQL 5.7+ | Almacenamiento relacional normalizado (3FN) |
| **Reportes PDF** | TCPDF / mPDF | Generación de reportes sin dependencias externas de servidor |
| **Reportes Excel** | PhpSpreadsheet | Exportación de datos a formato .xlsx |
| **Servidor local** | XAMPP | Entorno de desarrollo (Apache + MySQL + PHP) |
| **Servidor producción** | Hosting compartido cPanel o local | Despliegue final en el servidor de la fundación o de forma local |

---

## 📁 Estructura del proyecto

```text
mutua-inventory/
│
├── index.php                   # Dashboard principal — panel de alertas y resumen de activos
├── login.php                   # Inicio de sesión con control de roles
├── logout.php                  # Cierre de sesión y destrucción de sesión PHP
│
├── activos/
│   ├── lista.php               # Listado paginado de activos con filtros y búsqueda
│   ├── agregar.php             # Formulario de registro de nuevo activo
│   ├── editar.php              # Edición de información de un activo existente
│   └── detalle.php             # Hoja de vida completa del activo e historial de mantenimientos
│
├── mantenimientos/
│   ├── lista.php               # Historial general de mantenimientos con filtros por período
│   ├── agregar.php             # Registro de nuevo mantenimiento vinculado a un activo
│   └── alertas.php             # Listado detallado de activos con mantenimiento pendiente o vencido
│
├── usuarios/
│   ├── lista.php               # Gestión de usuarios del sistema (solo administrador)
│   └── agregar.php             # Crear o editar un usuario y asignar rol
│
├── reportes/
│   ├── activos.php             # Reporte de inventario completo (PDF / Excel)
│   └── mantenimientos.php      # Reporte de mantenimientos por período (PDF / Excel)
│
├── assets/
│   ├── css/
│   │   └── styles.css          # Estilos globales, layout, tablas, formularios, alertas visuales
│   ├── js/
│   │   └── main.js             # Validaciones frontend, confirmaciones, interactividad
│   └── img/
│       └── logo.png            # Logo de la Fundación Mutua
│
├── config/
│   └── db.php                  # Configuración y conexión a la base de datos (PDO / mysqli)
│
├── includes/
│   ├── header.php              # Cabecera global con navbar y manejo de sesión
│   ├── footer.php              # Pie de página global
│   └── funciones.php           # Funciones reutilizables: sanitización, formateo, verificación de sesión
│
├── libs/
│   ├── tcpdf/                  # Librería para generación de PDFs (incluida en el proyecto)
│   └── PhpSpreadsheet/         # Librería para generación de archivos Excel
│
├── docs/
│   ├── manual_de_usuario.pdf   # Guía de uso paso a paso para el personal administrativo
│   └── guia_despliegue.pdf     # Instrucciones para despliegue en hosting compartido con cPanel
│
└── database/
    └── mutua_inventory.sql     # Script SQL completo: creación de tablas, índices y datos semilla
```

---

## ⚙️ Instalación y configuración local

### Requisitos previos

- PHP 7.4 o superior
- MySQL 5.7 o superior
- XAMPP (o cualquier servidor local con Apache + MySQL + PHP)

### Pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/tu-usuario/mutua-inventory.git
cd mutua-inventory
```

```
# 2. Iniciar XAMPP
# · Activar los servicios Apache y MySQL desde el panel de XAMPP
```

```sql
-- 3. Crear la base de datos
-- Abrir phpMyAdmin en http://localhost/phpmyadmin
-- Crear una base de datos llamada: mutua_inventory
-- Importar el archivo: database/mutua_inventory.sql
```

```php
// 4. Configurar la conexión — editar config/db.php
<?php
$host     = "localhost";
$usuario  = "root";           // usuario de tu MySQL local
$password = "";               // contraseña de tu MySQL local
$base     = "mutua_inventory";

$conn = new mysqli($host, $usuario, $password, $base);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>
```

```
# 5. Acceder al sistema
# Abrir el navegador en: http://localhost/mutua-inventory
```

> Para el despliegue en producción (hosting compartido con cPanel), consultar el archivo **`docs/guia_despliegue.pdf`** incluido en el repositorio.

---

## 🗺️ Vistas del sistema

| Ruta | Archivo | Descripción |
| :--- | :--- | :--- |
| `/` | `index.php` | Dashboard con panel de alertas y resumen de activos |
| `/login.php` | `login.php` | Inicio de sesión |
| `/activos/lista.php` | `lista.php` | Inventario completo con filtros y búsqueda |
| `/activos/detalle.php` | `detalle.php` | Hoja de vida del activo |
| `/mantenimientos/agregar.php` | `agregar.php` | Registrar mantenimiento |
| `/mantenimientos/alertas.php` | `alertas.php` | Panel de alertas detallado |
| `/reportes/activos.php` | `activos.php` | Exportar inventario en PDF / Excel |
| `/usuarios/lista.php` | `lista.php` | Gestión de usuarios (admin) |

---

## 📊 Fases del proyecto

| Fase | Actividades | Estado |
| :--- | :--- | :---: |
| **Fase 1** | Diagnóstico, levantamiento de requerimientos y definición del alcance | ✅ |
| **Fase 2** | Diseño de base de datos (ER, 3FN, script SQL) y maquetado de interfaces | ⏳ |
| **Fase 3** | Desarrollo de módulos: inventario, hojas de vida, mantenimientos, alertas, reportes | ⏳ |
| **Fase 4** | Pruebas, documentación técnica, manual de usuario y entrega formal | ⏳ |

---

## 🌍 Impacto esperado

| Dimensión | Descripción |
| :--- | :--- |
| 🤝 **Social** | Mejora la gestión administrativa de una organización social sin ánimo de lucro con más de 40 años de servicio a la comunidad |
| 💰 **Económico** | Reduce los gastos en mantenimientos correctivos al anticipar fallas mediante alertas preventivas |
| 💻 **Tecnológico** | Moderniza el control de activos reemplazando hojas de cálculo dispersas por un sistema centralizado, seguro y escalable |
| 📈 **Organizacional** | Genera trazabilidad completa del ciclo de vida de cada activo, apoyando la toma de decisiones con datos reales |

---

## 👥 Información del proyecto

| Campo | Detalle |
| :--- | :--- |
| **Autor** | Jorman Nicolay Chaves Orjuela — ID: 929690 |
| **Programa** | Tecnología en Informática — Quinto semestre |
| **Universidad** | UNIMINUTO — Corporación Universitaria Minuto de Dios |
| **Entidad** | Fundación Mutua — Patio Bonito, Kennedy, Bogotá |
| **Acompañante de práctica** | Yamile Torres (Administradora de empresas) |
| **Docente de seguimiento** | César Daniel Lavacude Rivera |
| **Período de práctica** | 13 de abril – 12 de agosto de 2026 |

---

## 📄 Licencia

Proyecto desarrollado con fines académicos como parte de las prácticas laborales del programa de Tecnología en Informática de UNIMINUTO. Su uso o distribución fuera del contexto académico debe ser acordado con el autor y la Fundación Mutua.

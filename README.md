# 🐱 Catbreeds App

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.38.5-blue" />
  <img src="https://img.shields.io/badge/Dart-3.10.4-blue" />
  <img src="https://img.shields.io/badge/Architecture-Clean-success" />
  <img src="https://img.shields.io/badge/State%20Management-BLoC-purple" />
</p>

> Aplicación desarrollada en **Flutter** para explorar razas de gatos 🐈, con información detallada, búsqueda en tiempo real y soporte offline.

---

## ✨ Características

* 🖼️ **Listado de razas** con imágenes
* 🔍 **Búsqueda en tiempo real**
* 📄 **Vista detallada** de cada raza
* 🎨 **Diseño moderno y limpio**
* 📡 **Manejo de conexión offline**
* ⚡ Arquitectura escalable y mantenible

---

## 🧰 Tecnologías utilizadas

| Tecnología   | Versión            |
| ------------ | ------------------ |
| Flutter      | 3.38.5             |
| Dart         | 3.10.4             |
| Arquitectura | Clean Architecture |
| Estado       | BLoC               |

---

## 📦 Dependencias principales

```yaml
dependencies:
  flutter_bloc: ^8.1.6
  http: ^1.2.2
  get_it: ^7.7.0
  cached_network_image: ^3.4.1
  dartz: ^0.10.1
  connectivity_plus: ^6.1.2
  cupertino_icons: ^1.0.8
```

---

## 🚀 Instalación y uso

### 1️⃣ Clonar el repositorio

```bash
git clone <repo-url>
cd cats_app
flutter pub get
```

### 2️⃣ Ejecutar la aplicación

```bash
flutter run
```

---

## 🏗️ Generación de builds

### 🤖 Android

```bash
flutter build apk --release
flutter build appbundle --release
```

### 🍎 iOS

```bash
flutter build ios --release
```

---

## 🗂️ Estructura del proyecto

```text
lib/
├── core/           # Lógica y utilidades compartidas
├── features/       # Módulos de la app
│   ├── breeds/     # Feature de razas de gatos
│   └── splash/     # Pantalla inicial
└── main.dart       # Punto de entrada
```

---

## 🌐 Configuración API

* **Endpoint principal:**

  ```
  https://api.thecatapi.com/v1/breeds
  ```

---

## 📸 Capturas de pantalla

> *(Agrega aquí screenshots de la app)*

---

## 📄 Licencia

Este proyecto se distribuye bajo la licencia **MIT**.

---

💡 *Proyecto ideal como base para apps Flutter con arquitectura limpia y buenas prácticas.*

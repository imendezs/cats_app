# Catbreeds App

Aplicación desarrollada en **Flutter** para explorar razas de gatos, con información detallada, búsqueda en tiempo real y soporte offline.

---

## Descripción

Catbreeds App es una aplicación móvil construida con Flutter que consume la API pública de *The Cat API* para mostrar un listado de razas de gatos. La aplicación está estructurada siguiendo los principios de **Clean Architecture**, lo que facilita su escalabilidad, mantenibilidad y testeo.

---

## Características

* Listado de razas con imágenes
* Búsqueda en tiempo real
* Vista detallada de cada raza
* Manejo de estados mediante BLoC
* Soporte para detección de conectividad
* Arquitectura modular y desacoplada

---

## Tecnologías utilizadas

| Tecnología        | Versión            |
| ----------------- | ------------------ |
| Flutter           | 3.38.5             |
| Dart              | 3.10.4             |
| Arquitectura      | Clean Architecture |
| Gestión de estado | BLoC               |

---

## Dependencias principales

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

## Instalación

1. Clonar el repositorio:

```bash
git clone <repo-url>
cd cats_app
flutter pub get
```

2. Ejecutar la aplicación:

```bash
flutter run
```

---

## Generación de builds

### Android

```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS

```bash
flutter build ios --release
```

---

## Estructura del proyecto

```text
lib/
├── core/           
├── features/       
│   ├── breeds/     
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── splash/     
└── main.dart       
```

---

## API

La aplicación consume el siguiente endpoint:

```
https://api.thecatapi.com/v1/breeds
```

---

## Consideraciones técnicas

* Uso de `Either` (dartz) para el manejo de errores
* Inyección de dependencias con `get_it`
* Separación clara entre capas de datos, dominio y presentación
* Preparada para extensión con nuevas features

---

## Licencia

Este proyecto se distribuye bajo la licencia MIT.

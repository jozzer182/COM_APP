# COM_APP

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)

## 📋 Descripción

**COM_APP** es una aplicación Flutter empresarial para la gestión y control de órdenes de materiales. Permite a los usuarios gestionar contratos, presupuestos, órdenes de compra y realizar seguimiento de inventarios y costos en tiempo real.

## ✨ Características Principales

- 🔐 **Autenticación segura** con Firebase Auth
- 📊 **Dashboard interactivo** con visualización de datos
- 📦 **Gestión de órdenes** de compra y materiales
- 💰 **Control de presupuestos** y costos
- 📈 **Reportes y análisis** de datos
- 🔄 **Sincronización en tiempo real** con Supabase
- 📧 **Sistema de notificaciones** por correo
- 🌐 **Soporte multiplataforma** (Web, Android)

## 🛠️ Stack Tecnológico

| Tecnología | Uso |
|------------|-----|
| **Flutter 3.x** | Framework de desarrollo |
| **Dart 3.x** | Lenguaje de programación |
| **Firebase** | Autenticación y hosting |
| **Supabase** | Base de datos y APIs |
| **Google Apps Script** | Backend APIs |
| **BLoC** | Gestión de estado |

## 📁 Arquitectura del Proyecto

```
lib/
├── bloc/                 # Estado global con BLoC
├── budget/               # Módulo de presupuestos
├── contrato/             # Módulo de contratos
├── home/                 # Página principal
├── login/                # Autenticación
├── resources/            # Recursos compartidos
│   ├── constants/        # Constantes y configuración
│   └── env_config.dart   # Variables de entorno
├── firebase_options.dart # Configuración Firebase
└── main.dart             # Punto de entrada
```

## 🚀 Instalación

### Prerrequisitos

- Flutter SDK 3.7.2 o superior
- Dart SDK 3.x
- Una cuenta de Firebase
- Una cuenta de Supabase (opcional)
- Git

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/jozzer182/COM_APP.git
   cd COM_APP
   ```

2. **Configurar variables de entorno**
   ```bash
   # Copiar el archivo de ejemplo
   cp .env.example .env
   
   # Editar .env con tus credenciales
   # Ver sección "Configuración de Variables de Entorno"
   ```

3. **Configurar Firebase para Android**
   ```bash
   # Copiar el archivo de ejemplo
   cp android/app/google-services.json.example android/app/google-services.json
   
   # Reemplazar con tu archivo google-services.json de Firebase Console
   ```

4. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

5. **Ejecutar la aplicación**
   ```bash
   # Web
   flutter run -d chrome
   
   # Android
   flutter run -d android
   ```

## ⚙️ Configuración de Variables de Entorno

Crea un archivo `.env` en la raíz del proyecto basándote en `.env.example`:

### Firebase

```env
# Web
FIREBASE_WEB_API_KEY=tu_api_key
FIREBASE_WEB_APP_ID=tu_app_id
FIREBASE_WEB_PROJECT_ID=tu_project_id
# ... etc

# Android
FIREBASE_ANDROID_API_KEY=tu_api_key
# ... etc
```

### Google Apps Script

Las APIs utilizan Google Apps Script. Necesitas desplegar tus propios scripts:

```env
API_FEM=https://script.google.com/macros/s/TU_SCRIPT_ID/exec
API_COSTI=https://script.google.com/macros/s/TU_SCRIPT_ID/exec
# ... etc
```

### Supabase

```env
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_ANON_KEY=tu_anon_key
```

## 📖 Documentación Adicional

Para instrucciones detalladas de configuración, consulta:
- [docs/SETUP.md](docs/SETUP.md) - Guía completa de configuración

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto es de uso privado/interno.

## 📞 Contacto

- **GitHub**: [@jozzer182](https://github.com/jozzer182)

---

<p align="center">
  Desarrollado con ❤️ usando Flutter
</p>

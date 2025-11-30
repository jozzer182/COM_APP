# 🔧 Guía de Configuración - COM_APP

Esta guía detalla los pasos necesarios para configurar el proyecto desde cero.

## Tabla de Contenidos

1. [Requisitos Previos](#requisitos-previos)
2. [Configuración de Firebase](#configuración-de-firebase)
3. [Configuración de Supabase](#configuración-de-supabase)
4. [Configuración de Google Apps Script](#configuración-de-google-apps-script)
5. [Variables de Entorno](#variables-de-entorno)
6. [Ejecución del Proyecto](#ejecución-del-proyecto)
7. [Solución de Problemas](#solución-de-problemas)

---

## Requisitos Previos

Asegúrate de tener instalado:

- **Flutter SDK** >= 3.7.2
- **Dart SDK** >= 3.0.0
- **Git**
- Un IDE (VS Code, Android Studio, o IntelliJ)

Verifica tu instalación:

```bash
flutter doctor
```

---

## Configuración de Firebase

### 1. Crear Proyecto en Firebase

1. Ve a [Firebase Console](https://console.firebase.google.com/)
2. Click en "Agregar proyecto"
3. Sigue el asistente de configuración

### 2. Configurar Firebase Authentication

1. En Firebase Console, ve a **Build > Authentication**
2. Click en "Comenzar"
3. Habilita **Email/Password** como método de inicio de sesión

### 3. Registrar Apps

#### Para Web:
1. En la configuración del proyecto, click en el ícono web (`</>`)
2. Registra la app con un nombre
3. Copia las credenciales al archivo `.env`

#### Para Android:
1. Click en el ícono de Android
2. Usa `com.example.com` como nombre del paquete
3. Descarga `google-services.json`
4. Colócalo en `android/app/`

---

## Configuración de Supabase

### 1. Crear Proyecto en Supabase

1. Ve a [Supabase Dashboard](https://supabase.com/dashboard)
2. Click en "New Project"
3. Configura nombre, contraseña y región

### 2. Obtener Credenciales

1. Ve a **Settings > API**
2. Copia:
   - **Project URL** → `SUPABASE_URL`
   - **anon public key** → `SUPABASE_ANON_KEY`

### 3. Crear Tablas (si es necesario)

El proyecto utiliza las siguientes tablas:
- `oe` - Órdenes de entrada

---

## Configuración de Google Apps Script

El proyecto utiliza varios Google Apps Scripts como backend. Para configurar tus propios scripts:

### 1. Crear un Script

1. Ve a [Google Apps Script](https://script.google.com/)
2. Crea un nuevo proyecto
3. Implementa las funciones necesarias

### 2. Desplegar el Script

1. Click en **Desplegar > Nueva implementación**
2. Selecciona **Aplicación web**
3. Configura:
   - Ejecutar como: Tu cuenta
   - Acceso: Cualquier persona
4. Click en **Desplegar**
5. Copia la URL del despliegue

### 3. Scripts Requeridos

| Variable | Descripción |
|----------|-------------|
| `API_FEM` | API principal de datos |
| `API_USDCOP` | Tasas de cambio USD/COP |
| `API_COSTI` | Datos de costos |
| `API_MAIL` | Envío de correos |
| `API_FILE_UPLOADER` | Carga de archivos |

---

## Variables de Entorno

### Crear archivo .env

```bash
cp .env.example .env
```

### Estructura del archivo .env

```env
# Firebase Web
FIREBASE_WEB_API_KEY=AIza...
FIREBASE_WEB_APP_ID=1:123456789:web:abc123
FIREBASE_WEB_MESSAGING_SENDER_ID=123456789
FIREBASE_WEB_PROJECT_ID=tu-proyecto
FIREBASE_WEB_AUTH_DOMAIN=tu-proyecto.firebaseapp.com
FIREBASE_WEB_STORAGE_BUCKET=tu-proyecto.appspot.com

# Firebase Android
FIREBASE_ANDROID_API_KEY=AIza...
FIREBASE_ANDROID_APP_ID=1:123456789:android:abc123
FIREBASE_ANDROID_MESSAGING_SENDER_ID=123456789
FIREBASE_ANDROID_PROJECT_ID=tu-proyecto
FIREBASE_ANDROID_STORAGE_BUCKET=tu-proyecto.appspot.com

# Google Apps Script APIs
API_FEM=https://script.google.com/macros/s/.../exec
API_USDCOP=https://script.google.com/macros/s/.../exec
# ... etc

# Supabase
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_ANON_KEY=eyJ...
```

---

## Ejecución del Proyecto

### Instalar Dependencias

```bash
flutter pub get
```

### Ejecutar en Desarrollo

```bash
# Web
flutter run -d chrome

# Android (con dispositivo/emulador conectado)
flutter run -d android

# Listar dispositivos disponibles
flutter devices
```

### Compilar para Producción

```bash
# Web
flutter build web

# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle
```

---

## Solución de Problemas

### Error: "Cannot read .env file"

Asegúrate de que:
1. El archivo `.env` existe en la raíz del proyecto
2. Está incluido en `pubspec.yaml` como asset:
   ```yaml
   flutter:
     assets:
       - .env
   ```

### Error: Firebase no inicializa

Verifica que:
1. Las credenciales en `.env` son correctas
2. El proyecto de Firebase está activo
3. Los métodos de autenticación están habilitados

### Error: "google-services.json not found"

Para Android, descarga el archivo desde Firebase Console y colócalo en `android/app/`.

### Limpiar cache de Flutter

```bash
flutter clean
flutter pub get
```

---

## Soporte

Si encuentras problemas, crea un issue en el repositorio.


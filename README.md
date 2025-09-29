# MSG91 OTP Flutter App

A simple Flutter application implementing phone number OTP verification using **MSG91 SendOTP SDK** with **Bloc State management**.

---

## Features

- Login screen with phone number input  
- Send OTP using MSG91 SDK  
- OTP verification screen  
- Countdown timer for OTP  
- Resend OTP and change number options  
- Main screen after successful verification  
- State management with **Flutter Bloc**

---

## Getting Started

### Prerequisites

- Flutter SDK installed (>=3.0.0)  
- MSG91 account to get **widgetId** and **authToken**

---

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/AKSHAYK0UL/Glow-Infoway.git
cd Glow-Infoway
```

2. **Install Dependencies**  
   ```bash
   flutter pub get
   ```
3.  **lib/secrets.dart**
 ```bash
Replace the values below with your MSG91 Widget ID and Auth Token
const String WIDGET_ID = "YOUR_WIDGET_ID_HERE";
const String AUTH_TOKEN = "YOUR_AUTH_TOKEN_HERE";
```
4. **Running the App**
```bash
flutter run
```

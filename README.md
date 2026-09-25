# Booking Home App 🏨

A modern, visually appealing Flutter application for booking hotels, residences, and accommodations.

## Features ✨
- **Modern UI/UX**: Dark mode by default with elegant Gold & Orange accents.
- **Dynamic Animations**: Smooth screen transitions, Hero animations for profile pictures, and modern success state animations using `AnimationController`.
- **State Management**: Built with the `Provider` package to ensure clean, scalable, and reactive state updates across the app.
- **Robust Networking**: Handled seamlessly with `Dio`. 
- **Detailed API Logging**: Every HTTP request and response is intercepted and logged cleanly in the console for easy debugging.

## Architecture & Packages 📦
- **UI/Components**: Vanilla Flutter SDK, Custom text fields, Shimmer loading placeholders.
- **State**: `provider`
- **Network**: `dio`
- **Logging**: `logging` + Dio `LogInterceptor`

## Getting Started 🚀

1. **Clone the repository:**
   ```bash
   git clone https://github.com/tuutaii/booking_app.git
   ```

2. **Install dependencies:**
   ```bash
   cd booking_app
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## Previews 📱
- **Home Screen**: Dynamic lists of trending accommodations.
- **Authentication**: Seamless Login & Register pages with updated color matching.
- **Profile**: Elegant profile view editing with `Hero` image transition.
- **Booking Flow**: Pick dates, execute mock payments, and see a fluid bounce/fade success checkmark.

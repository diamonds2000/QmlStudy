# QML Study Application

A modern Qt6.2 application with QML UI featuring a dark flat design.

## Features

1. **Modern Dark Flat UI** - Uses Material Design dark theme
2. **Menu Bar** - File, Operation, and Help menus
3. **Toolbar** - Six buttons: New, Open, Cut, Copy, Paste, About
4. **Left Docked Panel** - Non-floating panel with two pages:
   - Tree View page
   - List View page
5. **Right Vertical Toolbar** - Toggle buttons that show/hide popup panels
6. **Center Chart View** - Displays a dummy chart with two line series

## Requirements

- Qt 6.2 or higher
- CMake 3.16 or higher
- C++17 compatible compiler

## Build Instructions

### Linux/macOS

```bash
# Create build directory
mkdir build
cd build

# Configure with CMake
cmake ..

# Build the project
cmake --build .

# Run the application
./QMLStudy
```

### Windows

```bash
# Create build directory
mkdir build
cd build

# Configure with CMake (adjust the path to your Qt installation)
cmake -DCMAKE_PREFIX_PATH="C:/Qt/6.2.0/msvc2019_64" ..

# Build the project
cmake --build . --config Release

# Run the application
Release\QMLStudy.exe
```

## Project Structure

```
qml_study/
├── CMakeLists.txt       # CMake build configuration
├── main.cpp             # Application entry point
├── Main.qml             # Main UI definition
├── qml.qrc              # Qt resource file
└── README.md            # This file
```

## Usage

- **Menu Bar**: Access File, Operation, and Help menus at the top
- **Toolbar**: Quick access to common actions
- **Left Panel**: Switch between Tree View and List View using tabs
- **Right Toolbar**: Click toggle buttons (T1, T2, T3) to show/hide side panels
- **Center View**: Displays a chart with sample data

## Notes

- The toolbar icons are referenced but not included in this basic setup
- The tree and list views contain dummy data for demonstration
- The chart displays two sample line series
- All button actions currently log to console

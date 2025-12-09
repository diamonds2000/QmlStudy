# Qt6 QML Application - Required Packages for Ubuntu 22.04

## Complete Installation Command

Run this single command to install all required packages:

```bash
sudo apt install \
    qt6-base-dev \
    qt6-declarative-dev \
    libqt6charts6-dev \
    cmake \
    build-essential \
    qml6-module-qtquick \
    qml6-module-qtquick-controls \
    qml6-module-qtquick-layouts \
    qml6-module-qtquick-window \
    qml6-module-qtquick-templates \
    qml6-module-qtcharts \
    qml6-module-qtqml-workerscript
```

## Package Breakdown

### Development Packages (Build Time)
- `qt6-base-dev` - Qt6 Core, Gui base development files
- `qt6-declarative-dev` - QML/Quick development files
- `libqt6charts6-dev` - Charts development files  
- `cmake` - Build system
- `build-essential` - C++ compiler and tools

### Runtime QML Modules (Run Time)
- `qml6-module-qtquick` - Basic QtQuick QML module
- `qml6-module-qtquick-controls` - Qt Quick Controls 2
- `qml6-module-qtquick-layouts` - Layout components
- `qml6-module-qtquick-window` - Window management
- `qml6-module-qtquick-templates` - Control templates (required for ApplicationWindow)
- `qml6-module-qtcharts` - Chart visualization
- `qml6-module-qtqml-workerscript` - WorkerScript support

## Build Instructions

```bash
cd /home/cgh/qml_study
mkdir -p build
cd build
cmake ..
cmake --build .
```

## Run the Application

```bash
cd /home/cgh/qml_study/build
./QMLStudy
```

## Troubleshooting

### If you get "module not found" errors:
Check which module is missing and install the corresponding `qml6-module-*` package.

### If you get segmentation fault:
1. Make sure all QML modules are installed
2. Try running with debug output:
   ```bash
   QT_DEBUG_PLUGINS=1 ./QMLStudy
   ```

### If the window doesn't appear:
Make sure you have a display server running (X11 or Wayland) and DISPLAY is set:
```bash
echo $DISPLAY
```

## Notes for Ubuntu 22.04

- Ubuntu 22.04 ships with Qt 6.2.4
- TreeView and TreeModel are NOT available in Qt 6.2 (they were added in Qt 6.3+)
- The project uses a ListView-based tree view instead
- Material Design style is supported and used for the dark theme

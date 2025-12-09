import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import com.qmlstudy 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1200
    height: 800
    title: "QML Study Application"
    
    // Dark theme configuration
    Material.theme: Material.Dark
    Material.accent: Material.Blue
    
    // Set smaller font size globally
    font.pixelSize: 12
    
    color: "#1e1e1e"
    
    // Menu Bar - Using component
    menuBar: MainMenuBar {
        id: mainMenuBar
    }
    
    // Main content area
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        
        // Toolbar - Using component
        MainToolBar {
            id: mainToolBar
            Layout.fillWidth: true
        }
        
        // Main content area with left dock, center chart, and right toolbar
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
            
            // Left Docked Panel - Using C++ class that loads QML
            DockWindow {
                id: leftDockPanel
                Layout.preferredWidth: 250
                Layout.fillHeight: true
            }
            
            // Center Chart View - Using C++ class that loads QML
            ChartPanel {
                id: chartViewPanel
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            
            // Right Vertical Toolbar - Using C++ class that loads QML
            RightToolBar {
                id: rightToolBar
                Layout.preferredWidth: 50
                Layout.fillHeight: true
            }
        }
    }
}

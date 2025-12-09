import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

MenuBar {
    id: mainMenuBar
    Material.background: "#2d2d30"
    Material.foreground: "#ffffff"
    height: 30
    font.pixelSize: 11
    
    delegate: MenuBarItem {
        height: 30
        font.pixelSize: 11
    }
    
    // File Menu
    Menu {
        title: "&File"
        font.pixelSize: 11
        
        delegate: MenuItem {
            height: 28
            font.pixelSize: 11
        }
        
        MenuItem { 
            text: "New"
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("New clicked")
        }
        MenuItem { 
            text: "Open"
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("Open clicked")
        }
        MenuSeparator { height: 1 }
        MenuItem { 
            text: "Save"
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("Save clicked")
        }
        MenuItem { 
            text: "Save As..."
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("Save As clicked")
        }
        MenuSeparator { height: 1 }
        MenuItem { 
            text: "Exit"
            height: 28
            font.pixelSize: 11
            onTriggered: Qt.quit()
        }
    }
    
    // Operation Menu
    Menu {
        title: "&Operation"
        font.pixelSize: 11
        
        delegate: MenuItem {
            height: 28
            font.pixelSize: 11
        }
        
        MenuItem { 
            text: "Cut"
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("Cut clicked")
        }
        MenuItem { 
            text: "Copy"
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("Copy clicked")
        }
        MenuItem { 
            text: "Paste"
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("Paste clicked")
        }
        MenuSeparator { height: 1 }
        MenuItem { 
            text: "Preferences"
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("Preferences clicked")
        }
    }
    
    // Help Menu
    Menu {
        title: "&Help"
        font.pixelSize: 11
        
        delegate: MenuItem {
            height: 28
            font.pixelSize: 11
        }
        
        MenuItem { 
            text: "About"
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("About clicked")
        }
        MenuItem { 
            text: "Documentation"
            height: 28
            font.pixelSize: 11
            onTriggered: console.log("Documentation clicked")
        }
    }
}

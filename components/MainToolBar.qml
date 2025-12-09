import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

ToolBar {
    id: mainToolBar
    Material.background: "#2d2d30"
    Material.foreground: "#ffffff"
    
    RowLayout {
        anchors.fill: parent
        spacing: 5
        
        ToolButton {
            text: "New"
            icon.source: "qrc:/icons/new.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("New clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Create New"
        }
        
        ToolButton {
            text: "Open"
            icon.source: "qrc:/icons/open.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("Open clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Open File"
        }
        
        ToolSeparator {}
        
        ToolButton {
            text: "Cut"
            icon.source: "qrc:/icons/cut.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("Cut clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Cut"
        }
        
        ToolButton {
            text: "Copy"
            icon.source: "qrc:/icons/copy.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("Copy clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Copy"
        }
        
        ToolButton {
            text: "Paste"
            icon.source: "qrc:/icons/paste.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("Paste clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Paste"
        }
        
        ToolSeparator {}
        
        ToolButton {
            text: "About"
            icon.source: "qrc:/icons/about.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("About clicked")
            ToolTip.visible: hovered
            ToolTip.text: "About"
        }
        
        Item { Layout.fillWidth: true }
    }
}

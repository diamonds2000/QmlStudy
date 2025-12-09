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
            icon.source: "qrc:/icon/cut32.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("New clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Create New"
        }
        
        ToolButton {
            icon.source: "qrc:/icon/copy32.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("Open clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Open File"
        }
        
        ToolSeparator {}
        
        ToolButton {
            icon.source: "qrc:/icon/cut32.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("Cut clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Cut"
        }
        
        ToolButton {
            icon.source: "qrc:/icon/copy32.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("Copy clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Copy"
        }
        
        ToolButton {
            icon.source: "qrc:/icon/paste32.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("Paste clicked")
            ToolTip.visible: hovered
            ToolTip.text: "Paste"
        }
        
        ToolSeparator {}
        
        ToolButton {
            icon.source: "qrc:/icon/about32.png"
            flat: true
            font.pixelSize: 11
            onClicked: console.log("About clicked")
            ToolTip.visible: hovered
            ToolTip.text: "About"
        }
        
        Item { Layout.fillWidth: true }
    }
}
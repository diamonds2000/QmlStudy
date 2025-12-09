import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

Rectangle {
    id: rightToolBar
    color: "#2d2d30"
    border.color: "#3e3e42"
    border.width: 1
    
    // Array to hold all toggle buttons for mutual exclusion
    property var toggleButtons: []
    
    function registerToggleButton(button) {
        toggleButtons.push(button)
    }
    
    function unregisterToggleButton(button) {
        var index = toggleButtons.indexOf(button)
        if (index !== -1) {
            toggleButtons.splice(index, 1)
        }
    }
    
    function enforceMutualExclusion(activator) {
        for (var i = 0; i < toggleButtons.length; i++) {
            if (toggleButtons[i] !== activator) {
                toggleButtons[i].checked = false
            }
        }
    }
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 5
        
        // Toggle Button 1
        ToolButton {
            id: toolBtn1
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            text: "T1"
            font.pixelSize: 10
            checkable: true
            checked: false
            Material.background: checked ? "#0e639c" : "#3e3e42"
            
            onCheckedChanged: {
                if (checked) {
                    rightToolBar.enforceMutualExclusion(this)
                }
            }
            
            Component.onCompleted: {
                rightToolBar.registerToggleButton(this)
            }
            
            ToolTip.visible: hovered
            ToolTip.text: "Toggle Panel 1"
        }
        
        // Toggle Button 2
        ToolButton {
            id: toolBtn2
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            text: "T2"
            font.pixelSize: 10
            checkable: true
            checked: false
            Material.background: checked ? "#0e639c" : "#3e3e42"
            
            onCheckedChanged: {
                if (checked) {
                    rightToolBar.enforceMutualExclusion(this)
                }
            }
            
            Component.onCompleted: {
                rightToolBar.registerToggleButton(this)
            }
            
            ToolTip.visible: hovered
            ToolTip.text: "Toggle Panel 2"
        }
        
        // Toggle Button 3
        ToolButton {
            id: toolBtn3
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            text: "T3"
            font.pixelSize: 10
            checkable: true
            checked: false
            Material.background: checked ? "#0e639c" : "#3e3e42"
            
            onCheckedChanged: {
                if (checked) {
                    rightToolBar.enforceMutualExclusion(this)
                }
            }
            
            Component.onCompleted: {
                rightToolBar.registerToggleButton(this)
            }
            
            ToolTip.visible: hovered
            ToolTip.text: "Toggle Panel 3"
        }
        
        Item { Layout.fillHeight: true }
    }
    
    // Popup Panel 1
    Popup {
        id: popup1
        visible: toolBtn1.checked
        x: -210
        y: 5
        width: 200
        height: 300
        modal: false
        closePolicy: Popup.NoAutoClose
        
        Material.background: "#252526"
        Material.foreground: "#cccccc"
        
        ColumnLayout {
            anchors.fill: parent
            spacing: 5
            
            Label {
                text: "Panel 1"
                font.bold: true
                font.pixelSize: 12
                Layout.fillWidth: true
            }
            
            Button {
                text: "Button 1A"
                Layout.fillWidth: true
                flat: true
                font.pixelSize: 11
                onClicked: console.log("Button 1A clicked")
            }
            
            Button {
                text: "Button 1B"
                Layout.fillWidth: true
                flat: true
                font.pixelSize: 11
                onClicked: console.log("Button 1B clicked")
            }
            
            Button {
                text: "Button 1C"
                Layout.fillWidth: true
                flat: true
                font.pixelSize: 11
                onClicked: console.log("Button 1C clicked")
            }
            
            Item { Layout.fillHeight: true }
        }
    }
    
    // Popup Panel 2
    Popup {
        id: popup2
        visible: toolBtn2.checked
        x: -210
        y: 55
        width: 200
        height: 300
        modal: false
        closePolicy: Popup.NoAutoClose
        
        Material.background: "#252526"
        Material.foreground: "#cccccc"
        
        ColumnLayout {
            anchors.fill: parent
            spacing: 5
            
            Label {
                text: "Panel 2"
                font.bold: true
                font.pixelSize: 12
                Layout.fillWidth: true
            }
            
            Button {
                text: "Button 2A"
                Layout.fillWidth: true
                flat: true
                font.pixelSize: 11
                onClicked: console.log("Button 2A clicked")
            }
            
            Button {
                text: "Button 2B"
                Layout.fillWidth: true
                flat: true
                font.pixelSize: 11
                onClicked: console.log("Button 2B clicked")
            }
            
            Button {
                text: "Button 2C"
                Layout.fillWidth: true
                flat: true
                font.pixelSize: 11
                onClicked: console.log("Button 2C clicked")
            }
            
            Button {
                text: "Button 2D"
                Layout.fillWidth: true
                flat: true
                font.pixelSize: 11
                onClicked: console.log("Button 2D clicked")
            }
            
            Item { Layout.fillHeight: true }
        }
    }
    
    // Popup Panel 3
    Popup {
        id: popup3
        visible: toolBtn3.checked
        x: -210
        y: 105
        width: 200
        height: 300
        modal: false
        closePolicy: Popup.NoAutoClose
        
        Material.background: "#252526"
        Material.foreground: "#cccccc"
        
        ColumnLayout {
            anchors.fill: parent
            spacing: 5
            
            Label {
                text: "Panel 3"
                font.bold: true
                font.pixelSize: 12
                Layout.fillWidth: true
            }
            
            Button {
                text: "Button 3A"
                Layout.fillWidth: true
                flat: true
                font.pixelSize: 11
                onClicked: console.log("Button 3A clicked")
            }
            
            Button {
                text: "Button 3B"
                Layout.fillWidth: true
                flat: true
                font.pixelSize: 11
                onClicked: console.log("Button 3B clicked")
            }
            
            Item { Layout.fillHeight: true }
        }
    }
}
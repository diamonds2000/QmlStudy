import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtCharts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1200
    height: 800
    title: "QML Study Application"
    
    // Dark theme configuration
    Material.theme: Material.Dark
    Material.accent: Material.Blue
    
    color: "#1e1e1e"
    
    // Menu Bar
    menuBar: MenuBar {
        Material.background: "#2d2d30"
        Material.foreground: "#ffffff"
        
        Menu {
            title: "&File"
            MenuItem { 
                text: "New"
                onTriggered: console.log("New clicked")
            }
            MenuItem { 
                text: "Open"
                onTriggered: console.log("Open clicked")
            }
            MenuSeparator {}
            MenuItem { 
                text: "Save"
                onTriggered: console.log("Save clicked")
            }
            MenuItem { 
                text: "Save As..."
                onTriggered: console.log("Save As clicked")
            }
            MenuSeparator {}
            MenuItem { 
                text: "Exit"
                onTriggered: Qt.quit()
            }
        }
        
        Menu {
            title: "&Operation"
            MenuItem { 
                text: "Cut"
                onTriggered: console.log("Cut clicked")
            }
            MenuItem { 
                text: "Copy"
                onTriggered: console.log("Copy clicked")
            }
            MenuItem { 
                text: "Paste"
                onTriggered: console.log("Paste clicked")
            }
            MenuSeparator {}
            MenuItem { 
                text: "Preferences"
                onTriggered: console.log("Preferences clicked")
            }
        }
        
        Menu {
            title: "&Help"
            MenuItem { 
                text: "About"
                onTriggered: console.log("About clicked")
            }
            MenuItem { 
                text: "Documentation"
                onTriggered: console.log("Documentation clicked")
            }
        }
    }
    
    // Main content area
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        
        // Toolbar
        ToolBar {
            Layout.fillWidth: true
            Material.background: "#2d2d30"
            Material.foreground: "#ffffff"
            
            RowLayout {
                anchors.fill: parent
                spacing: 5
                
                ToolButton {
                    text: "New"
                    icon.source: "qrc:/icons/new.png"
                    flat: true
                    onClicked: console.log("New clicked")
                    ToolTip.visible: hovered
                    ToolTip.text: "Create New"
                }
                
                ToolButton {
                    text: "Open"
                    icon.source: "qrc:/icons/open.png"
                    flat: true
                    onClicked: console.log("Open clicked")
                    ToolTip.visible: hovered
                    ToolTip.text: "Open File"
                }
                
                ToolSeparator {}
                
                ToolButton {
                    text: "Cut"
                    icon.source: "qrc:/icons/cut.png"
                    flat: true
                    onClicked: console.log("Cut clicked")
                    ToolTip.visible: hovered
                    ToolTip.text: "Cut"
                }
                
                ToolButton {
                    text: "Copy"
                    icon.source: "qrc:/icons/copy.png"
                    flat: true
                    onClicked: console.log("Copy clicked")
                    ToolTip.visible: hovered
                    ToolTip.text: "Copy"
                }
                
                ToolButton {
                    text: "Paste"
                    icon.source: "qrc:/icons/paste.png"
                    flat: true
                    onClicked: console.log("Paste clicked")
                    ToolTip.visible: hovered
                    ToolTip.text: "Paste"
                }
                
                ToolSeparator {}
                
                ToolButton {
                    text: "About"
                    icon.source: "qrc:/icons/about.png"
                    flat: true
                    onClicked: console.log("About clicked")
                    ToolTip.visible: hovered
                    ToolTip.text: "About"
                }
                
                Item { Layout.fillWidth: true }
            }
        }
        
        // Main content area with left dock, center chart, and right toolbar
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
            
            // Left Docked Panel (non-floating)
            Rectangle {
                id: leftDock
                Layout.preferredWidth: 250
                Layout.fillHeight: true
                color: "#252526"
                border.color: "#3e3e42"
                border.width: 1
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 0
                    spacing: 0
                    
                    // Tab bar for switching between views
                    TabBar {
                        id: tabBar
                        Layout.fillWidth: true
                        Material.background: "#2d2d30"
                        Material.foreground: "#ffffff"
                        
                        TabButton {
                            text: "Tree View"
                            width: implicitWidth
                        }
                        TabButton {
                            text: "List View"
                            width: implicitWidth
                        }
                    }
                    
                    // Stack layout for the content
                    StackLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        currentIndex: tabBar.currentIndex
                        
                        // Tree View Page
                        Rectangle {
                            color: "#1e1e1e"
                            
                            ScrollView {
                                anchors.fill: parent
                                anchors.margins: 5
                                
                                ListView {
                                    id: treeListView
                                    model: ListModel {
                                        ListElement { name: "Root Item"; level: 0; expanded: true }
                                        ListElement { name: "  ├─ Child 1"; level: 1; expanded: false }
                                        ListElement { name: "    ├─ Grandchild 1.1"; level: 2; expanded: false }
                                        ListElement { name: "    └─ Grandchild 1.2"; level: 2; expanded: false }
                                        ListElement { name: "  ├─ Child 2"; level: 1; expanded: false }
                                        ListElement { name: "    └─ Grandchild 2.1"; level: 2; expanded: false }
                                        ListElement { name: "  └─ Child 3"; level: 1; expanded: false }
                                    }
                                    
                                    delegate: ItemDelegate {
                                        width: treeListView.width
                                        height: 30
                                        
                                        contentItem: Text {
                                            text: model.name
                                            color: "#cccccc"
                                            verticalAlignment: Text.AlignVCenter
                                            font.family: "monospace"
                                        }
                                        
                                        background: Rectangle {
                                            color: parent.hovered ? "#2a2d2e" : "transparent"
                                        }
                                        
                                        onClicked: {
                                            console.log("Tree item clicked:", model.name)
                                        }
                                    }
                                }
                            }
                        }
                        
                        // List View Page
                        Rectangle {
                            color: "#1e1e1e"
                            
                            ScrollView {
                                anchors.fill: parent
                                anchors.margins: 5
                                
                                ListView {
                                    id: listView
                                    model: ListModel {
                                        ListElement { name: "Item 1"; description: "Description for item 1" }
                                        ListElement { name: "Item 2"; description: "Description for item 2" }
                                        ListElement { name: "Item 3"; description: "Description for item 3" }
                                        ListElement { name: "Item 4"; description: "Description for item 4" }
                                        ListElement { name: "Item 5"; description: "Description for item 5" }
                                        ListElement { name: "Item 6"; description: "Description for item 6" }
                                        ListElement { name: "Item 7"; description: "Description for item 7" }
                                        ListElement { name: "Item 8"; description: "Description for item 8" }
                                    }
                                    
                                    delegate: ItemDelegate {
                                        width: listView.width
                                        height: 60
                                        
                                        contentItem: ColumnLayout {
                                            Text {
                                                text: model.name
                                                color: "#cccccc"
                                                font.bold: true
                                            }
                                            Text {
                                                text: model.description
                                                color: "#999999"
                                                font.pixelSize: 12
                                            }
                                        }
                                        
                                        background: Rectangle {
                                            color: parent.hovered ? "#2a2d2e" : "transparent"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // Center Chart View
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#1e1e1e"
                
                ChartView {
                    id: chartView
                    anchors.fill: parent
                    anchors.margins: 10
                    title: "Dummy Chart"
                    antialiasing: true
                    theme: ChartView.ChartThemeDark
                    backgroundColor: "#1e1e1e"
                    titleColor: "#cccccc"
                    legend.labelColor: "#cccccc"
                    
                    LineSeries {
                        name: "Series 1"
                        XYPoint { x: 0; y: 0 }
                        XYPoint { x: 1; y: 2.1 }
                        XYPoint { x: 2; y: 3.3 }
                        XYPoint { x: 3; y: 2.1 }
                        XYPoint { x: 4; y: 4.9 }
                        XYPoint { x: 5; y: 3.0 }
                        XYPoint { x: 6; y: 4.5 }
                    }
                    
                    LineSeries {
                        name: "Series 2"
                        XYPoint { x: 0; y: 1.5 }
                        XYPoint { x: 1; y: 1.8 }
                        XYPoint { x: 2; y: 2.4 }
                        XYPoint { x: 3; y: 3.1 }
                        XYPoint { x: 4; y: 3.7 }
                        XYPoint { x: 5; y: 4.2 }
                        XYPoint { x: 6; y: 3.8 }
                    }
                }
            }
            
            // Right Vertical Toolbar with Toggle Buttons
            Rectangle {
                Layout.preferredWidth: 50
                Layout.fillHeight: true
                color: "#2d2d30"
                border.color: "#3e3e42"
                border.width: 1
                
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
                        checkable: true
                        checked: false
                        Material.background: checked ? "#0e639c" : "#3e3e42"
                        
                        ToolTip.visible: hovered
                        ToolTip.text: "Toggle Panel 1"
                    }
                    
                    // Toggle Button 2
                    ToolButton {
                        id: toolBtn2
                        Layout.preferredWidth: 40
                        Layout.preferredHeight: 40
                        text: "T2"
                        checkable: true
                        checked: false
                        Material.background: checked ? "#0e639c" : "#3e3e42"
                        
                        ToolTip.visible: hovered
                        ToolTip.text: "Toggle Panel 2"
                    }
                    
                    // Toggle Button 3
                    ToolButton {
                        id: toolBtn3
                        Layout.preferredWidth: 40
                        Layout.preferredHeight: 40
                        text: "T3"
                        checkable: true
                        checked: false
                        Material.background: checked ? "#0e639c" : "#3e3e42"
                        
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
                            Layout.fillWidth: true
                        }
                        
                        Button {
                            text: "Button 1A"
                            Layout.fillWidth: true
                            flat: true
                            onClicked: console.log("Button 1A clicked")
                        }
                        
                        Button {
                            text: "Button 1B"
                            Layout.fillWidth: true
                            flat: true
                            onClicked: console.log("Button 1B clicked")
                        }
                        
                        Button {
                            text: "Button 1C"
                            Layout.fillWidth: true
                            flat: true
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
                            Layout.fillWidth: true
                        }
                        
                        Button {
                            text: "Button 2A"
                            Layout.fillWidth: true
                            flat: true
                            onClicked: console.log("Button 2A clicked")
                        }
                        
                        Button {
                            text: "Button 2B"
                            Layout.fillWidth: true
                            flat: true
                            onClicked: console.log("Button 2B clicked")
                        }
                        
                        Button {
                            text: "Button 2C"
                            Layout.fillWidth: true
                            flat: true
                            onClicked: console.log("Button 2C clicked")
                        }
                        
                        Button {
                            text: "Button 2D"
                            Layout.fillWidth: true
                            flat: true
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
                            Layout.fillWidth: true
                        }
                        
                        Button {
                            text: "Button 3A"
                            Layout.fillWidth: true
                            flat: true
                            onClicked: console.log("Button 3A clicked")
                        }
                        
                        Button {
                            text: "Button 3B"
                            Layout.fillWidth: true
                            flat: true
                            onClicked: console.log("Button 3B clicked")
                        }
                        
                        Item { Layout.fillHeight: true }
                    }
                }
            }
        }
    }
}

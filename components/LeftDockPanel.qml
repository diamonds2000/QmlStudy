import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import com.qmlstudy 1.0

Rectangle {
    id: leftDock
    color: "#252526"
    border.color: "grey"
    border.width: 5
    
    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 2
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 2
        spacing: 0
        
        // Tab bar for switching between views
        TabBar {
            id: tabBar
            Layout.fillWidth: true
            Material.background: "#2d2d30"
            Material.foreground: "#ffffff"
            implicitHeight: 34
            
            TabButton {
                text: "Tree"
                width: 100
                height: tabBar.implicitHeight
                padding: 2
                font.pixelSize: 11
                Material.theme: Material.Dark
                font.capitalization: Font.MixedCase
            }
            TabButton {
                text: "List"
                width: 100
                height: tabBar.implicitHeight
                padding: 2
                font.pixelSize: 11
                Material.theme: Material.Dark
                font.capitalization: Font.MixedCase
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

                    TreeView {
                        id: treeView
                        anchors.fill: parent
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
                            height: 50
                            
                            contentItem: ColumnLayout {
                                Text {
                                    text: model.name
                                    color: "#cccccc"
                                    font.bold: true
                                    font.pixelSize: 11
                                }
                                Text {
                                    text: model.description
                                    color: "#999999"
                                    font.pixelSize: 10
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
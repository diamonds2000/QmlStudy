import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts


ListView {
    id: treeListView
    model: model  

    signal selectTreeNode(string name);

    delegate: ItemDelegate {
        width: treeListView.width
        height: 26
        
        contentItem: Row {
            spacing: 4
            anchors.verticalCenter: parent.verticalCenter
            
            Item {
                // Spacer to create indentation based on level
                width: model.level * 16
                height: parent.height
            }
            
            Image {
                source: model.expanded ? "qrc:/icon/caret-down16.png" : "qrc:/icon/caret-right16.png"
                width: 16
                height: 16
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        treeListView.model.toggleExpanded(index)
                        console.log("Tree item expander clicked:", model.name)
                    }
                }
            }

            Text {
                text: model.name
                color: "#cccccc"
                verticalAlignment: Text.AlignVCenter
                font.family: "monospace"
                font.pixelSize: 11
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        
        background: Rectangle {
            color: parent.hovered ? "#2a2d2e" : "transparent"
        }
        
        onClicked: {
            console.log("Tree item clicked:", model.name)
            treeListView.selectTreeNode(model.name)
        }
    }
}
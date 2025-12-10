import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

ListView {
    id: treeListView

    signal selectTreeNode(string name);

    delegate: ItemDelegate {
        width: treeListView.width
        height: 26
        
        contentItem: Text {
            text: modelData.name
            color: "#cccccc"
            verticalAlignment: Text.AlignVCenter
            font.family: "monospace"
            font.pixelSize: 11
        }
        
        background: Rectangle {
            color: parent.hovered ? "#2a2d2e" : "transparent"
        }
        
        onClicked: {
            console.log("Tree item clicked:", modelData.name)
            treeListView.selectTreeNode(modelData.name)
        }
    }
}
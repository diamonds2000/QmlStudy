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
        height: isVisible ? 26 : 0
        
        property string itemName: model.name
        property bool itemExpanded: model.expanded
        property int itemLevel: model.level
        
        property bool isVisible: {
            // Always show root level items (level 0)
            if (model.level === 0) 
                return true;
                
            // For child items, check if all ancestors are expanded
            var currentIndex = index;
            var currentLevel = model.level;
            
            // Walk backwards through the model to check all ancestors
            for (var i = currentIndex - 1; i >= 0 && currentLevel > 0; i--) {
                var item = treeListView.model.get(i);
                // When we find a potential parent (lower level)
                if (item.level < currentLevel) {
                    // Check if this parent is expanded
                    if (!item.expanded) {
                        return false; // Hidden because a parent is collapsed
                    }
                    // Update current level to continue checking higher-level ancestors
                    currentLevel = item.level;
                }
            }

            return true; // All ancestors are expanded
        }
        
        contentItem: Loader {
            sourceComponent: isVisible ? row : null
            anchors.verticalCenter: parent.verticalCenter
        }
        
        Component {
            id: row
            Row {
                spacing: 4
                anchors.verticalCenter: parent.verticalCenter
                
                Item {
                    // Spacer to create indentation based on level
                    width: itemLevel * 16
                    height: parent.height
                }
                
                Image {
                    source: itemExpanded ? "qrc:/icon/caret-down16.png" : "qrc:/icon/caret-right16.png"
                    width: 16
                    height: 16
                    anchors.verticalCenter: parent.verticalCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            treeListView.model.toggleExpanded(index)
                        }
                    }
                }

                Text {
                    text: itemName
                    color: "#cccccc"
                    verticalAlignment: Text.AlignVCenter
                    font.family: "monospace"
                    font.pixelSize: 11
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        
        background: Rectangle {
            color: parent.hovered ? "#2a2d2e" : "transparent"
        }
    }
}
#include "treeview.h"
#include <QQmlContext>
#include <QQuickItem>
#include <QVariantMap>
#include <QDebug>

TreeView::TreeView(QQuickItem* parent)
    : QQuickItem(parent)
    , m_component(nullptr)
    , m_contentItem(nullptr)
{
    setFlag(QQuickItem::ItemHasContents, true);
}

TreeView::~TreeView()
{
    if (m_contentItem) {
        m_contentItem->deleteLater();
    }
    if (m_component) {
        m_component->deleteLater();
    }
}

void TreeView::componentComplete()
{
    QQuickItem::componentComplete();
    loadQml();
}

void TreeView::init()
{
    loadQml();
}

void TreeView::loadQml()
{
    QQmlEngine* engine = qmlEngine(this);
    if (!engine) {
        qWarning() << "No QML engine available for TreeView";
        return;
    }

    m_component = new QQmlComponent(engine, QUrl("qrc:/components/TreeView.qml"), this);

    if (m_component->isReady()) {
        QObject* obj = m_component->create();
        m_contentItem = qobject_cast<QQuickItem*>(obj);

        if (m_contentItem)
        {
            m_contentItem->setParentItem(this);
            m_contentItem->setWidth(width());
            m_contentItem->setHeight(height());

            // Connect size changes
            connect(this, &QQuickItem::widthChanged, this, [this]() {
                if (m_contentItem) m_contentItem->setWidth(width());
                });
            connect(this, &QQuickItem::heightChanged, this, [this]() {
                if (m_contentItem) m_contentItem->setHeight(height());
                });

            connect(m_contentItem, SIGNAL(selectTreeNode(QString)), this, SLOT(onSelectTreeNode(QString)));

            setTreeNodes();
        }
    }
    else {
        qWarning() << "Failed to load TreeView QML:" << m_component->errorString();
    }
}

void TreeView::setTreeNodes()
{
    if (!m_contentItem) {
        qWarning() << "Content item not initialized in TreeView";
        return;
    }

    // Create tree nodes as QVariantList with QVariantMap items
    QVariantList nodes;

    QVariantMap node1 = {
        {"name", "Root Item"},
        {"level", 0},
        {"expanded", true}
    };
    nodes.append(node1);
    
    QVariantMap node2 = {
        {"name", "  ├─ Child 1"},
        {"level", 1},
        {"expanded", false}
    };
    nodes.append(node2);

    QVariantMap node3 = {
        {"name", "    ├─ Grandchild 1.1"},
        {"level", 2},
        {"expanded", false}
    };
    nodes.append(node3);

    QVariantMap node4 = {
        {"name", "    └─ Grandchild 1.2"},
        {"level", 2},
        {"expanded", false}
    };
    nodes.append(node4);

    QVariantMap node5 = {
        {"name", "  └─ Child 2"},
        {"level", 1},
        {"expanded", false}
    };
    nodes.append(node5);

    m_contentItem->setProperty("model", nodes);
    qDebug() << "TreeView: Set" << nodes.size() << "nodes to model";
}


void TreeView::onSelectTreeNode(const QString& nodeName)
{
    qDebug() << "TreeView: Tree node" << nodeName << " selected";
}
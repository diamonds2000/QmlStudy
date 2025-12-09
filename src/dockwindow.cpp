#include "dockwindow.h"
#include <QQmlContext>
#include <QQuickItem>

DockWindow::DockWindow(QQuickItem *parent)
    : QQuickItem(parent)
    , m_component(nullptr)
    , m_contentItem(nullptr)
{
    setFlag(QQuickItem::ItemHasContents, true);
}

DockWindow::~DockWindow()
{
    if (m_contentItem) {
        m_contentItem->deleteLater();
    }
    if (m_component) {
        m_component->deleteLater();
    }
}

void DockWindow::componentComplete()
{
    QQuickItem::componentComplete();
    loadQml();
}

void DockWindow::init()
{
    loadQml();
}

void DockWindow::loadQml()
{
    QQmlEngine *engine = qmlEngine(this);
    if (!engine) {
        qWarning() << "No QML engine available for DockWindow";
        return;
    }
    
    m_component = new QQmlComponent(engine, QUrl("qrc:/components/LeftDockPanel.qml"), this);
    
    if (m_component->isReady()) {
        QObject *obj = m_component->create();
        m_contentItem = qobject_cast<QQuickItem*>(obj);
        
        if (m_contentItem) {
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
        }
    } else {
        qWarning() << "Failed to load DockWindow QML:" << m_component->errorString();
    }
}

#include "chartpanel.h"
#include <QQmlContext>
#include <QQuickItem>

ChartPanel::ChartPanel(QQuickItem *parent)
    : QQuickItem(parent)
    , m_component(nullptr)
    , m_contentItem(nullptr)
{
    setFlag(QQuickItem::ItemHasContents, true);
}

ChartPanel::~ChartPanel()
{
    if (m_contentItem) {
        m_contentItem->deleteLater();
    }
    if (m_component) {
        m_component->deleteLater();
    }
}

void ChartPanel::componentComplete()
{
    QQuickItem::componentComplete();
    loadQml();
}

void ChartPanel::init()
{
    loadQml();
}

void ChartPanel::loadQml()
{
    QQmlEngine *engine = qmlEngine(this);
    if (!engine) {
        qWarning() << "No QML engine available for ChartPanel";
        return;
    }
    
    m_component = new QQmlComponent(engine, QUrl("qrc:/components/ChartViewPanel.qml"), this);
    
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
        qWarning() << "Failed to load ChartPanel QML:" << m_component->errorString();
    }
}

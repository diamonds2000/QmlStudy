#ifndef CHARTPANEL_H
#define CHARTPANEL_H

#include <QQuickItem>
#include <QQmlComponent>
#include <QQmlEngine>

class ChartPanel : public QQuickItem
{
    Q_OBJECT
    QML_ELEMENT
    
public:
    explicit ChartPanel(QQuickItem *parent = nullptr);
    ~ChartPanel();
    
    Q_INVOKABLE void init();
    
protected:
    void componentComplete() override;
    
private:
    void loadQml();
    QQmlComponent *m_component;
    QQuickItem *m_contentItem;
};

#endif // CHARTPANEL_H

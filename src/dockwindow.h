#ifndef DOCKWINDOW_H
#define DOCKWINDOW_H

#include <QQuickItem>
#include <QQmlComponent>
#include <QQmlEngine>

class DockWindow : public QQuickItem
{
    Q_OBJECT
    QML_ELEMENT
    
public:
    explicit DockWindow(QQuickItem *parent = nullptr);
    ~DockWindow();
    
    Q_INVOKABLE void init();
    
protected:
    void componentComplete() override;
    
private:
    void loadQml();
    QQmlComponent *m_component;
    QQuickItem *m_contentItem;
};

#endif // DOCKWINDOW_H

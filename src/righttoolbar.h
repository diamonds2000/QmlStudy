#ifndef RIGHTTOOLBAR_H
#define RIGHTTOOLBAR_H

#include <QQuickItem>
#include <QQmlComponent>
#include <QQmlEngine>

class RightToolBar : public QQuickItem
{
    Q_OBJECT
    QML_ELEMENT
    
public:
    explicit RightToolBar(QQuickItem *parent = nullptr);
    ~RightToolBar();
    
    Q_INVOKABLE void init();
    
protected:
    void componentComplete() override;
    
private:
    void loadQml();
    QQmlComponent *m_component;
    QQuickItem *m_contentItem;
};

#endif // RIGHTTOOLBAR_H

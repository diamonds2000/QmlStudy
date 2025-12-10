#ifndef TREEVIEW_H
#define TREEVIEW_H

#include <QQuickItem>
#include <QQmlComponent>
#include <QQmlEngine>

class TreeView : public QQuickItem
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit TreeView(QQuickItem* parent = nullptr);
    ~TreeView();

    Q_INVOKABLE void init();

protected:
    void componentComplete() override;

private slots:
    void onSelectTreeNode(const QString& nodeName);

private:
    void loadQml();
    void setTreeNodes();

    QQmlComponent* m_component;
    QQuickItem* m_contentItem;
};

#endif // TREEVIEW_H
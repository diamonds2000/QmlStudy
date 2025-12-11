#pragma once

#include <QAbstractListModel>
#include <vector>

class TreeModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        NameRole = Qt::UserRole + 1,
        LevelRole,
        ExpandedRole
    };

    explicit TreeModel(QObject* parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role) const override;
    bool setData(const QModelIndex& index, const QVariant& value, int role) override;

    QHash<int, QByteArray> roleNames() const override;

    // ---- C++ 侧动态操作 API ----
    Q_INVOKABLE void addNode(const QString& name, int level, bool expanded);
    Q_INVOKABLE void removeNode(int row);
    Q_INVOKABLE void toggleExpanded(int row);

    Q_INVOKABLE QVariantMap get(int row) const;

private:
    struct Node {
        QString name;
        int level;
        bool expanded;
    };

    std::vector<Node> m_nodes;
};

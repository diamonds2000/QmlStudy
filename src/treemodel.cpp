#include "treemodel.h"

TreeModel::TreeModel(QObject* parent)
    : QAbstractListModel(parent)
{
}

int TreeModel::rowCount(const QModelIndex&) const
{
    return m_nodes.size();
}

QVariant TreeModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid() || index.row() >= m_nodes.size())
        return {};

    const Node& n = m_nodes[index.row()];

    switch (role) {
    case NameRole: return n.name;
    case LevelRole: return n.level;
    case ExpandedRole: return n.expanded;
    default: return {};
    }
}

bool TreeModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
    if (!index.isValid())
        return false;

    Node& n = m_nodes[index.row()];

    switch (role) {
    case ExpandedRole:
        n.expanded = value.toBool();
        break;
    default: return false;
    }

    emit dataChanged(index, index, { role });
    return true;
}

QHash<int, QByteArray> TreeModel::roleNames() const
{
    return {
        {NameRole, "name"},
        {LevelRole, "level"},
        {ExpandedRole, "expanded"},
    };
}

void TreeModel::addNode(const QString& name, int level, bool expanded)
{
    int row = m_nodes.size();
    beginInsertRows(QModelIndex(), row, row);

    m_nodes.push_back({ name, level, expanded });

    endInsertRows();
}

void TreeModel::removeNode(int row)
{
    if (row < 0 || row >= m_nodes.size()) return;

    beginRemoveRows(QModelIndex(), row, row);
    m_nodes.erase(m_nodes.begin() + row);
    endRemoveRows();
}

void TreeModel::toggleExpanded(int row)
{
    if (row < 0 || row >= m_nodes.size()) return;
    QModelIndex idx = index(row);

    bool newVal = !m_nodes[row].expanded;
    setData(idx, newVal, ExpandedRole); // 自动触发 dataChanged
}

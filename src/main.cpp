#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QDebug>
#include <QPalette>
#include "dockwindow.h"
#include "chartpanel.h"
#include "righttoolbar.h"
#include "treeview.h"
#include "treemodel.h"

int main(int argc, char *argv[])
{
    // Set dark theme hint before creating QApplication (for Wayland/X11 window decorations)
    //qputenv("QT_QUICK_CONTROLS_MATERIAL_THEME", "Dark");
    //qputenv("QT_QUICK_CONTROLS_MATERIAL_VARIANT", "Dense");
    
    QApplication app(argc, argv);
    
    // Set application-wide dark palette for native widgets and window frames
    QPalette darkPalette;
    darkPalette.setColor(QPalette::Window, QColor(30, 30, 30));
    darkPalette.setColor(QPalette::WindowText, Qt::white);
    // darkPalette.setColor(QPalette::Base, QColor(25, 25, 25));
    // darkPalette.setColor(QPalette::AlternateBase, QColor(30, 30, 30));
    // darkPalette.setColor(QPalette::ToolTipBase, Qt::white);
    // darkPalette.setColor(QPalette::ToolTipText, Qt::white);
    // darkPalette.setColor(QPalette::Text, Qt::white);
    // darkPalette.setColor(QPalette::Button, QColor(30, 30, 30));
    //darkPalette.setColor(QPalette::ButtonText, Qt::white);
    // darkPalette.setColor(QPalette::BrightText, Qt::red);
    // darkPalette.setColor(QPalette::Link, QColor(42, 130, 218));
    // darkPalette.setColor(QPalette::Highlight, QColor(42, 130, 218));
    // darkPalette.setColor(QPalette::HighlightedText, Qt::black);
    app.setPalette(darkPalette);
    
    // Set the Qt Quick Controls style
    QQuickStyle::setStyle("Material");
    qDebug() << "Qt Quick Style set to:" << QQuickStyle::name();
    
    // Register C++ types with QML
    qmlRegisterType<DockWindow>("com.qmlstudy", 1, 0, "DockWindow");
    qmlRegisterType<TreeView>("com.qmlstudy", 1, 0, "TreeView");
    qmlRegisterType<ChartPanel>("com.qmlstudy", 1, 0, "ChartPanel");
    qmlRegisterType<RightToolBar>("com.qmlstudy", 1, 0, "RightToolBar");
    
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/components/Main.qml"));
    
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    
    engine.load(url);
    
    return app.exec();
}

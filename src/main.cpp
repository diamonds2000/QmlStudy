#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QDebug>
#include "dockwindow.h"
#include "chartpanel.h"
#include "righttoolbar.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    
    // Set the Qt Quick Controls style
    QQuickStyle::setStyle("Material");
    qDebug() << "Qt Quick Style set to:" << QQuickStyle::name();
    
    // Register C++ types with QML
    qmlRegisterType<DockWindow>("com.qmlstudy", 1, 0, "DockWindow");
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

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "backend.h"
#include "zmienne.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QSettings *settings;
    if(QFile(Zm().confDir+Zm().configFile).exists()) {
        settings=new QSettings(Zm().confDir+Zm().configFile,QSettings::IniFormat);
    } else {
        settings=new QSettings(QString(":/config/")+Zm().configFile,QSettings::IniFormat);
    }
    Zm().lang_code=settings->value(QString("lang_code")).toString();
    qDebug()<<"Main lang_code:"<<Zm().lang_code;
    delete settings;

    QTranslator *translator=new QTranslator();
    if(Zm().lang_code!=QString("pl")) {
        QString translations =QString(":/translations/translate-test_%1").arg(Zm().lang_code);
        app.removeTranslator(translator);
        //QApplication::instance()->removeTranslator(&translator);
        if (translator->load(translations)) {
            qDebug() << "LOAD FINISHED";
            app.installTranslator(translator);
            //QApplication::instance()->installTranslator(&translator);
        } else {
            qDebug() << "COULD NOT INSTALL TRANSLATIONS " << translations;
        }
    }

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    BackEnd backEnd(&engine);

    engine.load(url);

    backEnd.init(translator);

    return app.exec();
}

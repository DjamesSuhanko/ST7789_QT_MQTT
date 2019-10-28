#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include "mycomm.h"

int main(int argc, char *argv[])
{
    //############### Padrão do próprio projeto de exemplo citado no artigo ############
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


    //################ Agora implementamos abaixo uma interface entre o QML e o C++
    //Podemos pegar apenas 1 elemento, se desejado. Do modo a seguir, pega o objeto raiz, que nos dá acesso a tudo que contiver um objectName no QML.
    QObject* mainPage      = engine.rootObjects().first();
    //agora acessamos o objectName, sua propriedade e passamos o valor. No caso, labelTempRPi, propriedade text e valor TEMPERATURA
    mainPage->findChild<QQuickItem*>("labelTempRPi")->setProperty("text", "42.2 C");

    //Sabendo como interagir com os elementos do QML, o próximo passo é trazer os dados que os alimentarão. No caso, por MQTT.
    //No Raspberry, baixe e compile o suporte a MQTT:
    /*
    git clone https://github.com/emqx/qmqtt.git
    cd qmqtt
    qmake
    make
    sudo make install

    No arquivo .pro, adicione o suporte ao QCore, QNetwork e QMQTT:
    QT += quick network core qmqtt

    Uma classe à parte foi criada para fazer quaisquer interações necessárias, incluindo com o broker MQTT. A classe Interactor.
    */
    MyComm mqtt;
    //para deixar o main.cpp "limpo" e manipular os componentes da interface QML, a classe MyComm recebe um ponteiro da mainPage e manipula diretamente a entrada e a saída da informação.
    mqtt.QMLhandler(mainPage);
    mqtt.start();



    return app.exec(); //também faz parte do modelo padrão (swipe)
}

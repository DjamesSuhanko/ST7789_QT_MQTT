import QtQuick 2.0
import QtQuick.Controls 2.0

ApplicationWindow {
    id: appWin

    visible: true
    width: 240
    height: 240
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            id: external

            Timer {
                interval: 1000
                running: true
                repeat:  true

                //parece q cria uma funcao a cada chamada. ver como cria a funcao fora do loop e chamar aqui
                onTriggered: external.grabToImage(function (result){
                    if (!result.saveToFile("/dev/shm/merda.png")){
                        console.error("Unknown error saving to");
                    }
                    result.destroy();
                });
                //onTriggered: console.error('timeout ok');
            }
        }

        Page2Form {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }

    /*Item {
        id: shot
        width: 240
        height: 240

        Timer {
            interval: 2000
            running: true
            repeat:  false
            onTriggered: appWin.grabToImage(function result(){result.saveToFile("/tmp/algo.jpg");});
        }
    }*/
}

import QtQuick 2.0
import QtQuick.Controls 2.0

Page {
    id: zxc
    //property QtObject model
    property alias external: zxc
    width: 240
    height: 240

    Image {
        anchors.fill: parent
        x: 0
        y: 0
        id: rpi
        source: "raspberry.jpeg"
        opacity: 0.2
    }
    Label {
        objectName: "labelTempRPi"
        id: labelTempRPi
        x: 92
        y: 41
        text: qsTr("0.0")
    }

    header: Label {
        id: head
        color: "#f0f0f0"
        text: qsTr("MQTT Monitor")
        font.bold: true
        font.pixelSize: Qt.application.font.pixelSize * 1.5
        padding: 6

        Rectangle {
            id: recTitle
            x: 0
            y: 0
            width: 240
            height: 40
            color: "#353637"
        }

        Label {
            x: head.x - 2
            y: head.y - 2
            color: "#ffd010"
            text: qsTr("MQTT Monitor")
            font.bold: true
            font.pixelSize: Qt.application.font.pixelSize * 1.5
            padding: 10
        }
    }

    Label {
        id: label
        x: 14
        y: 6
        text: qsTr("Temperatura RPi")
        font.bold: true
        color: "#A06F92"
    }

    ProgressBar {
        objectName: "progressBarRPi"
        id: progressBarRPi
        x: 14
        y: 29
        value: 0.6

        background: Rectangle {
            radius: 2
            color: "lightgray"
            border.color: "gray"
            border.width: 1
            //implicitWidth: 200
            //implicitHeight: 24
        }
    }

    Dial {
        objectName: "dialTemp"
        id: dialTemp
        x: 19
        y: 48
        width: 53
        height: 53
        value: 0.374

        background: Rectangle {
            x: dialTemp.width / 2 - width / 2
            y: dialTemp.height / 2 - height / 2
            width: Math.max(64, Math.min(dialTemp.width, dialTemp.height))
            height: width
            color: "transparent"
            radius: width / 2
            border.color: dialTemp.pressed ? "#17a81a" : "#21be2b"
            opacity: dialTemp.enabled ? 1 : 0.3
        }

        handle: Rectangle {
            id: handleItemTemp
            x: dialTemp.background.x + dialTemp.background.width / 2 - width / 2
            y: dialTemp.background.y + dialTemp.background.height / 2 - height / 2
            width: 6
            height: 3
            color: dialTemp.pressed ? "#17a81a" : "#21be2b"
            radius: 8
            antialiasing: true
            //opacity: control.enabled ? 1 : 0.3
            transform: [
                Translate {
                    y: -Math.min(
                           dialTemp.background.width,
                           dialTemp.background.height) * 0.4 + handleItemTemp.height / 2
                },
                Rotation {
                    angle: dialTemp.angle
                    origin.x: handleItemTemp.width / 2
                    origin.y: handleItemTemp.height / 2
                }
            ]
        }

        Label {
            objectName: "labelTempExt"
            id: labelTempExt
            x: dialTemp.width / 2 - labelTempExt.width / 2
            y: dialTemp.height / 2 - labelTempExt.height / 2
            text: qsTr("37.4")
            font.bold: true
            font.pointSize: 13
        }
    }

    Label {
        id: label2
        x: 27
        y: 107
        text: qsTr("Temp")
    }

    Dial {
        objectName: "dialHumidity"
        id: dialHumidity
        x: 161
        y: 48
        width: 53
        height: 53
        value: 0.35

        background: Rectangle {
            x: dialHumidity.width / 2 - width / 2
            y: dialHumidity.height / 2 - height / 2
            width: Math.max(64, Math.min(dialHumidity.width,
                                         dialHumidity.height))
            height: width
            color: "transparent"
            radius: width / 2
            border.color: dialHumidity.pressed ? "#17a81a" : "#21be2b"
            opacity: dialHumidity.enabled ? 1 : 0.3
        }

        handle: Rectangle {
            id: handleItem
            x: dialHumidity.background.x + dialHumidity.background.width / 2 - width / 2
            y: dialHumidity.background.y + dialHumidity.background.height / 2 - height / 2
            width: 6
            height: 3
            color: dialHumidity.pressed ? "#17a81a" : "#21be2b"
            radius: 8
            antialiasing: true
            //opacity: control.enabled ? 1 : 0.3
            transform: [
                Translate {
                    y: -Math.min(
                           dialHumidity.background.width,
                           dialHumidity.background.height) * 0.4 + handleItem.height / 2
                },
                Rotation {
                    angle: dialHumidity.angle
                    origin.x: handleItem.width / 2
                    origin.y: handleItem.height / 2
                }
            ]
        }

        Label {
            objectName: "labelHumidity"
            id: labelHumidity
            x: dialHumidity.width / 2 - labelHumidity.width / 2
            y: dialHumidity.height / 2 - labelHumidity.height / 2
            text: qsTr("35%")
            font.bold: true
            font.pointSize: 13
        }

        Label {
            id: label3
            x: -4
            y: 59
            width: 61
            height: 20
            text: qsTr("Umidade")
        }
    }

    Label {
        id: label1
        x: 92
        y: 128
        text: qsTr("Clima")
    }
}

import QtQuick 2.7
import QtQuick.Controls 1.5
import "logic.js" as Logic

ApplicationWindow {
    visible: true
    width: 420
    height: 480
    title: qsTr("Target")

    GameArea {
        id: gameArea
        anchors.centerIn: parent
    }

    // По окончании создания окна инициализируем состояние игрового поля
    Component.onCompleted: {
        Logic.newGameState(gameArea)
    }
}

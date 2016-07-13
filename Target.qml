import QtQuick 2.7
import "logic.js" as Logic

Image {
    id: root
    property int row: 0
    property int col: 0

    width: 56
    height: 56
    x: (col * (width + 8)) + 4
    y: (row * (height + 8)) + 4

    source: "Target.png"

    Timer {
        interval: Logic.getRandomRound(350, 1500); running: true; repeat: false
        onTriggered: root.opacity = 0.0
    }

    // Когда изображение станет прозрачным. мы уничтожим сам объект
    onOpacityChanged: {
        if (opacity == 0.0) {
            Logic.destroyTarget(row, col)
            root.destroy()
        }
    }

    // Задаём поведение анимации свойства прозрачности объекта
    Behavior on opacity { PropertyAnimation { duration: 250 } }
}

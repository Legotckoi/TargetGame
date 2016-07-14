import QtQuick 2.7
import QtQuick.Window 2.2
import "logic.js" as Logic

Image {
    id: root
    width: 40
    height: 40

    // Устанавливаем смещение координаты (0, 0) в центр изображения
    transform: Translate {
        x: -width / 2
        y: -height / 2
    }

    // Задаём список массив возможных изображений выстрела пули
    property variant bullets: ["graphics/bullet-1.png", "graphics/bullet-2.png", "graphics/bullet-3.png",
                               "graphics/bullet-4.png", "graphics/bullet-5.png", "graphics/bullet-6.png"]

    // При создании объекта выбираем случайное изображение
    source: bullets[Logic.getRandomRound(0, 5)]

    // Таймер, который будет отсчитывать случайную величину от 3500 до 10000 мс
    // и по окончании запускать исчезновение следа от пули
    Timer {
        interval: Logic.getRandomRound(3500, 10000); running: true; repeat: false
        onTriggered: root.opacity = 0.0
    }

    // Когда изображение станет прозрачным. мы уничтожим сам объект
    onOpacityChanged: {
        if (opacity == 0.0) {
            root.destroy()
        }
    }

    // Задаём поведение анимации свойства прозрачности объекта
    Behavior on opacity { PropertyAnimation { duration: 100 } }
}

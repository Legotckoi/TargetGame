import QtQuick 2.7
import "logic.js" as Logic

Rectangle {
    id: grid
    property int squareSize: 64 // Размер ячейки игровой сетки
    property int rows: 6        // Количество строк сетки
    property int cols: 6        // Количество колонок сетки
    property int scores: 0      // Очки

    width: cols * squareSize    // Ширина и высота игровой арены
    height: rows * squareSize   // Будет зависеть от количества колонок, строк и размера одной ячейки

    InfoBar {
        id: infoBar
        scores: grid.scores
    }


    // Создаём след от пули при клике по игровой арене
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Logic.createBullet(grid, mouse.x, mouse.y)
            grid.scores--;
        }
    }

    // Таймер для создания мишеней
    Timer {
        id: createTargetsTimer
        interval: 350; running: true; repeat: true;
        // Раз в секунду выбираем случайную ячейку,
        // проверяем наличие мишени в ней, и если ячейка пустая,
        // то создаём мишень
        onTriggered: {
            var targetRow = Logic.getRandomRound(0, rows - 1);
            var targetColumns = Logic.getRandomRound(0, cols - 1);
            if (Logic.checkEmptyField(targetRow, targetColumns)) {
                Logic.createTarget(grid, targetRow, targetColumns)
            }
        }
    }
}

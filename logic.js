
// Объявляем, как библиотеку, чтобы иметь доступ
// к разделяемым ресурсам, например состоянию игры
.pragma library

var gameState       // Локальное объявление состояния игры
                    // в нашем случае это будет игровая область gameArea
function getGameState() { return gameState; }

var gameField;      // Игровое поле, игровая сетка
// Создаём заготовку для мишеней
var targetComponent = Qt.createComponent("Target.qml");
// Создаём заготовку для мишеней
var bulletComponent = Qt.createComponent("Bullet.qml");

// Инициализируем новое состояние игры
function newGameState(gameArea)
{
    gameState = gameArea;
    // Игровой сеткой будет служить двумерный массив,
    // в котором будем сохранять информацию о наличии в ячейках объектов
    gameField = create2DArray(gameState.rows, gameState.cols);
    return gameState;
}
// Функция получения случайного целого числа
// в диапазоне чисел включительно
function getRandomRound(min, max)
{
    return Math.round(Math.random() * (max - min) + min);
}

// Создаём мишень из компонента заготовки
function createTarget(parent, row, column)
{
    targetComponent.createObject(parent, {"row": row, "col": column})
}

// Создаём след от пули
function createBullet(parent, x, y)
{
    bulletComponent.createObject(parent, {"x": x, "y": y});
}

// Мишень удаляется из массива сетки
function destroyTarget(row, column)
{
    gameField[row][column] = null;
}

// Функция создания двумерного массива сетки
function create2DArray(rows, columns)
{
  var arr = [];

  for (var i=0;i<rows;i++) {
     arr[i] = [];
  }

  return arr;
}

// Проверка на предмет наличия какого либо объекта в выбранной ячейке
function checkEmptyField(row, column)
{
    if (gameField[row][column] == null) {
        return true;
    } else {
        return false;
    }
}

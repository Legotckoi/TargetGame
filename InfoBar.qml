import QtQuick 2.7
import QtQuick.Layouts 1.1

RowLayout {
    height: 40
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.leftMargin: 6
    anchors.rightMargin: 6
    spacing: 6
    z: 100

    // Данное свойство устанавливает доступ к текстовому полю,
    // в которое будет устанавливаться текущий счёт
    property alias scores: scores.text

    Text {
        text: qsTr("Scores")

        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        // Текстовое поле с текущим счётом
        id: scores

        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    // Своеобразный Spacer, который в RowLayout сдвинет текстовые поля к левому краю InfoBar
    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}

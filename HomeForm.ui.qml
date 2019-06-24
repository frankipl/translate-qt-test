import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id:page
    title: qsTr("Strona domowa")

    Label {
        text: qsTr("Jesteś na stronie domowej")
        anchors.centerIn: parent
    }
}

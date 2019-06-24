import QtQuick 2.12
import QtQuick.Controls 2.5
//import QtGraphicalEffects 1.0

Page {
    id:page
    title: qsTr("Wybierz język")

//    RectangularGlow {
//        id: effect
//        anchors.fill: mainRect
//        glowRadius: 10
//        spread: 0.2
//        color: "black"
//        cornerRadius: mainRect.radius + glowRadius
//    }

    Rectangle {
        id:mainRect
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 20
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        height:page.height-40
        radius:10
        border.width: 2
        border.color: "gray"
        LanguageRow {
            id:plLang
            anchors.top:parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.right: parent.right
            height:48
            bottom_line: true
            lang_code: "pl"
            lang_name: qsTr("Język polski")
            lang_image: "pl-flag-icon.png"
            onClicked: {
              //  langSelected()
            }
        }
        LanguageRow {
            id:enLang
            anchors.top:plLang.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height:48
            bottom_line: true
            lang_code: "en"
            lang_name: qsTr("Język angielski")
            lang_image: "en-flag-icon.png"
            onClicked: {
               // langSelected()
            }
        }
        LanguageRow {
            id:deLang
            anchors.top:enLang.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height:48
            bottom_line: true
            lang_code: "de"
            lang_name: qsTr("Język niemiecki")
            lang_image: "de-flag-icon.png"
            onClicked: {
               // langSelected()
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    id:root
    property string lang_name
    property string lang_code
    property string lang_image
    property bool bottom_line:false
    property bool selected: (AppData.curr_lang_code===lang_code ? true : false)
    signal clicked()
    width:parent.width
    color: "transparent"
    anchors.leftMargin: 5
    anchors.rightMargin: 5

    Rectangle {
        id:delegateMainRect
        anchors.fill: parent
        color:"white"

        Text {
            id:nameText
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top:parent.top
            anchors.leftMargin: 10
            height: parent.height
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: lang_name
            font.pixelSize: height*0.3
            // MarkRect {}
        }
        Rectangle {
            id:bottomLine
            anchors.bottom: parent.bottom
            anchors.left: nameText.left
            anchors.right: parent.right
            height:1
            color:"gray"
            visible: bottom_line
        }
        MouseArea {
            id:insideMouse
            anchors.top:parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            onClicked: {
                AppData.selectLang(lang_code)
                root.clicked()
            }
        }
    }
}

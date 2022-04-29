import QtQuick
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: "Make transitions"
    Rectangle{
        id: scene
        anchors.fill: parent
        state: "LeftState"

        Rectangle{
            id: leftRectangle
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            Text{
                id: leftName
                anchors.centerIn: parent
                               text: "Return"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: scene.state = "LeftState"
            }
        }

        Rectangle{
            id: rightRectangle
            x: 400
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            Text{
                id: rightName
                anchors.centerIn: parent
                               text: "Move"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    ball.x += 30
                    if(ball.x >= rightRectangle.x)
                        scene.state = "LeftState"
                    else
                        scene.state = "RightState"
                }
            }
        }

        Rectangle{
            id: ball
            color: "green"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2
        }
        states: [
            State {
                name: "RightState"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            },
            State {
                name: "LeftState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 5
                }
            }
        ]
        transitions: [
            Transition {
                from: "RightState"
                to: "LeftState"
                NumberAnimation{
                    properties: "x, y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}

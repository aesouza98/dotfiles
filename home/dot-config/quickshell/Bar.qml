// Barra placeholder: uma por monitor, ancorada no topo
import Quickshell
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: 32
            color: "#1a1b26"

            Text {
                anchors.centerIn: parent
                text: "quickshell"
                color: "#c0caf5"
            }
        }
    }
}

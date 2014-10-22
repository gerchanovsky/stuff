import QtQuick 2.2

Benchmark {
    id: root;

    property int size: Math.sqrt(width * height / count);
    property string description: count + " " + size + "x" + size + " Image instances\nAnimated with animations";

    count: 500

    Grid {
        width: root.width
        height: root.height
        columns: Math.ceil(root.width / root.size);
        rows: Math.ceil(root.height / root.size);
        Repeater {
            model: root.count
            Image {
                source: "butterfly-wide.png"
                sourceSize: Qt.size(root.size, root.size);
                SequentialAnimation on rotation {
                    PauseAnimation { duration: 200 + Math.random() * 200 }
                    NumberAnimation { from: -10; to: 10; duration: 500; easing.type: Easing.InOutCubic }
                    NumberAnimation { from: 10; to: -10; duration: 500; easing.type: Easing.InOutCubic }
                    loops: Animation.Infinite
                }
            }
        }
    }
}

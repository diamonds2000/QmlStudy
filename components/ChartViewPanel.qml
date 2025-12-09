import QtQuick
import QtCharts

Rectangle {
    id: chartPanel
    color: "#1e1e1e"
    
    ChartView {
        id: chartView
        anchors.fill: parent
        anchors.margins: 10
        title: "Dummy Chart"
        antialiasing: true
        theme: ChartView.ChartThemeDark
        backgroundColor: "#1e1e1e"
        titleColor: "#cccccc"
        legend.labelColor: "#cccccc"
        titleFont.pixelSize: 14
        legend.font.pixelSize: 10
        
        LineSeries {
            name: "Series 1"
            XYPoint { x: 0; y: 0 }
            XYPoint { x: 1; y: 2.1 }
            XYPoint { x: 2; y: 3.3 }
            XYPoint { x: 3; y: 2.1 }
            XYPoint { x: 4; y: 4.9 }
            XYPoint { x: 5; y: 3.0 }
            XYPoint { x: 6; y: 4.5 }
        }
        
        LineSeries {
            name: "Series 2"
            XYPoint { x: 0; y: 1.5 }
            XYPoint { x: 1; y: 1.8 }
            XYPoint { x: 2; y: 2.4 }
            XYPoint { x: 3; y: 3.1 }
            XYPoint { x: 4; y: 3.7 }
            XYPoint { x: 5; y: 4.2 }
            XYPoint { x: 6; y: 3.8 }
        }
    }
}

//
//  BarChartViewController.swift
//  Questionaire
//
//  Created by Xinyi Huang on 2018/11/13.
//  Copyright © 2018年 Xinyi Huang. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {
    
    //饼状图
    var chartView: PieChartView!
    var name = ""
    let animalLabel = ["🐺狼","🐱猫","🦊狐","🦌鹿","🐨考拉"]
    //分别对应上方label的顺序
    var animalValue = [0.0,0.0,0.0,0.0,0.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建饼图组件对象
        chartView = PieChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 260)
        self.view.addSubview(chartView)
        
        //生成5条随机数据
        let dataEntries = (0..<5).map { (i) -> PieChartDataEntry in
            return PieChartDataEntry(value: animalValue[i], label: "\(animalLabel[i])系")
        }
        let chartDataSet = PieChartDataSet(values: dataEntries, label: "动物系属性分布")
        chartView.legend.enabled = false//不显示图例
        let chartData = PieChartData(dataSet: chartDataSet)
        
        //设置饼状图数据
        chartView.data = chartData
        
        //设置颜色
        chartDataSet.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
        
        //设置选中扇区的伸出长度
        chartDataSet.selectionShift = 5
        //设置扇区间隔
        chartDataSet.sliceSpace = 3
        //设置字体样式
        chartData.setValueFont(.systemFont(ofSize: 14, weight: .light)) //字体
        chartData.setValueTextColor(.black) //颜色
        //设置饼图中心文字
        chartView.centerText = "\(name)的动物系属性"
        //空心半径黄金比例
        chartView.holeRadiusPercent = 0.382
        
        //将数值转化为百分比
        chartView.usePercentValuesEnabled = true
        //数值百分比格式化显示
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = "%"
        chartData.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        chartDataSet.valueLinePart1OffsetPercentage = 0.8 //折线中第一段起始位置相对于扇区偏移量（值越大距越远）
        chartDataSet.valueLinePart1Length = 0.55 //折线中第一段长度占比
        chartDataSet.valueLinePart2Length = 0.2 //折线中第二段长度最大占比
        chartDataSet.valueLineWidth = 1 //折线的粗细
        chartDataSet.valueLineColor = UIColor.brown //折线颜色
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



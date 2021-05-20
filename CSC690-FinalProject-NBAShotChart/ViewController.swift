//
//  ViewController.swift
//  CSC690-FinalProject-NBAShotChart
//
//  Created by JPL-ST-Spring2020 on 5/13/21.
//

import UIKit
import Charts


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    let statPickerData  = ["Points", "Assists"]
    var value: Int = 0
    @IBOutlet weak var BarGraph: UIView!
    
    
    @IBAction func search(_ sender: Any) {

        createChart()
    }
    
    
    
    private func createChart(){
        while let subview = BarGraph.subviews.last{
            subview.removeFromSuperview()
        }
        BarGraph.clearsContextBeforeDrawing = true
        let barChart = BarChartView(frame: CGRect(x: -200, y: -200, width: BarGraph.frame.size.width, height: BarGraph.frame.size.width))
        
        var point = [BarChartDataEntry]()
        point.append(BarChartDataEntry(x: Double(1), y: Double(32)))
        point.append(BarChartDataEntry(x: Double(2), y: Double(31.3)))
        point.append(BarChartDataEntry(x: Double(3), y: Double(28.8)))
        point.append(BarChartDataEntry(x: Double(4), y: Double(28.5)))
        
        var assist = [BarChartDataEntry]()
        assist.append(BarChartDataEntry(x: Double(1), y: Double(11.7)))
        assist.append(BarChartDataEntry(x: Double(2), y: Double(9.4)))
        assist.append(BarChartDataEntry(x: Double(3), y: Double(8.9)))
        assist.append(BarChartDataEntry(x: Double(4), y: Double(8.6)))
        
        var entries = point
        var tag:String = "Points"
        if(value==1){
            entries = assist
            tag = "Assist"
        }
        let set = BarChartDataSet(entries: entries, label: tag)
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
        BarGraph.addSubview(barChart)
        barChart.center = BarGraph.center
    }
    
    @IBOutlet weak var statPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statPicker.delegate = self
        self.statPicker.dataSource = self
        createChart()
        
        
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return statPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        value = row
    }
    
}


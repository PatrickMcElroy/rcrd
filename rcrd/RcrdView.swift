//
//  RcrdView.swift
//  rcrd
//
//  Created by Patrick McElroy on 10/21/19.
//  Copyright © 2019 Patrick McElroy. All rights reserved.
//

import Foundation
import UIKit
import Charts


class RcrdView: MainView {
    
    @IBOutlet weak var progressChart: LineChartView!
    
    var numRcrd: Int = 0
    
    var rcrdName: String?
    
    var localValuesArray: [String] = []

    @IBOutlet weak var oneRcrdViewText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oneRcrdViewText.text = rcrdName
        setChartValues(localValuesArray.count)
        // Do any additional setup after loading the view.
    }
    
    func setChartValues(_ count : Int = 20) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(localValuesArray[i])!
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set1 = LineChartDataSet(values: values, label: rcrdName)
        let data = LineChartData(dataSet: set1)
        
        set1.colors = [NSUIColor.black]
        set1.circleColors = [NSUIColor.black]
        set1.circleRadius = 5
        data.setValueTextColor(UIColor.clear)
        
        
        self.progressChart.data = data
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func deleteSegue(_ sender: Any) {
        let identifier: String = String(numRcrd)
        performSegue(withIdentifier: identifier, sender: self)
    }
    
}
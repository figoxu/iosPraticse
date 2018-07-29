//
//  ViewController.swift
//  计算器
//
//  Created by 许建辉 on 2018/7/29.
//  Copyright © 2018年 许建辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
        let label = UILabel(frame:CGRect(x:10,y:370,width:300,height:50))
        label.text = "你好"
        label.textColor = UIColor.red
        self.view.addSubview(label)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


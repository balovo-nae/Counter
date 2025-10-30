//
//  ViewController.swift
//  NewApp
//
//  Created by Yuriy Mur on 29.10.2025.
//

import UIKit

final class ViewController: UIViewController {
    private var title_showed: Bool = false
    private var count: Int = 0
    private var story: String = "История изменений:\n"

    @IBOutlet weak var div_title: UILabel!
    @IBOutlet weak var button_reset: UIButton!
    @IBOutlet weak var button_plus: UIButton!
    @IBOutlet weak var div_counter: UILabel!
    @IBOutlet weak var button_minus: UIButton!
    @IBOutlet weak var div_story: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        div_story.text = story
    }
    func current_time()->String{
        // функция возврата текущего времени
        let cD = Date()
        let dF = DateFormatter()
        dF.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let current_time = dF.string(from: cD)
        return (current_time)
    }


    @IBAction func click_plus(_ sender: Any) {
        // нажатие плюс
        if(!title_showed){
            // отображение тайтла
            div_title.text = "Значение счетчика"
            title_showed.toggle()
        }
        count+=1
        div_counter.text = String(count)
        story+="\(current_time()): изменено на +1\n"
        div_story.text = story
        //print(current_time())
    }
    
    @IBAction func click_minus(_ sender: Any) {
        // нажатие минус
        if(count>=1){
            // проверка на положительность
            count-=1
            div_counter.text = String(count)
            story+="\(current_time()): изменено на -1\n"
            div_story.text = story
        }
    }

    @IBAction func click_reset(_ sender: Any) {
        // действие при сбросе
        count=0
        div_counter.text = String(count)
        story+="\(current_time()): сброшено\n"
        div_story.text = story
    }
}


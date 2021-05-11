//
//  PostViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

enum TimerError: Error {
    case timerIsNill
}

class PostViewController: UIViewController {
    
    var post: Post?
    private var timer: Timer?
    
    private var timerLabel: UILabel  = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Primer"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimerLabel()
        title = post?.title
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        addTimer()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addTimer()
        
    }
    
    private func setupTimerLabel(){
        view.addSubview(timerLabel)
        
        timerLabel.snp.makeConstraints({
            $0.top.equalToSuperview().offset(150)
            $0.centerX.equalToSuperview()
        })
    }
    
    
    private func loadTimer(completion: (Result<Timer, TimerError>) -> Void) {
        var count = 0
        
        timer = Timer(timeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            count += 1
            self.timerLabel.text = "\(count)"
        })
        
        if let timer = timer {
            
            completion(.success(timer))
        } else {
            completion(.failure(.timerIsNill))
        }
    }
    
    private func addTimer(){
        
        loadTimer { result in
            switch result {
            case .success(let timer):
                RunLoop.current.add(timer, forMode: .default)
                timer.fire()
            case .failure(let error):
                handle(error: error)
            }
        }

    }
    
    private func handle(error: TimerError){
        timer?.invalidate()
        timer = nil
        timerLabel.text = nil
    }
    
}

//
//  FirstViewControllerViewModel.swift
//  Streaker
//
//  Created by Ryan Klein on 12/19/17.
//  Copyright © 2017 AJ Kueterman. All rights reserved.
//

import Foundation
import RxSwift
import AWSDynamoDB
import AWSCore

struct FirstViewControllerViewModel {
    
    
    func getStreaks() -> Observable<Streaks?>{
        
        let streaks = Variable<Streaks?>(nil)
        let mapper = AWSDynamoDBObjectMapper.default()
        mapper.load(Streaks.self, hashKey: 1, rangeKey: nil){
            objectModel, error in
            if let objectModel = objectModel as? Streaks{
                streaks.value = objectModel
            }
        }
        return streaks.asObservable()
    }
    
}

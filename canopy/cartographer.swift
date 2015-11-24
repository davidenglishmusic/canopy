//
//  cartographer.swift
//  canopy
//
//  Created by David English on 2015-11-23.
//  Copyright © 2015 David English. All rights reserved.
//

import Foundation

class Cartographer {
    
    let BORDER_BUFFER = 1.10
    
    func getMapSubSection(coordinatesA: [Float], coordinatesB: [Float]) {
        let left = determineExtreme(coordinatesA[0], coordinatesB[0], false) * BORDER_BUFFER
        let top = determineExtreme(coordinatesA[1], coordinatesB[1], true) * BORDER_BUFFER
        let bottom = determineExtreme(coordinatesA[1], coordinatesB[1], false) * BORDER_BUFFER
        let right = determineExtreme(coordinatesA[0], coordinatesB[0], true) * BORDER_BUFFER
        [left, top, bottom, right]
    }
    
    func getMapSubSection(coordinatesA: [Float], coordinatesB: [Float], coordinatesC: [Float]) {
        let left = determineExtreme(coordinatesA[0], coordinatesB[0], coordinatesC[0], false) * BORDER_BUFFER
        let top = determineExtreme(coordinatesA[1], coordinatesB[1], coordinatesC[1], true) * BORDER_BUFFER
        let bottom = determineExtreme(coordinatesA[1], coordinatesB[1], false) * BORDER_BUFFER
        let right = determineExtreme(coordinatesA[0], coordinatesB[0], coordinatesC[0], true) * BORDER_BUFFER
        [left, top, bottom, right]
    }
    
    func determineExtreme(coordinateA: Float, coordinateB: Float, high: Bool) -> Float {
        if high {
            if coordinateA > coordinateB {
                coordinateA
            }
            else {
                coordinateB
            }
        }
        else {
            if coordinateA < coordinateB {
                coordinateA
            }
            else {
                coordinateB
            }
        }
    }
    
    func determineExtreme(coordinateA: Float, coordinateB: Float, coordinateC: Float, high: Bool) -> Float {
        if high {
            if coordinateA > coordinateB && coordinateA > coordinateC {
                coordinateA
            }
            else{
                if coordinateB > coordinateC {
                    coordinateB
                }
                else {
                    coordinateC
                }
            }
        }
        else {
            if coordinateA < coordinateB && coordinateA < coordinateC {
                coordinateA
            }
            else {
                if coordinateB < coordinateC {
                    coordinateB
                }
                else {
                    coordinateC
                }
            }
        }
    }
    
}
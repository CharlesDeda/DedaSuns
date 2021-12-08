//
//  Nsuns.swift
//  DedaSuns
//
//  Created by Nick Deda on 12/8/21.
//

import Foundation

struct NsunsWorkout: Equatable {
  let nsunsSets: [Nsuns]
  
  init(max: Int) {
    self.nsunsSets = zip(
      [5, 3, 1, 3, 5, 3, 5, 3, 5],
      [75, 85, 95, 90, 85, 80, 75, 70, 65]
    ).map { reps, percentage -> Nsuns in
        .init(
          reps: reps,
          percentage: percentage,
          weight: Int(percentage * max / 100)
            .largestMultiple(of: 5)
        )
    }
  }
}

struct Nsuns: Identifiable, Equatable {
  let id = UUID()
  
  let reps: Int
  let percentage: Int
  let weight: Int
}

extension Int {
  func largestMultiple(of x: Int) -> Int {
    self - self % x
  }
}

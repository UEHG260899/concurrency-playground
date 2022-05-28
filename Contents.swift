import UIKit

let customQueue = DispatchQueue(label: "com.example.concurrent", qos: .userInteractive, attributes: .concurrent)
let dispatchGroup = DispatchGroup()



dispatchGroup.enter()
customQueue.async {
    PokemonService.shared.fetchBulbasaurInfo(dispatchGroup: dispatchGroup)
}

dispatchGroup.enter()
customQueue.async {
    PokemonService.shared.fetchIvysaurInfo(dispatchGroup: dispatchGroup)
}

dispatchGroup.wait()
dispatchGroup.notify(queue: .main) {
    print("All tasks completed")
}

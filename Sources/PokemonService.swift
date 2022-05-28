import Foundation

protocol PokemonServiceProtocol {
    func fetchBulbasaurInfo(dispatchGroup: DispatchGroup)
    func fetchIvysaurInfo(dispatchGroup: DispatchGroup)
}

public class PokemonService: PokemonServiceProtocol {
    
    public static let shared = PokemonService()
    
    private init () {}
    
    
    public func fetchBulbasaurInfo(dispatchGroup: DispatchGroup) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/1")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let pokemonData = data,
                  error == nil else {
                print("Error fetching bulbasaur data: \(error.debugDescription)")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let pokemon = try jsonDecoder.decode(Pokemon.self, from: pokemonData)
                print("Bulbasaur data: \(pokemon)")
                dispatchGroup.leave()
            } catch {
                print("Could not dequeue Bulbasaur")
            }

        }.resume()
    }
    
    public func fetchIvysaurInfo(dispatchGroup: DispatchGroup) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/2")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let pokemonData = data,
                  error == nil else {
                print("Error fetching bulbasaur data: \(error.debugDescription)")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let pokemon = try jsonDecoder.decode(Pokemon.self, from: pokemonData)
                print("Ivysaur data: \(pokemon)")
                dispatchGroup.leave()
            } catch {
                print("Could not dequeue json")
            }

        }.resume()
    }
    
}

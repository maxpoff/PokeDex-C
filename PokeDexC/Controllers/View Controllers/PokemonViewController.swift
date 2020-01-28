//
//  PokemonViewController.swift
//  PokeDexC
//
//  Created by Maxwell Poffenbarger on 1/28/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {
    
    //MARK: - Properties
    var pokemon: MOPPokemon? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
    }

    //MARK: - Private Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        
        MOPPokemonController.sharedInstance().fetchPokemon(withSearchTerm: searchTerm) { (pokemon) in
            self.pokemon = pokemon
        }
    }
    
    func updateViews() {
        guard let pokemon = pokemon else {return}
        DispatchQueue.main.async {
            self.nameLabel.text = pokemon.name
            self.idLabel.text = "ID: \(pokemon.identifier)"
            self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
        }
    }
}//End of class

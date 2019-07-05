//
//  MealsTableViewController.swift
//  prato-caloria
//
//  Created by Guest Iury Vasconcelos on 03/07/19.
//  Copyright © 2019 Iury Vasconcelos. All rights reserved.
//

import UIKit

class MealsTableViewController : UITableViewController, AddAMealDelegate {
    var meals = [Meal(name: "Eggplant Brownie", happiness: 5),
                 Meal(name: "Zucchini Muffin", happiness: 3)]
    
    func add(_ meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
    }// Adiciona a refeição no array e atualiza a tabela
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }// Cria um segue que é ativado assim que o botão para mudar de tela é clicado, antes de mudar de tela, no caso para a tela de adicionar
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return meals.count
    } //Retorna o número de linhas preenchido na tabela
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row //Pega a posição da linha
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                                   reuseIdentifier: nil)
        cell.textLabel!.text = meal.name //Adicionamos o '.name' para exibir apenas o nome da refeição na tabela
        return cell
    }// Popula a nova refeição na tabela
}

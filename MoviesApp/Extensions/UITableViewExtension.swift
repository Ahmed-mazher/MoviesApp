//
//  UITableViewExtension.swift
//  PlayWithUs
//
//  Created by Front Tech on 28/12/2021.
//

import UIKit

extension UITableView{
    
    func registerNib<Cell: UITableViewCell>(cell: Cell.Type){
        let nibName = String(describing: Cell.self)
        
        self.register(Cell.self, forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UITableViewCell>() -> Cell{
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {fatalError("Error in cell")}
        return cell
    }
    
}


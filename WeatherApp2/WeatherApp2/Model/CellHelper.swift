//
//  Helper.swift
//  WeatherApp2
//
//  Created by Josip Zidar on 15/01/2019.
//  Copyright © 2019 Josip Zidar. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T else {
            return T()
        }
        return cell
    }
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            return T()
        }
        return cell
    }
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T else {
            return T()
        }
        return headerFooterView
    }
    func registerNib<T: UITableViewCell>(_: T.Type)  {
         let nib = UINib(nibName: String(describing: T.self), bundle: Bundle(for: T.self))
        register(nib, forCellReuseIdentifier: String(describing: T.self))
    }
    func registerHeaderFooterNib<T: UITableViewHeaderFooterView>(f: T.Type) {
        print(f)
        let nib = UINib(nibName: String(describing: T.self), bundle: Bundle(for: T.self))
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }
}

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            return T()
        }
        return cell
    }
    func registerNib<T: UICollectionViewCell>(_: T.Type) {
        let nib = UINib(nibName: String(describing: T.self), bundle: Bundle(for: T.self))
        register(nib, forCellWithReuseIdentifier: String(describing: T.self))
        
    }
    func registerCellClass<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
}

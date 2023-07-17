//
//  DepositViewController.swift
//  ZKSyncExample
//
//  Created by Eugene Belyakov on 03/02/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import ZKSync
import web3swift
import Web3Core
import PromiseKit

class DepositViewController: UIViewController, WalletConsumer {

    var wallet: Wallet!

    @IBOutlet weak var amountTextField: UITextField!

    @IBAction func deposit(_ sender: Any) {

        amountTextField.resignFirstResponder()

        guard let amountText = amountTextField.text,
              let amount = Utilities.parseToBigUInt(amountText, units: .ether),
              amount > 0 else {

            self.present(UIAlertController.forIncorrectAmount(), animated: true, completion: nil)
            return
        }
    }
}

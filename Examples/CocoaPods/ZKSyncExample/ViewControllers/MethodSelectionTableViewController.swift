//
//  MethodSelectionTableViewController.swift
//  ZKSyncExample
//
//  Created by Eugene Belyakov on 07/01/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import ZKSync
import PromiseKit
import Web3Core
import web3swift

class MethodSelectionTableViewController: UITableViewController, WalletConsumer {

    var wallet: Wallet!

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var ethBalanceLabel: UILabel!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? WalletConsumer {
            destination.wallet = wallet
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.wallet.getAccountState { (result) in
            self.updateBalances(state: try? result.get())
        }
    }

    private func weiToETH(string: String) -> String? {
        guard let value = Utilities.parseToBigUInt(string, units: .wei) else {
            return nil
        }
        
        return Utilities.formatToPrecision(value)
    }

    private func updateBalances(state: AccountState?) {
        self.addressLabel.text = state?.address
        self.balanceLabel.text = weiToETH(string: state?.committed.balances["ETH"] ?? "0")
    }

    @IBAction func copyAddress(_ sender: Any) {
        UIPasteboard.general.string = self.addressLabel.text
    }
}

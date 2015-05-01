//
//  ViewController.swift
//
//  Created by Christina Moulton on 2015-04-29.
//  Copyright (c) 2015 Teak Mobile Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var itemsArray:Array<StockQuoteItem>?
  @IBOutlet var tableView: UITableView?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    NSNotificationCenter.defaultCenter().addObserver(self, selector: "processNewQuoteItems:", name: QuoteUpdater.updateNotificationName(), object: nil)
  }
  
  func processNewQuoteItems(notification: NSNotification?)
  {
    if let newQuotes = notification?.object as? Array<StockQuoteItem>
    {
      self.itemsArray = newQuotes
      self.tableView?.reloadData()
    }
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.itemsArray?.count ?? 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    let item = self.itemsArray?[indexPath.row]
    cell.textLabel?.text = ""
    cell.detailTextLabel?.text = ""
    if let symbol = item?.symbol
    {
      if let ask = item?.ask
      {
        cell.textLabel?.text = symbol + " @ $" + ask
      }
    }
    if let low = item?.yearLow
    {
      if let high = item?.yearHigh
      {
        cell.detailTextLabel?.text = "Year: " + low + " - " + high
      }
    }
    return cell
  }
  
}


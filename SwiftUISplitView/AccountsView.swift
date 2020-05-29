//
//  AccountsView.swift
//  SwiftUISplitView
//
//  Created by Ponraj, Rooban (Rooban Abraham) on 18/05/20.
//  Copyright © 2020 Rooban Abraham. All rights reserved.
//

import SwiftUI

struct TransactionViewModel : Hashable {
    var transactionDescription: String
    var transactionAmount: String

    init(transactionDescription: String, transactionAmount: String) {
        self.transactionDescription = transactionDescription
        self.transactionAmount = transactionAmount
    }
}

struct AccountViewModel : Hashable {
    var accountName: String
    var amount: String
    var amountLbl: String
    var asOfDate: String
    var transactionList: [TransactionViewModel]

    init(accountName: String, amount: String,amountLbl: String, asOfDate: String, transactionList:[TransactionViewModel]) {
        self.accountName = accountName
        self.amount = amount
        self.amountLbl = amountLbl
        self.asOfDate = asOfDate
        self.transactionList = transactionList
    }
}

// Accounts Overview

struct AccountOverviewView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.verticalSizeClass) var vsizeClass // For identifying compact / regular
    var accountViewModel: AccountViewModel // Model which used by view
    
    var body: some View {
        GeometryReader { geometry in // For identifying the screen size
            ScrollView {
             VStack(alignment: .center){
                Spacer()
                if self.sizeClass == .compact ||  self.vsizeClass == .compact {
    Text(self.accountViewModel.accountName).font(.title).padding(.top, 10)
                } else {
               Text(self.accountViewModel.accountName).font(.largeTitle).padding(.top, 10)
                }
                
                VStack(alignment: .center){
                   Spacer()
               Text(self.accountViewModel.amount).font(.largeTitle).bold().padding(.top, 10)
                Text(self.accountViewModel.amountLbl).font(.title).padding(.top, 10)
                   Spacer()
                }
                
                Spacer()
                if self.sizeClass == .compact ||  self.vsizeClass == .compact {
                   Text("As of date: \(self.accountViewModel.asOfDate)").font(.subheadline).padding(.top, 20)
                } else {
                    Text("As of date: \(self.accountViewModel.asOfDate)").font(.title).padding(.top, 20)
                }
                Spacer()
                Button(action: {
                       //do action
                }) {
                    if self.sizeClass == .compact ||  self.vsizeClass == .compact {
                     Text(" Account Detail ") .font(.body)
                    } else {
                     Text(" Account Detail ") .font(.largeTitle)
                    }
                }
                 .background(Color.gray)
                 .foregroundColor(Color.white)
                 .cornerRadius(5)
                
                Spacer()
                Spacer()
                }.frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}

// Transaction View
struct TransactionList : View {
  var transactionList: [TransactionViewModel]
    
  var body: some View {
    GeometryReader { geometry in
        List {
            
            Section(header:  Text("Transactions").font(.largeTitle).bold().frame(maxHeight: .infinity)) {
                
                ForEach(self.transactionList, id: \.self) { transaction in
                    HStack {
                    Text(transaction.transactionDescription).font(.title).frame(maxHeight: .infinity)
                        Spacer()
                        Spacer()
                        Text(transaction.transactionAmount).bold().foregroundColor(.black).font(.title).frame(maxHeight: .infinity)
                    }
                }
            }
        }
    }
  }
}


// Account Detail View - Combining both Accounts Overview & Transaction View
struct AccountsDetailView: View {
    var accountViewModel: AccountViewModel
    var body: some View {
        return GeometryReader { proxy in
                VStack(spacing: 10.0) {
                    AccountOverviewView(accountViewModel: self.accountViewModel)
                    Divider()
                    TransactionList(transactionList: self.accountViewModel.transactionList)
                    Spacer()
                }.padding(.all, 10)
            }.navigationBarTitle(Text("Account Detail").font(.largeTitle), displayMode: .inline)
    }
}


// Account List View
struct AccountListView : View {
 @State var selection: Int?
  var accountList: [AccountViewModel]
    
  var body: some View {
    GeometryReader { geometry in
        List {
            ForEach(0 ..< self.accountList.count) { (index) in
                NavigationLink(destination: AccountsDetailView(accountViewModel: self.accountList[index]),tag: index, selection: self.$selection) {
                    HStack {
                        Text(self.accountList[index].accountName).font(.title).frame(maxHeight: .infinity)
                        
                        Spacer()
                        Spacer()
                        Text(self.accountList[index].amount).bold().foregroundColor(.black).font(.title).frame(maxHeight: .infinity)
                    }
                }
            }
        }.onAppear {
            if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
            {
                self.selection = 0
            }
            else
            {
                  // Iphone
            }
        }.navigationBarTitle(Text("Accounts List").font(.largeTitle), displayMode: .inline)
    }
  }
}

// Parent View
struct AccountsSplitView: View {
var accountViewModel: AccountViewModel
var accountListModel: [AccountViewModel]
    init (accountViewModel: AccountViewModel, accountListModel: [AccountViewModel]) {
        self.accountViewModel = accountViewModel
        self.accountListModel = accountListModel
    }
        
var body: some View {
    return GeometryReader { proxy in
        NavigationView {
            AccountListView(accountList: self.accountListModel)
            PlaceholderView()
        }
    }
}
}

//Place holder - Detail View
struct PlaceholderView: View {
    var body: some View {
        return GeometryReader { proxy in
            VStack(spacing: 10.0) {
                Spacer()
            Text("Select account for getting detail information").font(.largeTitle).bold().padding(.top, 10)
            }.padding(.all, 10)

            }.navigationBarTitle(Text("Account Placeholder").font(.largeTitle), displayMode: .inline)
    }
}


extension UINavigationController {
    override public func viewDidLoad() {
        super.viewDidLoad()

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = .purple

        let compactAppearance = UINavigationBarAppearance()
        compactAppearance.backgroundColor = .purple

        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.backgroundColor = .purple

        navigationBar.standardAppearance = standardAppearance
        navigationBar.compactAppearance = compactAppearance
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance

    }
}




//
//  ContentView.swift
//  TreeTableView
//
//  Created by uktar on 2019/10/8.
//  Copyright © 2019 uktar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    let dataArray = treeModel.rootNode.getVisibleNodeList()
    var body: some View {
        DataList(nodeDataList: dataArray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

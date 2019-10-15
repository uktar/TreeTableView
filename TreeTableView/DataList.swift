//
//  DataList.swift
//  TreeTableView
//
//  Created by uktar on 2019/10/8.
//  Copyright © 2019 uktar. All rights reserved.
//

import SwiftUI

struct DataList: View {
    @State var nodeDataList: [NodeData]

    var body: some View {
        List(nodeDataList) { nodeData in
            DataRow(nodeDataList: self.$nodeDataList, nodeData: nodeData)
        }
    }
}

struct DataList_Previews: PreviewProvider {
    static let dataArray = treeModel.rootNode.getVisibleNodeList()
    static var previews: some View {
        DataList(nodeDataList: dataArray)
    }
}

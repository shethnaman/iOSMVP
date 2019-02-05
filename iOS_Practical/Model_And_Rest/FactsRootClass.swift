//
//  FactsRootClass.swift
//  iOS_Practical_Naman
//
//  Created by naman on 05/02/19.
//  Copyright © 2019 naman. All rights reserved.
//


import Foundation
struct FactsRootClass : Codable {
	let title : String?
	let rows : [FactsRow]?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case rows = "rows"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		rows = try values.decodeIfPresent([FactsRow].self, forKey: .rows)
	}

}

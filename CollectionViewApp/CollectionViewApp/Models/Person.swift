//
//  Person.swift
//  CollectionViewApp
//
//  Created by Matvei Khlestov on 27.04.2024.
//

struct Person {
    let name: String
    let profileImage: String
    let largeImage: String
    let date: String
    let description: String
    
    static func getPerson() -> [Person] {
        [
            Person(
                name: "Artur",
                profileImage: "Artur",
                largeImage: "LargeImage1",
                date: "23 апреля 2024",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in"
            ),
            
            Person(
                name: "Sergei",
                profileImage: "Sergei",
                largeImage: "LargeImage2",
                date: "24 апреля 2024",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore"
            ),
            
            Person(
                name: "Elena",
                profileImage: "Elena",
                largeImage: "LargeImage3",
                date: "25 апреля 2024",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do"
            )
        ]
    }
}

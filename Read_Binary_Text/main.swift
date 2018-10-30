//
//  main.swift
//  Read_Binary_Text
//
//  Created by Queralt Sosa Mompel on 30/10/18.
//  Copyright © 2018 Queralt Sosa Mompel. All rights reserved.
//

import Foundation

var text = ""
var alphabet: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                          "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                          "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                          "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

var alphabet_binary : [String] = ["01000001", "01000010", "01000011", "01000100", "01000101", "01000110", "01000111", "01001000", "01001001", "01001010", "01001011", "01001100", "01001101", "01001110", "11010001", "01001111", "01010000", "01010001", "01010010", "01010011", "01010100", "01010101", "01010110", "01010111", "01011000", "01011001", "01011010", "01100001", "01100010", "01100011", "01100100", "01100101", "01100110", "01100111", "01101000", "01101001", "01101010", "01101011", "01101100", "01101101", "01101110", "11110001", "01101111", "01110000", "01110001", "01110010", "01110011", "01110100", "01110101", "01110110", "01110111", "01111000", "01111001", "01111010", "00100000"]

func get_letter (binary_number : String) -> (){
    let index = alphabet_binary.index(of: binary_number)
    text += alphabet[index!]
}

func read_binary_text (contents : NSString) -> () {
    var counter_8 = 0
    var binary_number = ""
    for line in contents.components(separatedBy: "\n") {
        for char in line {
            if (counter_8 < 7) {
                binary_number += String(char)
                counter_8 += 1
            } else {
                binary_number += String (char)
                get_letter(binary_number: binary_number)
                binary_number = ""
                counter_8 = 0
            }
        }
        text += "\n"
    }
    print (text)
}

func read_file(contents : NSString) -> () {
    let start = Date()
    print("Current local date and time (START)\n\(start)")
    read_binary_text(contents : contents)
    let end = Date()
    print("Current local date and time (END)\n\(end)")
    get_difference_of_times(start: start, end: end)
}

func get_difference_of_times (start : Date, end : Date) -> () {
    let components = Calendar.current.dateComponents([.minute, .second, .nanosecond], from: start, to: end)
    print("Difference is \(components.minute ?? 0) minutes, \(components.second ?? 0) seconds and \(components.nanosecond ?? 0) nanoseconds.")
}

if CommandLine.argc < 3 {
    let contents = try NSString(contentsOfFile: CommandLine.arguments[1], encoding: String.Encoding.utf8.rawValue)
        read_file(contents: contents)
} else {
    print("Error in arguments")
}

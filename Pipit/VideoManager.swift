//
//  VideoManager.swift
//  Pipit
//
//  Created by Nick Thompson on 6/12/18.
//  Copyright © 2018 Nick Thompson. All rights reserved.
//

import Cocoa

class VideoManager {

    static func getURL(url: URL) -> URL? {
        return URL(string: self.execCommand(args: ["-f", "mp4", "-g", url.absoluteString]))
    }
    
    private static func execCommand(args: [String]) -> String {
        guard let execURL = Bundle.main.executableURL else {
            return ""
        }
        
        let command = "\(execURL.deletingLastPathComponent().path)/youtube-dl"

        let proc = Process()
        proc.launchPath = command
        proc.arguments = args
        let pipe = Pipe()
        proc.standardOutput = pipe
        proc.launch()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: String.Encoding.utf8)!.replacingOccurrences(of: "\n", with: "")
    }
}

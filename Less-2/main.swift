
//  Car.swift
//  Created by Shamil Aglarov on 09.04.2022.
// Task number 7

import Foundation

// MARK: - ParserErrors
enum ParserErrors: Error {
    case invalidUrl(String)
    case downloadError
    case jsonParseError
    case noResult
}

// MARK: - UrlObjectLoader
final class UrlObjectLoader {
    let url: URL

    init(_ address: String) throws {
        guard let safeUrl = URL.init(string: address) else {
            throw ParserErrors.invalidUrl(address)
        }
        url = safeUrl
    }

    public func getData() async throws -> Any {
        let session = URLSession.shared

        let data = try? await session.data(from: url)
        guard let data = data?.0 else {
            throw ParserErrors.downloadError
        }

        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            throw ParserErrors.jsonParseError
        }

        return json
    }

}

// MARK: - main entry

let address = CommandLine.argc > 1
    ? CommandLine.arguments[1]
    : "https://itunes.apple.com/search?term=dark+tranquillity&entity=album"

let group = DispatchGroup()
group.enter()

Task {
    defer {
        print("task leave")
        group.leave()
    }
    print("task run")
    do {
        print("task urlloader start")
        let urlObjectLoader = try UrlObjectLoader(address)

        print("task session start")
        let json = try await urlObjectLoader.getData()

        print(json)
    } catch {
        switch error {
        case ParserErrors.invalidUrl(let message):
            print("Invalid url: \(message)")
        case ParserErrors.downloadError:
            print("download from url failed")
        case ParserErrors.jsonParseError:
            print("This not json object")
        default:
            print("Runtime exception")
            print(error)
        }
    }
}

group.wait()
print("end")


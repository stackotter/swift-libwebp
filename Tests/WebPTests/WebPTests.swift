import XCTest
import Foundation
@testable import WebP

final class WebPTests: XCTestCase {
    func testDecoding() throws {
        let data = try Data(contentsOf: URL(fileURLWithPath: "Tests/WebPTests/fjord.webp"))
        let image = try WebP.decode([UInt8](data))
        XCTAssertEqual(image.width, 550)
        XCTAssertEqual(image.height, 368)
    }

    func testEncoding() throws {
        var rgba: [UInt8] = []
        for x in 0..<10 {
            for y in 0..<10 {
                let r = 25 * UInt8(x)
                let g = 25 * UInt8(y)
                let b: UInt8 = 0
                let a: UInt8 = 255
                rgba.append(contentsOf: [r, g, b, a])
            }
        }
        let image = WebP(
            width: 10,
            height: 10,
            rgba: rgba
        )
        let data = try image.encode(quality: 100)
        try Data(data).write(to: URL(fileURLWithPath: "colortest.webp"))
    }
}

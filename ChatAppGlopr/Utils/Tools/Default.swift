import Foundation
import UIKit

struct Defaults {
    enum FrameSize {
        static let archiveGridWidth: CGFloat =
            DeviceUtil.isPadWidth ? 175 : DeviceUtil.isSEWidth ? 125 : 150
        static var cardCellWidth: CGFloat { DeviceUtil.windowW * 0.8 }
        static let cardCellHeight: CGFloat = Defaults.ImageSize.headerH + 20 * 2
        static var cardCellSize: CGSize {
            .init(width: cardCellWidth, height: cardCellHeight)
        }

        static var rankingCellWidth: CGFloat {
            (DeviceUtil.isPadWidth ? 0.4 : 0.7) * DeviceUtil.windowW
        }

        static var alertWidthFactor: Double {
            DeviceUtil.isPadWidth ? 0.5 : 1.0
        }
    }

    enum ImageSize {
        static let rowAspect: CGFloat = 8/11
        static let headerAspect: CGFloat = 8/11
        static let previewAspect: CGFloat = 8/11
        static let contentAspect: CGFloat = 7/10
        static let webtoonMinAspect: CGFloat = 1/4
        static let webtoonIdealAspect: CGFloat = 2/3

        static let rowW: CGFloat = rowH * rowAspect
        static let rowH: CGFloat = 120
        static let headerW: CGFloat = headerH * headerAspect
        static let headerH: CGFloat = 150
        static let previewMinW: CGFloat = DeviceUtil.isPadWidth ? 180 : 100
        static let previewMaxW: CGFloat = DeviceUtil.isPadWidth ? 220 : 120
        static let previewAvgW: CGFloat = (previewMinW + previewMaxW)/2
    }

    enum Cookie {
        static let yay = "yay"
        static let null = "null"
        static let expired = "expired"
        static let mystery = "mystery"
        static let ignoreOffensive = "nw"
        static let selectedProfile = "sp"
        static let skipServer = "skipserver"

        static let igneous = "igneous"
        static let ipbMemberId = "ipb_member_id"
        static let ipbPassHash = "ipb_pass_hash"
    }

    enum DateFormat {
        static let dayMonthYear = "dd MMMM yyyy"
        static let yearMonthDayHourMinute = "yyyy-MM-dd HH:mm"
        static let dayMonthYearHourMinute = "dd MMMM yyyy, HH:mm"
        static let iso8601 = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    }

    enum FilePath {
        static let logs = "logs"
    }

    enum Regex {
        static let tagSuggestion: NSRegularExpression? = try? .init(pattern: "(\\S+:\".+?\"|\".+?\"|\\S+:\\S+|\\S+)")
    }
}

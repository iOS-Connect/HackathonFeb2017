import UIKit

class DetailViewController: UIViewController {

    var setLoop = false
    lazy var start:Float = { Float(self.montage.clips.first!.start_time!) }()
    lazy var end:Float = { Float(self.montage.clips.first!.end_time!) }()

    var currentID: String!

    var montage: Montage!

    @IBOutlet var player: YTPlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        player.delegate = self

        guard let url = montage.yt_url
        else {
            return
        }

        let comp = URLComponents(string: url)!
        let id = comp.queryItems?.flatMap({ (item) -> String? in
            if item.name == "v" {
                return item.value
            }
            return nil
        })

        guard let ids = id, let first = ids.first else { return }
        currentID = first

        let playerVars = ["controls":0,"playsinline":1, "autohide":1, "showinfo":0, "modestbranding":1, "autoplay":1]
        player.load(withVideoId: currentID, playerVars: playerVars)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player.pauseVideo()
    }
}

extension DetailViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {

        playerView.loadVideo(byId: currentID, startSeconds: start, endSeconds: end, suggestedQuality: .small)
        playerView.playVideo()
    }

    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        print("changed to state \(state)")
    }

    func playerView(_ playerView: YTPlayerView, didChangeTo quality: YTPlaybackQuality) {
        print("Quality \(quality)")
    }

    func playerView(_ playerView: YTPlayerView, receivedError error: YTPlayerError) {
        print("got Error \(error)")
    }
    func playerView(_ playerView: YTPlayerView, didPlayTime playTime: Float) {
        print("Played \(playTime)")
    }
}


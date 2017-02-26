
import UIKit

class DetailViewController: UIViewController {

    var setLoop = false
    lazy var start:Float = { Float(self.montage.clips.first!.start_time!) }()
    lazy var end:Float = { Float(self.montage.clips.first!.end_time!) }()

    var montage: Montage!

    @IBOutlet var player: YTPlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        player.delegate = self

        montage = Montage()
        montage.author = "Max"
        montage.yt_url = "https://www.youtube.com/watch?v=xecEV4dSAXE"
        montage.desc = "This is another test."
        montage.title = "MAX!"
        montage.montage_id = "1111AAAA"
        montage.clips = [Clip(startTime: 10, endTime: 20, thumbNailUrl: nil)]

        guard let url = montage.yt_url
        else {
            return
        }

        //player.loadVideo(byURL: url, startSeconds: start, endSeconds: end, suggestedQuality: .highRes)
        //player.load(withVideoId: "nS-rnG_DGHA")
        let playerVars = ["controls":0,"playsinline":1, "autohide":1, "showinfo":0, "modestbranding":1, "autoplay":1]
        player.load(withVideoId: "xecEV4dSAXE", playerVars: playerVars)
        //player.loadVideo(byId: "nS-rnG_DGHA", startSeconds: start, endSeconds: end, suggestedQuality: .small)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player.pauseVideo()
    }
}

extension DetailViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {

        playerView.loadVideo(byId: "", startSeconds: start, endSeconds: end, suggestedQuality: .small)
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


//
//  ViewController.swift
//  Music App - CSC 648
//
//  Created by VJ 2 on 12/7/23.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    func configureSongs() {
        songs.append(Song(name: "Background music",
                          albumName: "Dark Knight",
                          artistName: "Hans Zimmer",
                          imageName: "cover1",
                          trackName: "DarkKnight"))
        songs.append(Song(name: "Interstellar",
                          albumName: "Interstellar",
                          artistName: "Hans Zimmer",
                          imageName: "cover2",
                          trackName: "Interstellar"))
        songs.append(Song(name: "Oppenhimer",
                          albumName: "Oppenhimer",
                          artistName: "Ludwig Göransson",
                          imageName: "cover3",
                          trackName: "Oppenhimer"))
        songs.append(Song(name: "John Wick",
                          albumName: "John Wick",
                          artistName: "Le Castle Vania",
                          imageName: "cover4",
                          trackName: "JohnWick"))
        songs.append(Song(name: "Portals",
                          albumName: "Avengers",
                          artistName: "Alan Silvestri",
                          imageName: "cover6",
                          trackName: "portals"))
  
    }

    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 19)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }


}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}


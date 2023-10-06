namespace :import do
  task english: :environment do
    hymnal = Playlist.find_or_create_by(name: "Athens Songbook")

    filename = Jets.root.join("db", "serverless.txt")

    delim = "DELIMITER"
    File.foreach(filename, delim) do |txt|
      # get rid of delimiter
      txt = txt.sub(delim, "")

      # get index number
      index_regex = /\AE([0-9]+)\n/
      hymnal_index = txt.match(index_regex)[1]

      # remove index number from txt
      txt = txt.sub(txt[index_regex], "")
      # comment out comments
      comments_regex = /^ *(\(?(([^#\n]*\d[a-z]|(Goes up a key)|[^#\n]*repeat chorus|\([Pp]arts|[Rr]epeat|20\d\d|[Nn]ew tune|[Oo]riginal tune|[Cc]apo [^\s]|[Ss]tanza ? \S?|[Cc]horus|[Ii]nterlud|[Pp]arts [AB12]|[Bb]anner \d|[^#\n].*&|\*).*)|([Pp]art [^\s]+|[Bb]rothers:?|[Ss]isters:?|Brothers & Sisters)$)/
      txt = txt.sub(comments_regex, '#\1') while txt =~ comments_regex
      # personal vendetta against em dash misuse
      em_dash_regex = /(\S)— (\S)/
      txt = txt.sub(em_dash_regex, '\1—\2') while txt =~ em_dash_regex

      # convert 'chorus' to 2-space padding
      chorus_regex = /^\nchorus((?:\n[^\n]+)+)/
      txt = txt.gsub(chorus_regex) { $1.gsub("\n", "\n  ") }
      if Song.find_by(title: guess_firstline_title(txt)).present?
        s = Song.find_by(title: guess_firstline_title(txt))
        s.song_number = hymnal_index
        s.lyrics = txt
        s.save!
        if PlaylistSong.find_by(playlist: hymnal, song: s).present?
          next
        else
          PlaylistSong.create(playlist: hymnal, song: s)
        end
      else
        s = Song.create(lyrics: txt, title: guess_firstline_title(txt), song_number: hymnal_index, language: "english")
        PlaylistSong.create(playlist: hymnal, song: s)

      end
    rescue => e
      puts e
      next
    end
  end

end

def guess_firstline_title(lyrics)
  strip_line(/^[^#\r\n0-9].*/.match(lyrics)[0])
end

def strip_line line
  # strip chords, newlines, trailing punctuation
  line.gsub(/\[[^\]]*\]/, "") # chords
    .gsub(/\n|\r/, "") # new lines
    .gsub(/\A[,;: .!]*/, "") # leading punctuation
    .gsub(/\[,;: .!-—–z/, "") # trailing punctuation
end

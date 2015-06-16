require_relative "../lib/song.rb"
require_relative "../lib/jukebox.rb"

# Use this song data for your tests
songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]

describe Song do
  it "can be initialized" do
    song = "The Phoenix - 1901"
    expect(Song.new(song)).to be_an_instance_of(Song)
  end
end

describe Jukebox do

  let(:songs) { songs }
  let(:jukebox) {Jukebox.new(songs)}
  let(:songs_list) {"1 The Phoenix - 1901\n2 Tokyo Police Club - Wait Up\n3 Sufjan Stevens - Too Much\n4 The Naked and the Famous - Young Blood\n5 (Far From) Home - Tiga\n6 The Cults - Abducted\n7 The Phoenix - Consolation Prizes\n"}

  it "can be initialized" do
    expect(Jukebox.new(songs)).to be_an_instance_of(Jukebox)
  end

  it "can read its songs" do
    expect(jukebox.songs).to eq(songs)
  end

  it "turns on when initialized" do
    jukebox = Jukebox.new(songs)
    expect(jukebox.on?).to eq(true)
  end

  describe "#help" do
    it "returns a list of commands" do
      expect(jukebox.help).to eq("Please select help, list, exit, or play.")
    end
  end

  describe "#list" do
    it "lists out songs" do 
      expect(jukebox.list).to eq(songs_list)
    end
  end

  describe "#play" do
    it "plays a song" do
      expect(jukebox.play("The Phoenix - 1901")).to eq("now playing The Phoenix - 1901")
    end
  end

  describe "#exit" do
    
    it "turns off the jukebox" do
      jukebox.exit
      expect(jukebox.on?).to eq(false)
    end

    it "says goodbye" do
      expect(jukebox.exit).to eq("Goodbye, thanks for listening!")
    end
  end

  describe "#command" do

    it "executes #help when passed 'help'" do
      expect(jukebox.command("help")).to eq(jukebox.help)   
    end

    it "executes #list when passed 'list'" do
      expect(jukebox.command("list")).to eq(jukebox.list)
    end

    it "executes #exit when passed 'exit'" do
      expect(jukebox.command("exit")).to eq(jukebox.exit)
    end

    it "plays a song when passed 'song'" do
      expect(jukebox.command("play The Phoenix - 1901")).to eq(jukebox.play("The Phoenix - 1901"))
    end

    it "rejects an invalid command" do 
      expect(jukebox.command("blah blah blah")).to eq("invalid command")
    end

  end

end

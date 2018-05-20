rails g scaffold artist name:string bio:text birthdate:datetime alter_name:string
rails g scaffold band name:string bio:text start_date:datetime end_date:datetime
rails g model artist_band artist:references band:references joined:datetime left:datetime
rails g scaffold song name:string author:references{polymorphic} duration:integer date:datetime
rails g scaffold album name:string author:references{polymorphic} duration:integer date:datetime
rails g model album_song song:references album:references

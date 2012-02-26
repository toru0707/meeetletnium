class Window
	constructor: (@title, @url) ->
		return Titanium.UI.createWindow
			titleid:@title
			url:@url
			backgroundColor:'#fff'

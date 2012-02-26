class Tab
	constructor: (@tabTitle, @winTitle, @icon, @url) ->
		@window = new Window @winTitle, @url
		@tab = Titanium.UI.createTab
			icon:@icon
			titleid:@tabTitle
			window:@window
		@createContents()
	createContents: ->
		label = Titanium.UI.createLabel
			color:'#999'
			text:'I am Window on '+@winTitle
			font:
				fontSize:20
				fontFamily:'Helvetica Neue'
			textAlign:'center'
			width:'auto'
		label.addEventListener 'click', ->
			alert 'OK'
			log 'OK'
		@window.add label


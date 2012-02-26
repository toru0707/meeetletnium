class TabGroup
	constructor: () ->
		@tabGroup = Titanium.UI.createTabGroup()
		return @tabGroup
class Tab
	constructor: (@tabTitle, @winTitle, @icon, @url) ->
		@window = new Window @winTitle, @url
		@tab = Titanium.UI.createTab
			icon:@icon
			titleid:@tabTitle
			window:@window
class Window
	constructor: (@title, @url) ->
		return Titanium.UI.createWindow
			titleid:@title
			url:@url
			backgroundColor:'#fff'

Titanium.UI.setBackgroundColor('#000');

tabGroup = new TabGroup()
tab1 = new Tab 'adjusted_tab_title', 'adjusted_win_title', '', 'main_windows/adjusted_events.js'
tabGroup.addTab tab1.tab
tab2 = new Tab 'adjusting_tab_title', 'adjusting_win_title', '', 'main_windows/adjusting_events.js'
tabGroup.addTab tab2.tab
tab3 = new Tab 'public_tab_title', 'public_win_title', '', 'main_windows/public_events.js'
tabGroup.addTab tab3.tab
tab4 = new Tab 'create_tab_title', 'create_win_title', '', 'main_windows/create_event.js'
tabGroup.addTab tab4.tab

tabGroup.addEventListener 'open', (e) =>
	Titanium.UI.setBackgroundColor('#fff')
tabGroup.setActiveTab 0
tabGroup.open {
	transition:Titanium.UI.iPhone.AnimationStyle.FLIP_FROM_LEFT
}

tabGroup.open

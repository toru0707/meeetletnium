win = Ti.UI.currentWindow
tab = Ti.UI.currentTab

Ti.Facebook.appid = "150258521734656"
Ti.Facebook.permissions = ['publish_stream', 'read_stream']

# Login Status
label = Ti.UI.createLabel {
	text:'Logged In = ' + Ti.Facebook.loggedIn,
	font:{fontSize:14},
	height:'auto',
	top:10,
	textAlign:'center'
}
win.add label

forceButton = Ti.UI.createButton {
	title:'Force dialog: '+Ti.Facebook.forceDialogAuth,
	top:50,
	width:160,
	height:40
}
forceButton.addEventListener 'click', () -> 
	Ti.Facebook.forceDialogAuth = !Ti.Facebook.forceDialogAuth
	forceButton.title = "Force dialog: "+Ti.Facebook.forceDialogAuth
win.add forceButton

updateLoginStatus = -> 
	label.text = 'Logged In = ' + Ti.Facebook.loggedIn
Ti.Facebook.addEventListener 'login', updateLoginStatus
Ti.Facebook.addEventListener 'logout', updateLoginStatus

# Login Button
if Ti.Platform.name == 'iPhone OS'
	win.add Ti.Facebook.createLoginButton {
		style:Ti.Facebook.BUTTON_STYLE_WIDE,
		bottom:30
	}
else
	win.add Ti.Facebook.createLoginButton {
		style:'wide',
		bottom:30
	}



#scrollView = Ti.UI.createScrollView {
#  contentWidth:'auto',
#  contentHeight:'auto',
#  top:0,
#  bottom:0,
#  showVerticalScrollIndicator:true
#  }
#contentView = Ti.UI.createView {
#  top:0,
#	height:win.height * 2,
#	width:win.width,
#	layout:'vertical'
#  }
#scrollView.add contentView
## title
#loginLabel = Ti.UI.createLabel {
#	text:'ログイン情報',
#	top:0,
#	left:30,
#	width:250,
#	height:'auto'
#}
#loginUserField = Ti.UI.createTextField {
#	hintText:'ユーザIDを入力',
#	height:35,
#	top:0,
#	left:30,
#	width:250,
#	borderStyle:Ti.UI.INPUT_BORDERSTYLE_ROUNDED
#}
#loginPassField = Ti.UI.createTextField {
#	hintText:'パスワードを入力',
#	height:35,
#	top:0,
#	left:30,
#	width:250,
#	borderStyle:Ti.UI.INPUT_BORDERSTYLE_ROUNDED
#}
#loginButton = Ti.UI.createButton {
#	title:'ログイン',
#	height:35,
#	top:0,
#	left:30,
#	width:250
#}
#contentView.add loginLabel 
#contentView.add loginUserField
#contentView.add loginPassField
#contentView.add loginButton
#
#win.add scrollView

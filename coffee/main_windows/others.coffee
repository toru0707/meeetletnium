win = Ti.UI.currentWindow;
scrollView = Ti.UI.createScrollView {
  contentWidth:'auto',
  contentHeight:'auto',
  top:0,
  bottom:0,
  showVerticalScrollIndicator:true
  }
contentView = Ti.UI.createView {
  top:0,
	height:win.height * 2,
	width:win.width,
	layout:'vertical'
  }
scrollView.add contentView
# title
loginLabel = Titanium.UI.createLabel {
	text:'ログイン情報',
	top:0,
	left:30,
	width:250,
	height:'auto'
}
loginUserField = Titanium.UI.createTextField {
	hintText:'ユーザIDを入力',
	height:35,
	top:0,
	left:30,
	width:250,
	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
}
loginPassField = Titanium.UI.createTextField {
	hintText:'パスワードを入力',
	height:35,
	top:0,
	left:30,
	width:250,
	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
}
loginButton = Titanium.UI.createButton {
	title:'ログイン',
	height:35,
	top:0,
	left:30,
	width:250
}
contentView.add loginLabel 
contentView.add loginUserField
contentView.add loginPassField
contentView.add loginButton

win.add scrollView

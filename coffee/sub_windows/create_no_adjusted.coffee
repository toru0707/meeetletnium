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
eventTitle = Titanium.UI.createLabel {
	text:'タイトル',
	top:0,
	left:30,
	width:100,
	height:'auto'
}
eventTitleField = Titanium.UI.createTextField {
	hintText:'タイトルを入力してください',
	height:35,
	top:0,
	left:30,
	width:250,
	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
}
contentView.add eventTitle
contentView.add eventTitleField

# 場所
candPlace = Titanium.UI.createLabel {
	text:'場所',
	top:0,
	left:30,
	width:100,
	height:'auto'
}
candPlaceButton = Titanium.UI.createButton {
	title:'場所',
	height:35,
	top:0,
	left:30,
	width:250
}
candPlaceButton.addEventListener 'click', (e) =>
  #場所選択用Spinnerを表示
contentView.add candPlace
contentView.add candPlaceButton

#日付
candDate = Titanium.UI.createLabel {
	text:'日付',
	top:0,
	left:30,
	width:100,
	height:'auto'
}
candDateButton = Titanium.UI.createButton {
	title:'日付',
	height:35,
	top:0,
	left:30,
	width:250
}
candDateButton.addEventListener 'click', (e) => 
  #DatePickerを表示
contentView.add candDate
contentView.add candDateButton

#想定予算額
assumedBudget = Titanium.UI.createLabel {
	text:'想定予算額',
	top:0,
	left:30,
	width:'auto',
	height:'auto'
}
assumedBudgetField = Titanium.UI.createTextField {
	hintText:'想定予算を入力してください',
	height:35,
	top:0,
	left:30,
	width:250,
	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
}
contentView.add assumedBudget
contentView.add assumedBudgetField

#ジャンル
candGenre = Titanium.UI.createLabel {
	text:'ジャンル',
	top:0,
	left:30,
	width:100,
	height:'auto'
}
candGenreButton = Titanium.UI.createButton {
	title:'ジャンル',
	top:0,
	height:35,
	left:30,
	width:250
}
candGenreButton.addEventListener 'click', (e) => 
  #セレクタを表示
contentView.add candGenre
contentView.add candGenreButton

#店
candShop = Titanium.UI.createLabel {
	text:'店',
	top:0,
	left:30,
	width:'auto',
	height:'auto'
}
candShopField = Titanium.UI.createTextField {
	hintText:'店名を入力してください',
	height:35,
	top:0,
	left:30,
	width:250,
	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
}
contentView.add candShop
contentView.add candShopField

inviteFriendsButton = Titanium.UI.createButton {
	title:'友人を誘う',
	top:0,
	height:35,
	left:30,
	width:250
}
inviteFriendsButton.addEventListener 'click', (e) =>
  target = Ti.UI.createWindow {
    titleid : '誘う人',
    url : '../sub_windows/invite_friends.js'
  }
  tab.open target


createEventButton = Titanium.UI.createButton {
	title:'作成',
	top:0,
	height:35,
	left:30,
	width:250
} 
contentView.add inviteFriendsButton
contentView.add createEventButton

win.add scrollView

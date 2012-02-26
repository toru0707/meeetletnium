win = Titanium.UI.currentWindow
tab = Ti.UI.currentTab

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

titleLabel = Titanium.UI.createLabel {
  text:'新人懇親ランチ',
  font:{fontSize:20}
  top:0,
  left:30,
  width:250,
  height:'auto'
}
contentView.add titleLabel

data = []

data[0] = Ti.UI.createTableViewRow {title:'希望場所：銀座'}
data[1] = Ti.UI.createTableViewRow {title:'希望日付：12/1 12:00'}
data[2] = Ti.UI.createTableViewRow {title:'希望予算：1000円以内'}
data[3] = Ti.UI.createTableViewRow {title:'希望ジャンル：中華'}
data[4] = Ti.UI.createTableViewRow {title:'希望店舗：中華一番'}

# create table view
tableview = Titanium.UI.createTableView {
	data:data,
	bottom:30,
	left:20,
	right:20,
	height:178,
	borderWidth:2,
	borderRadius:10,
	borderColor:'#222'
}

contentView.add tableview

inviteFriendsButton = Ti.UI.createButton {
  title:'友人を誘う',
  top:0,
  left:30,
  width:250,
  height:35
}

inviteFriendsButton.addEventListener 'click', (e) =>
  target = Ti.UI.createWindow {
    titleid : '誘う人',
    url : '../sub_windows/invite_friends.js'
  }
  tab.open target

contentView.add inviteFriendsButton 

sendButton = Ti.UI.createButton {
  title:'送信',
  top:0,
  left:30,
  width:250,
  height:35
}
contentView.add sendButton

win.add scrollView

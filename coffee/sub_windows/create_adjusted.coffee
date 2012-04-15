Ti.include("../helpers/validation.js")
Ti.include("../helpers/util.js")
Ti.include("../helpers/api.js")
Ti.include("../helpers/constants.js")

win = Ti.UI.currentWindow
tab = Ti.UI.currentTab

preEventData = {
  'title':"",
  'dates':[], 
  'cities':[], 
  'stations':[],
  'budgets':[],
  'genres':[],
  'shops':[],
  'comment':"",
  'maxNumber':0,
  'deadline':"",
  'privateOnly':"",
  'participants':[]}

createEventData = () => 
  title = eventTitleField.value
  dates = []
  #for i in 0 .. 
    #  return "{'title':eventTitleField.value, 
    #'date':eventDa

win.addEventListener 'open', (e) =>
  Ti.API.log "win : " + win.title + " is opend"
  #api = new Api BASE_URL
  new Api(BASE_URL).getAllPrefectures (data) => 
    Ti.API.log "getAllPrefectures."
    #set data to 
    data = JSON.parse data
    [
      {title:'apple',  hasChild:true, url:'http://www.apple.co.jp', value:10},
      {title:'amazon', hasChild:true, url:'http://www.amazon.co.jp', value:11},
      {title:'google', hasChild:true, url:'http://www.google.co.jp', value:12}
    ]

  new Api( BASE_URL).getAllGenres (data) => 
    Ti.API.log "getAllGenres."
    #set data to 
    data = JSON.parse data
    [
      {title:'apple',  hasChild:true, url:'http://www.apple.co.jp', value:10},
      {title:'amazon', hasChild:true, url:'http://www.amazon.co.jp', value:11},
      {title:'google', hasChild:true, url:'http://www.google.co.jp', value:12}
    ]

  new Api( BASE_URL) .getAllBudgets (data) => 
    Ti.API.log "getAllBudgets."
    #set data to 


p_hash = {
  "eventTitle" : "",
  "candPlace" : {},
  "candDate" : {},
  "assumedBudget" : {},
  "candGenre" : {},
  "candShop" : {},
  "inviteFriends" : {},
  "maxMember" : 0
}

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
	left:N_LFT,
	width:N_WDT,
	height:'auto'
  }
eventTitleField = Titanium.UI.createTextField {
  hintText:'タイトルを入力してください',
  height:N_HGT,
	top:0,
	left:N_LFT,
	width:N_WDT,
	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED
  }
eventTitleField.addEventListener 'change', (e) ->
  val.validate 
  createEventButton.enabled = (val.errors[e.source.hintText]) ? false : true
  p_hash['eventTitle'] = e.value

contentView.add eventTitle
contentView.add eventTitleField

# 候補場所

candPlace = Titanium.UI.createLabel {
	text:'候補場所',
	top:0,
	left:N_LFT,
	width:N_WDT,
	height:'auto'
}
candPlaceButton = createGrayButton {
  id:10,
	title:'候補場所',
	height:N_HGT,
	top:0,
	left:N_LFT,
	width:N_WDT
}
candPlaceButton.addEventListener 'click', (e) =>
  rows = [
    {title:'apple',  hasChild:true, url:'http://www.apple.co.jp', value:10},
    {title:'amazon', hasChild:true, url:'http://www.amazon.co.jp', value:11},
    {title:'google', hasChild:true, url:'http://www.google.co.jp', value:12}
    ]
  createSelectableTable rows, tab, candPlace.title, (e) ->
    Ti.API.log "selected candPlace : " + JSON.stringify e
    candPlaceButton.title = e["row"]["title"]

    

candPlaceAddButton = createYelButton {
  title:'+',
  top:0,
  left:0,
  width:N_LFT,
  height:N_HGT
}
candPlaceAddButton.addEventListener 'click', (e) =>
  view = Ti.UI.createView {
    top:0,
    height:'auto',
    width:contentView.width,
    layout:'horizontal'
  }
  button = createGrayButton {
    title:'候補場所',
    height:N_HGT,
    top:0,
    left:N_LFT,
    width:N_WDT
  }
  view.add button
  insertView contentView, candPlaceView, view

candPlaceView = Ti.UI.createView {
  top:0,
	height:'auto',
	width:contentView.width,
	layout:'horizontal'
}
contentView.add candPlace
candPlaceView.add candPlaceButton
candPlaceView.add candPlaceAddButton
contentView.add candPlaceView

#候補日付
candDate = Titanium.UI.createLabel {
	text:'候補日付',
	top:0,
	left:N_LFT,
	width:N_WDT,
	height:'auto'
}
contentView.add candDate
candDateButton = createGrayButton {
	title:'候補日付',
	height:N_HGT,
	top:0,
	left:N_LFT,
	width:N_WDT
}
candDateButton.addEventListener 'click', (e) => 
  #DatePickerを表示
  rows = [
    {title:'apple',  hasChild:true, url:'http://www.apple.co.jp', value:10},
    {title:'amazon', hasChild:true, url:'http://www.amazon.co.jp', value:11},
    {title:'google', hasChild:true, url:'http://www.google.co.jp', value:12}
    ]
  createDatePicker rows, tab, candDate.title, (e) ->
    Ti.API.log "selected candDate : " + JSON.stringify e
    candDateButton.title = e["row"]["title"]

candDateAddButton = Ti.UI.createButton {
  title:'+',
  top:0,
  left:0,
  width:N_LFT,
  height:N_HGT
}
candDateAddButton.addEventListener 'click', (e) =>
  view = Ti.UI.createView {
    top:0,
    height:'auto',
    width:contentView.width,
    layout:'horizontal'
  }
  button = createGrayButton {
    title:'候補日付',
    height:N_HGT,
    top:0,
    left:N_LFT,
    width:N_WDT
  }
  view.add button
  insertView contentView, candDateView, view

candDateView = Ti.UI.createView {
  top:0,
	height:'auto',
	width:contentView.width,
	layout:'horizontal'
}
candDateView.add candDateButton
candDateView.add candDateAddButton
contentView.add candDateView

#想定予算額
assumedBudget = Titanium.UI.createLabel {
	text:'想定予算額',
	top:0,
	left:N_LFT,
	width:'auto',
	height:'auto'
}
assumedBudgetField = Titanium.UI.createTextField {
	hintText:'想定予算を入力してください',
	height:N_HGT,
	top:0,
	left:N_LFT,
	width:N_WDT,
	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED,
  #validation:{reqd:true}
}
assumedBudgetField.addEventListener('change', (e) ->
  val.validate(); 
  createEventButton.enabled = (val.errors[e.source.hintText]) ? false : true
)
assumedBudgetFieldAddButton = Ti.UI.createButton {
  title:'+',
  top:0,
  left:0,
  width:N_LFT,
  height:N_HGT
}
assumedBudgetFieldAddButton.addEventListener 'click', (e) =>
  view = Ti.UI.createView {
    top:0,
    height:'auto',
    width:contentView.width,
    layout:'horizontal'
  }
  button = createGrayButton {
    title:'想定予算を入力してください',
    height:N_HGT,
    top:0,
    left:N_LFT,
    width:N_WDT
  }
  view.add button
  insertView contentView, assumedBudgetView, view

assumedBudgetView = Ti.UI.createView {
  top:0,
	height:'auto',
	width:contentView.width,
	layout:'horizontal'
}
contentView.add assumedBudget
contentView.add assumedBudgetView
assumedBudgetView.add assumedBudgetField
assumedBudgetView.add assumedBudgetFieldAddButton


#候補ジャンル
candGenre = Titanium.UI.createLabel {
	text:'候補ジャンル',
	top:0,
	left:N_LFT,
	width:N_WDT,
	height:'auto'
}
candGenreButton = createGrayButton {
	title:'候補ジャンル',
	top:0,
	height:N_HGT,
	left:N_LFT,
	width:N_WDT
}
genre_rows = []
candGenreButton.addEventListener 'click', (e) => 
  #セレクタを表示
  genre_rows = [
    {title:'apple',  hasChild:true, url:'http://www.apple.co.jp', value:10},
    {title:'amazon', hasChild:true, url:'http://www.amazon.co.jp', value:11},
    {title:'google', hasChild:true, url:'http://www.google.co.jp', value:12}
    ]
  createSelectableTable genre_rows, tab, candGenre.title, (e) ->
    Ti.API.log "selected candGenre : " + JSON.stringify e
    candGenreButton.title = e["row"]["title"]


candGenreAddButton = Ti.UI.createButton {
  title:'+',
  top:0,
  left:0,
  width:N_LFT,
  height:N_HGT
}
candGenreAddButton.addEventListener 'click', (e) =>
  view = Ti.UI.createView {
    top:0,
    height:'auto',
    width:contentView.width,
    layout:'horizontal'
  }
  button = createGrayButton {
    title:'候補ジャンル',
    height:N_HGT,
    top:0,
    left:N_LFT,
    width:N_WDT
  }
  view.add button
  insertView contentView, candGenreView, view

candGenreView = Ti.UI.createView {
  top:0,
	height:'auto',
	width:contentView.width,
	layout:'horizontal'
}
contentView.add candGenre
contentView.add candGenreView
candGenreView.add candGenreButton
candGenreView.add candGenreAddButton

#候補の店
candShop = Titanium.UI.createLabel {
	text:'候補の店',
	top:0,
	left:N_LFT,
	width:'auto',
	height:'auto'
}
candShopField = Titanium.UI.createTextField {
	hintText:'店名を入力してください',
	height:N_HGT,
	top:0,
	left:N_LFT,
	width:N_WDT,
	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED,
  #validation:{reqd:true}
}
candShopField.addEventListener('change', (e) ->
  val.validate(); 
  createEventButton.enabled = (val.errors[e.source.hintText]) ? false : true
)
candShopAddButton = Ti.UI.createButton {
  title:'+',
  top:0,
  left:0,
  width:N_LFT,
  height:N_HGT
}
candShopAddButton.addEventListener 'click', (e) =>
  view = Ti.UI.createView {
    top:0,
    height:'auto',
    width:contentView.width,
    layout:'horizontal'
  }
  button = createGrayButton {
    title:'候補ジャンル',
    height:N_HGT,
    top:0,
    left:N_LFT,
    width:N_WDT
  }
  view.add button
  insertView contentView, candShopView, view

candShopView = Ti.UI.createView {
  top:0,
	height:'auto',
	width:contentView.width,
	layout:'horizontal'
}
contentView.add candShop
contentView.add candShopView
candShopView.add candShopField
candShopView.add candShopAddButton

#友人を誘うボタン
inviteFriendsButton = createGrayButton {
	title:'友人を誘う',
	top:0,
	height:N_HGT,
	left:N_LFT,
	width:N_WDT
}
inviteFriendsButton.addEventListener 'click', (e) =>
  createFriendPicker tab, inviteFriendsButton.title, (e) ->
    Ti.API.log "selected selectedFriend : " + JSON.stringify e
    candGenreButton.title = e["row"]["title"]

  target = Ti.UI.createWindow {
    titleid : '誘う人',
    url : '../sub_windows/invite_friends.js'
  }
  tab.open target

maxMemberLabbel = Titanium.UI.createLabel {
	text:'最大人数',
	top:0,
	left:N_LFT,
	width:'auto',
	height:'auto'
}
maxMemberField = Titanium.UI.createTextField {
	hintText:'最大人数を入力して下さい',
	height:N_HGT,
	top:0,
	left:N_LFT,
	width:N_WDT,
	borderStyle:Titanium.UI.INPUT_BORDERSTYLE_ROUNDED,
}
maxMemberField.addEventListener('change', (e) ->
  val.validate
  createEventButton.enabled = (val.errors[e.source.hintText]) ? false : true
)
contentView.add maxMemberField


createEventButton = createGreenButton {
	title:'作成',
	top:0,
	height:N_HGT,
	left:N_LFT,
	width:N_WDT
}
createEventButton.addEventListener 'click', (e) =>
  api.createEvent data, (res) ->
    tab.open target
createEventButton.enabled = false 
contentView.add inviteFriendsButton
contentView.add createEventButton

win.add scrollView

rules = [
  {"obj" : eventTitleField, "validators" : [{"name" : "reqd", "value" : "true" }]},
  {"obj" : assumedBudgetField, "validators" : [{"name" : "reqd", "value" : "true" }]},
  {"obj" : candShopField, "validators" : [{"name" : "reqd", "value" : "true" }]},
  {"obj" : maxMemberField, "validators" : [{"name" : "reqd", "value" : "true" }]}
]
val = new Validation(rules)

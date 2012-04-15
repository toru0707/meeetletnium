win = Ti.UI.currentWindow
tab = Ti.UI.currentTab

#navbarButton = Titanium.UI.createButtonBar {
#	labels:["設定"],
#	backgroundColor:'#336699'
#}
#
#win.setRightNavButton(navbarButton)
#
#navbarButton.addEventListener 'click', (e) =>
#  dialog.show()
#
#
#dialog = Titanium.UI.createOptionDialog {
#  options:['ログイン設定'],
#  destructive:1,
#  cancel:2,
#  title:'ユーザ設定'
#} 
#
#dialog.addEventListener 'click', (e) =>
#  win = Ti.UI.createWindow {
#    titleid : "設定",
#    url : '../main_windows/others.js'
#  }
#  tab.open win

adjustedButton = Ti.UI.createButton {
  title: '調整有り',
  height: 35,
  top: 100,
  left: 30,
  width: 250
}
adjustedButton.addEventListener 'click', (e)  =>
  # target = new Window '調整有りイベント', '../sub_windows/create_adjusted.js'
  target = Ti.UI.createWindow {
    titleid : '調整有りイベント', 
    url : '../sub_windows/create_adjusted.js'
    #titleid : '誘う人',
    #url : '../sub_windows/invite_friends.js'
 
  }
  tab.open target

noAdjustedButton = Ti.UI.createButton {
  title: '調整無し',
  height: 35,
  top: 150,
  left: 30,
  width: 250
}
noAdjustedButton.addEventListener 'click', (e) => 
  # target = new Window '調整無しイベント', '../sub_windows/create_no_adjusted.js'
  target = Ti.UI.createWindow {
    titleid : '調整無しイベント', 
    url : '../sub_windows/create_no_adjusted.js'
  }
  tab.open target

win.add adjustedButton
win.add noAdjustedButton

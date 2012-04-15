var adjustedButton, noAdjustedButton, tab, win,
  _this = this;

win = Ti.UI.currentWindow;

tab = Ti.UI.currentTab;

adjustedButton = Ti.UI.createButton({
  title: '調整有り',
  height: 35,
  top: 100,
  left: 30,
  width: 250
});

adjustedButton.addEventListener('click', function(e) {
  var target;
  target = Ti.UI.createWindow({
    titleid: '調整有りイベント',
    url: '../sub_windows/create_adjusted.js'
  });
  return tab.open(target);
});

noAdjustedButton = Ti.UI.createButton({
  title: '調整無し',
  height: 35,
  top: 150,
  left: 30,
  width: 250
});

noAdjustedButton.addEventListener('click', function(e) {
  var target;
  target = Ti.UI.createWindow({
    titleid: '調整無しイベント',
    url: '../sub_windows/create_no_adjusted.js'
  });
  return tab.open(target);
});

win.add(adjustedButton);

win.add(noAdjustedButton);

var forceButton, label, tab, updateLoginStatus, win;

win = Ti.UI.currentWindow;

tab = Ti.UI.currentTab;

Ti.Facebook.appid = "150258521734656";

Ti.Facebook.permissions = ['publish_stream', 'read_stream'];

label = Ti.UI.createLabel({
  text: 'Logged In = ' + Ti.Facebook.loggedIn,
  font: {
    fontSize: 14
  },
  height: 'auto',
  top: 10,
  textAlign: 'center'
});

win.add(label);

forceButton = Ti.UI.createButton({
  title: 'Force dialog: ' + Ti.Facebook.forceDialogAuth,
  top: 50,
  width: 160,
  height: 40
});

forceButton.addEventListener('click', function() {
  Ti.Facebook.forceDialogAuth = !Ti.Facebook.forceDialogAuth;
  return forceButton.title = "Force dialog: " + Ti.Facebook.forceDialogAuth;
});

win.add(forceButton);

updateLoginStatus = function() {
  return label.text = 'Logged In = ' + Ti.Facebook.loggedIn;
};

Ti.Facebook.addEventListener('login', updateLoginStatus);

Ti.Facebook.addEventListener('logout', updateLoginStatus);

if (Ti.Platform.name === 'iPhone OS') {
  win.add(Ti.Facebook.createLoginButton({
    style: Ti.Facebook.BUTTON_STYLE_WIDE,
    bottom: 30
  }));
} else {
  win.add(Ti.Facebook.createLoginButton({
    style: 'wide',
    bottom: 30
  }));
}

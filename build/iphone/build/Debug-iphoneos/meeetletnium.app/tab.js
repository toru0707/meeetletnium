var Tab;

Tab = (function() {

  function Tab(tabTitle, winTitle, icon, url) {
    this.tabTitle = tabTitle;
    this.winTitle = winTitle;
    this.icon = icon;
    this.url = url;
    this.window = new Window(this.winTitle, this.url);
    this.tab = Titanium.UI.createTab({
      icon: this.icon,
      titleid: this.tabTitle,
      window: this.window
    });
    this.createContents();
  }

  Tab.prototype.createContents = function() {
    var label;
    label = Titanium.UI.createLabel({
      color: '#999',
      text: 'I am Window on ' + this.winTitle,
      font: {
        fontSize: 20,
        fontFamily: 'Helvetica Neue'
      },
      textAlign: 'center',
      width: 'auto'
    });
    label.addEventListener('click', function() {
      alert('OK');
      return log('OK');
    });
    return this.window.add(label);
  };

  return Tab;

})();

var Tab, TabGroup, Window, tab1, tab2, tab3, tab4, tab5, tabGroup,
  _this = this;

TabGroup = (function() {

  function TabGroup() {
    this.tabGroup = Titanium.UI.createTabGroup();
    return this.tabGroup;
  }

  return TabGroup;

})();

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
  }

  return Tab;

})();

Window = (function() {

  function Window(title, url) {
    this.title = title;
    this.url = url;
    return Titanium.UI.createWindow({
      titleid: this.title,
      url: this.url,
      backgroundColor: '#fff'
    });
  }

  return Window;

})();

Titanium.UI.setBackgroundColor('#000');

tabGroup = new TabGroup();

tab1 = new Tab('adjusted_tab_title', 'adjusted_win_title', '', 'main_windows/adjusted_events.js');

tabGroup.addTab(tab1.tab);

tab2 = new Tab('adjusting_tab_title', 'adjusting_win_title', '', 'main_windows/adjusting_events.js');

tabGroup.addTab(tab2.tab);

tab3 = new Tab('public_tab_title', 'public_win_title', '', 'main_windows/public_events.js');

tabGroup.addTab(tab3.tab);

tab4 = new Tab('create_tab_title', 'create_win_title', '', 'main_windows/create_event.js');

tabGroup.addTab(tab4.tab);

tab5 = new Tab('settings_tab_title', 'settings_win_title', '', 'main_windows/settings.js');

tabGroup.addTab(tab5.tab);

tabGroup.addEventListener('open', function(e) {
  return Titanium.UI.setBackgroundColor('#fff');
});

tabGroup.setActiveTab(0);

tabGroup.open({
  transition: Titanium.UI.iPhone.AnimationStyle.FLIP_FROM_LEFT
});

tabGroup.open;

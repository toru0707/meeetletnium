var Window;

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

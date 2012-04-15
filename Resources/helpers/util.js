var createDarkButton, createDatePicker, createFriendPicker, createGrayButton, createGreenButton, createSelectableTable, createYelButton, insertView;

createGreenButton = function(p) {
  var button;
  button = Ti.UI.createButton(p);
  button.backgroundImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_grn_off.png";
  button.backgroundSelectedImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_grn_on.png";
  button.backgroundDisabledImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png";
  return button;
};

createGrayButton = function(p) {
  var button;
  button = Ti.UI.createButton(p);
  button.backgroundImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_gry_off.png";
  button.backgroundSelectedImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_gry_on.png";
  button.backgroundDisabledImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png";
  return button;
};

createDarkButton = function(p) {
  var button;
  button = Ti.UI.createButton(p);
  button.backgroundImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png";
  button.backgroundSelectedImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_on.png";
  button.backgroundDisabledImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png";
  return button;
};

createYelButton = function(p) {
  var button;
  button = Ti.UI.createButton(p);
  button.backgroundImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_yel_off.png";
  button.backgroundSelectedImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_yel_on.png";
  button.backgroundDisabledImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png";
  return button;
};

insertView = function(parent, next, view) {
  var children, isFound, item, removed, _i, _j, _len, _len2, _results;
  children = parent.children;
  removed = [];
  isFound = false;
  for (_i = 0, _len = children.length; _i < _len; _i++) {
    item = children[_i];
    if (isFound) {
      parent.remove(item);
      removed.push(item);
    }
    if (item === next) isFound = true;
  }
  if (!isFound) {
    Ti.API.log("Next to inserted view : " + (JSON.stringify(next)) + " is not found.");
  }
  parent.add(view);
  _results = [];
  for (_j = 0, _len2 = removed.length; _j < _len2; _j++) {
    item = removed[_j];
    _results.push(parent.add(item));
  }
  return _results;
};

createSelectableTable = function(rows, root, title, callback) {
  var view, win,
    _this = this;
  view = Ti.UI.createTableView({
    data: rows
  });
  win = Ti.UI.createWindow({
    title: title
  });
  win.add(view);
  root.open(win);
  return view.addEventListener('click', function(e) {
    callback(e);
    return root.close(win);
  });
};

createDatePicker = function(rows, root, title, callback) {
  var view, win,
    _this = this;
  view = Ti.UI.createTableView({
    data: rows
  });
  win = Ti.UI.createWindow({
    title: title
  });
  win.add(view);
  root.open(win);
  return view.addEventListener('click', function(e) {
    callback(e);
    return root.close(win);
  });
};

createFriendPicker = function(root, title, callback) {
  var view, win,
    _this = this;
  view = Ti.UI.createTableView({
    data: rows
  });
  win = Ti.UI.createWindow({
    title: title
  });
  win.add(view);
  root.open(win);
  return view.addEventListener('click', function(e) {
    callback(e);
    return root.close(win);
  });
};

createGreenButton = (p) ->
  button = Ti.UI.createButton p
  button.backgroundImage =Ti.Filesystem.resourcesDirectory + "/images/BUTT_grn_off.png"
  button.backgroundSelectedImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_grn_on.png"
  button.backgroundDisabledImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png"
  return button

createGrayButton = (p) ->
  button = Ti.UI.createButton p
  button.backgroundImage =Ti.Filesystem.resourcesDirectory + "/images/BUTT_gry_off.png"
  button.backgroundSelectedImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_gry_on.png"
  button.backgroundDisabledImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png"
  return button

createDarkButton = (p) ->
  button = Ti.UI.createButton p
  button.backgroundImage =Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png"
  button.backgroundSelectedImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_on.png"
  button.backgroundDisabledImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png"
  return button

createYelButton = (p) ->
  button = Ti.UI.createButton p
  button.backgroundImage =Ti.Filesystem.resourcesDirectory + "/images/BUTT_yel_off.png"
  button.backgroundSelectedImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_yel_on.png"
  button.backgroundDisabledImage = Ti.Filesystem.resourcesDirectory + "/images/BUTT_drk_off.png"
  return button


insertView = (parent, next, view) ->
  children = parent.children
  removed = []
  isFound = false
  for item in children
    if isFound
      parent.remove item
      removed.push item
    if item == next
      isFound = true
  if !isFound
    Ti.API.log "Next to inserted view : " + (JSON.stringify next) + " is not found."
  parent.add view 
  for item in removed
    parent.add item


createSelectableTable = (rows, root, title, callback) ->
  view = Ti.UI.createTableView {
    data : rows
  }
  win = Ti.UI.createWindow {
    title : title
  }
  win.add view
  root.open win
  
  view.addEventListener 'click', (e) =>
    callback e
    root.close win

createDatePicker = (rows, root, title, callback) ->
  view = Ti.UI.createTableView {
    data : rows
  }
  win = Ti.UI.createWindow {
    title : title
  }
  win.add view
  root.open win
  
  view.addEventListener 'click', (e) =>
    callback e
    root.close win

createFriendPicker = (root, title, callback) ->
  view = Ti.UI.createTableView {
    data : rows
  }
  win = Ti.UI.createWindow {
    title : title
  }
  win.add view
  root.open win
  
  view.addEventListener 'click', (e) =>
    callback e
    root.close win



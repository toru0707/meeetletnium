win = T.UI.currentWindow

P = (densityPixels) ->
  return densityPixels*Ti.Platform.displayCaps.dpi/160

 
iconNums = 1
newIcon = (color) ->
    v = Ti.UI.createView {
        width:P(95),
        height:P(95),
        backgroundColor: "#d85a1a"
    }
    v.add Ti.UI.createLabel {
        text: iconNums++
    }
    return v
 
dataR = []
for i in [0 .. 24]
  dataR.push newIcon()
 
 
createScrollableGridView = (params) ->
  _p = (densityPixels) -> 
      return densityPixels*Ti.Platform.displayCaps.dpi/160

  view = Ti.UI.createScrollView {
      scrollType: "vertical",
      cellWidth: params.cellWidth,
      cellHeight: params.cellHeight,
      xSpacer: params.cellWidth,
      ySpacer: params.cellHeight,
      xGrid: params.xGrid,
      data: params.data
  }

  objSetIndex = 0
  yGrid = view.data.length/view.xGrid

  for y in [0 .. yGrid]
    row = Ti.UI.createView {
        layout: "horizontal",
        focusable: false,
        top: y*(view.cellHeight+(2*view.ySpacer)),
        height: view.cellHeight+(2*view.ySpacer)
    }

    for x in [0 .. view.xGrid]
      if view.data[objSetIndex]
        thisView = Ti.UI.createView {
            left: view.ySpacer,
            height: view.cellHeight,
            width: view.cellWidth
        }
        thisView.add view.data[objSetIndex]
        row.add thisView
        objSetIndex++
       
    view.add row
  return view
 
win = Ti.UI.createWindow {
    backgroundColor:"black",
    navBarHidden:false,
    title:"Main Window"
}
win.add createScrollableGridView {
    data: dataR,
    cellWidth: 100,
    cellHeight: 100,
    xSpacer: 5,
    ySpacer: 5, 
    xGrid: 3 
}
 

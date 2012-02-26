var P, createScrollableGridView, dataR, i, iconNums, newIcon, win;

win = T.UI.currentWindow;

P = function(densityPixels) {
  return densityPixels * Ti.Platform.displayCaps.dpi / 160;
};

iconNums = 1;

newIcon = function(color) {
  var v;
  v = Ti.UI.createView({
    width: P(95),
    height: P(95),
    backgroundColor: "#d85a1a"
  });
  v.add(Ti.UI.createLabel({
    text: iconNums++
  }));
  return v;
};

dataR = [];

for (i = 0; i <= 24; i++) {
  dataR.push(newIcon());
}

createScrollableGridView = function(params) {
  var objSetIndex, row, thisView, view, x, y, yGrid, _p, _ref;
  _p = function(densityPixels) {
    return densityPixels * Ti.Platform.displayCaps.dpi / 160;
  };
  view = Ti.UI.createScrollView({
    scrollType: "vertical",
    cellWidth: params.cellWidth,
    cellHeight: params.cellHeight,
    xSpacer: params.cellWidth,
    ySpacer: params.cellHeight,
    xGrid: params.xGrid,
    data: params.data
  });
  objSetIndex = 0;
  yGrid = view.data.length / view.xGrid;
  for (y = 0; 0 <= yGrid ? y <= yGrid : y >= yGrid; 0 <= yGrid ? y++ : y--) {
    row = Ti.UI.createView({
      layout: "horizontal",
      focusable: false,
      top: y * (view.cellHeight + (2 * view.ySpacer)),
      height: view.cellHeight + (2 * view.ySpacer)
    });
    for (x = 0, _ref = view.xGrid; 0 <= _ref ? x <= _ref : x >= _ref; 0 <= _ref ? x++ : x--) {
      if (view.data[objSetIndex]) {
        thisView = Ti.UI.createView({
          left: view.ySpacer,
          height: view.cellHeight,
          width: view.cellWidth
        });
        thisView.add(view.data[objSetIndex]);
        row.add(thisView);
        objSetIndex++;
      }
    }
    view.add(row);
  }
  return view;
};

win = Ti.UI.createWindow({
  backgroundColor: "black",
  navBarHidden: false,
  title: "Main Window"
});

win.add(createScrollableGridView({
  data: dataR,
  cellWidth: 100,
  cellHeight: 100,
  xSpacer: 5,
  ySpacer: 5,
  xGrid: 3
}));

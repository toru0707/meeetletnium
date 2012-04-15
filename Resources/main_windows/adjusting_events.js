var currentRow, currentRowIndex, data, dateLabel, i, noteLabel, row, search, tab, tableView, titleLabel, win,
  _this = this;

Ti.include(Ti.Filesystem.resourcesDirectory + "/helpers/constants.js");

Ti.include(Ti.Filesystem.resourcesDirectory + "/helpers/api.js");

win = Titanium.UI.currentWindow;

tab = Ti.UI.currentTab;

search = Titanium.UI.createSearchBar({
  barColor: '#385292',
  showCancel: false
});

search.addEventListener('change', function(e) {
  return e.value;
});

search.addEventListener('return', function(e) {
  return search.blur;
});

search.addEventListener('cancel', function(e) {
  return search.blur;
});

win.open(function() {});

win.addEventListener('open', function(e) {
  return Ti.API.log("win is opend!.");
});

data = [];

currentRow = null;

currentRowIndex = null;

for (i = 1; i <= 10; i++) {
  row = Ti.UI.createTableViewRow();
  row.selectedBackgroundColor = '#fff';
  row.height = 60;
  row.className = 'datarow';
  row.clickName = 'row';
  titleLabel = Ti.UI.createLabel({
    color: '#576996',
    font: {
      fontSize: 16,
      fontWeight: 'bold',
      fontFamily: 'Arial'
    },
    left: 20,
    top: 2,
    height: 30,
    width: 200,
    clickName: 'test',
    text: '豊州ITランチ' + i
  });
  noteLabel = Ti.UI.createLabel({
    color: '#222',
    font: {
      fontSize: 14,
      fontWeight: 'normal',
      fontFamily: 'Arial'
    },
    left: 20,
    top: 21,
    height: 50,
    width: 200,
    clickName: 'test',
    text: '参加者募集中'
  });
  dateLabel = Ti.UI.createLabel({
    color: '#576996',
    font: {
      fontSize: 30,
      fontWeight: 'bold',
      fontFamily: 'Arial'
    },
    left: 150,
    top: 2,
    height: 30,
    width: 200,
    clickName: 'test',
    text: '12/1 12:00'
  });
  row.filter = titleLabel.text;
  row.add(titleLabel);
  row.add(noteLabel);
  row.add(dateLabel);
  data.push(row);
}

tableView = Titanium.UI.createTableView({
  data: data,
  search: search,
  filterAttribute: 'filter',
  backgroundColor: 'white'
});

tableView.addEventListener('click', function(e) {
  var rowNum;
  Ti.API.info('table view row clicked - source ' + e.source);
  rowNum = e.index;
  win = Ti.UI.createWindow({
    url: '../sub_windows/detail_adjusting_event.js',
    title: 'イベント詳細'
  });
  return tab.open(win);
});

win.add(tableView);

Ti.include(Ti.Filesystem.resourcesDirectory + "/helpers/constants.js")

win = Titanium.UI.currentWindow
tab = Ti.UI.currentTab

events = []
win.addEventListener 'open', (e) ->
  Ti.API.log "win is opend"

search = Titanium.UI.createSearchBar {
	barColor:'#385292',
	showCancel:false
}
search.addEventListener 'change', (e) => 
	e.value
search.addEventListener 'return', (e) =>
	search.blur
search.addEventListener 'cancel', (e) =>
	search.blur 


data = []

# create a var to track the active row
currentRow = null
currentRowIndex = null

# create the rest of the rows
for i in [1..10]
  row = Ti.UI.createTableViewRow()
  row.selectedBackgroundColor = '#fff'
  row.height = 60
  row.className = 'datarow'
  row.clickName = 'row'
   
  titleLabel = Ti.UI.createLabel {
    color:'#576996',
    font:{fontSize:16,fontWeight:'bold', fontFamily:'Arial'},
    left:20,
    top:2,
    height:30,
    width:200,
    clickName:'test',
    text:'新人懇親ランチ' + i
  }

  noteLabel =  Ti.UI.createLabel {
    color:'#222',
    font:{fontSize:14,fontWeight:'normal', fontFamily:'Arial'},
    left:20,
    top:21,
    height:50,
    width:200,
    clickName:'test',
    text:'締め切り間近'
  }


  dateLabel =  Ti.UI.createLabel {
    color:'#576996',
    font:{fontSize:30,fontWeight:'bold', fontFamily:'Arial'},
    left:150,
    top:2,
    height:30,
    width:200,
    clickName:'test',
    text:'12/1 12:00'
  }

  row.filter = titleLabel.text
  row.add titleLabel
  row.add noteLabel
  row.add dateLabel

  data.push row


#
# create table view  
#
tableView = Titanium.UI.createTableView {
	data:data,
	search:search,
	filterAttribute:'filter',
	backgroundColor:'white'
}

tableView.addEventListener 'click', (e) =>
  Ti.API.info 'table view row clicked - source ' + e.source
  rowNum = e.index
  win = Ti.UI.createWindow {
    url : '../sub_windows/detail_adjusted_event.js',
    title : 'イベント詳細'
  }
  tab.open win
  

win.add tableView


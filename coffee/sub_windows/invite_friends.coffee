win = Ti.UI.currentWindow

# to fit in a 320-wide space 
cellWidth = 92
cellHeight = 92
xSpacer = 10
ySpacer = 10
xGrid = 2 
yGrid = 12
 
tableData = []
 
colorSet = [
                "#D44646",
                "#46D463",
                "#46D4BE",
                "#C2D446",
                "#D446D5",
                "#4575D5",
                "#E39127",
                "#879181",
                "#E291D4"
              ]
 
colorSetIndex = 0
cellIndex = 0
 
for y in [0 .. yGrid]
    thisRow = Ti.UI.createTableViewRow {
        className: "grid",
        layout: "horizontal",
        height: cellHeight+ 2*ySpacer
    }
    for  x in [0 .. xGrid] 
        thisView = Ti.UI.createView {
            objName:"grid-view",
            objIndex:cellIndex.toString ,
            backgroundColor: colorSet[colorSetIndex],
            left: ySpacer,
            height: cellHeight,
            width: cellWidth
        }
 
        thisLabel = Ti.UI.createLabel {
            color:"white",
            font:{fontSize:48,fontWeight:'bold'},
            text:cellIndex ,
            touchEnabled:false
        }
        thisView.add thisLabel
        thisRow.add thisView
        cellIndex++
        colorSetIndex++
 
        if  colorSetIndex == colorSet.length 
            colorSetIndex = 0
    
    tableData.push thisRow

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

tableview = Ti.UI.createTableView {
    data:tableData,
    search:search,
    filterAttribute:'filter',
    searchHidden:true
}
 
tableview.addEventListener "click",  (e) =>

win.add tableview
 
win.open 

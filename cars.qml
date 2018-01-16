import QtQuick 2.3

Item {
	id: container
	width: 1200
	height: 500

	Component.onCompleted: createCars()


function createCars() {
	console.log("createCars")

	var cars = [
	{ 'name': "golf V",
  	  'w': 176,
			'h': 425,
	  'color': "green"
	},
	{ 'name': "meriva b",
	  'w': 181,
       	  'h': 429,
	  'color': "blue"
	},
	{ 'name': "classe b",
	  'w': 178,
       	  'h': 427,
	  'color': "grey"
	},
	{ 'name': "spacestar",
	  'w': 172,
       	  'h': 405,
	  'color': "cyan"
	},
	{ 'name': "verso-s",
	  'w': 170,
       	  'h': 399,
	  'color': "blue"
	},
	{ 'name': "c4 picasso",
			'w': 212,
      'h': 444,
			'color': "blue"
	},
	{ 'name': "ix20",
			'w': 177,
      'h': 410,
			'color': "white"
	},
	{ 'name': "garage",
			'w': 274,
      'h': 600,
	  'color': "grey"
	}
	]

for (var i=0; i<cars.length; i++) {

	var height = cars[i]['h']
	var width = cars[i]['w']
	var x = (width + 70)*i
	x = 0
	var str =
	    ' import QtQuick 2.0; ' +
	    ' Rectangle { ' +
		    ' id: rect; ' +
		    ' color: "' + cars[i]['color'] + '"; ' +
		    ' x: ' + x + '; width: ' + width + '; height: ' + height + '; ' +
		    ' radius: 15; opacity: 0.5; ' +
		    ' Drag.active: mouseArea.drag.active; ' +
		    ' Text { anchors.centerIn : parent; text: "' + cars[i]['name'] + "\n"+ cars[i]['w'] + "x" + cars[i]['h'] + " " +'"} ' +
		    ' MouseArea { ' +
		    '    id: mouseArea; ' +
		    '    anchors.fill: parent; ' +
		    '    drag.target: parent; ' +
		    ' } '+
 	    ' } '
	var newObject = Qt.createQmlObject(str,
                                   container,
                                   "dynamicSnippet1");

	var component = Qt.createComponent(newObject)

    if (component.status == Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}
}
function finishCreation() {
	console.log("finishCreation")
for (var i=0; i<5; i++) {
            var object = component.createObject(container);
            object.x = (object.width + 20) * i;
        }
}


}

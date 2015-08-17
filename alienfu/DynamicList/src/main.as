// ActionScript fileimport 
import mx.collections.ArrayCollection;
import mx.controls.Label;
import mx.controls.Text;

// ActionScript file
[Bindable]
private var staff : ArrayCollection = new ArrayCollection();
private var json:String = '[{"name": "HI"},{"name": "HOW"},{"name": "are"},{"name": "you"}]';
public function setComboBoxProvider(jsonString : String) : void {
	// from JSON
	//["Kim","Mike","Eric"]       
	staff.source = ["Kim","Mike","Eric"];
}

public function addLabelChildren() :void {	
	var data:Object = JSON.parse(json);	
	for(var i:String in data) { 
		var a:Object = data[i];
		var new_label:Label = new Label();
		new_label.htmlText = "<h1>" + a.name + "</h1>";
		MyList.addElement(new_label);	
	}
}
public function addTextChildren() :void {	
	var data:Object = JSON.parse(json);	
	for(var i:String in data) { 
		var a:Object = data[i];
		var new_label:Text = new Text();
		new_label.htmlText = "<h3>" + a.name + "</h3>\nHello";
		MyList2.addElement(new_label);	
	}
}
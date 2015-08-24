import mx.collections.ArrayCollection;

[Bindable]
private var members:ArrayCollection = new ArrayCollection();

function loadMembers(): void {
	var ServiceURL: String = "http://adultfriendfinder.com/search_combined";
	var request:URLRequest = new URLRequest(ServiceURL);
	var loader:URLLoader = new URLLoader();
	loader.dataFormat = URLLoaderDataFormat.TEXT;
	request.method = URLRequestMethod.GET;
	
	//Define the REST API variables to be passed
	var variables:URLVariables = new URLVariables();
	
	// Need this to get search_combined to return something
	variables.m = " ";
		
	// assign the data to be sent by GET
	request.data = variables;
			
	// add event listener
	loader.addEventListener(Event.COMPLETE, createRows);
	loader.load(request);
}
	
function createRows(evt:Event):void {
	//Get the returned JSON data string
	var response:String = evt.target.data as String;
	var memberRes:Object = JSON.parse(response) as Object;
	var myComp:Object = new listCell();
	
	trace(response);
	
	memberRes.results.forEach(function(member) {
		members.addItem(member);
	});
}
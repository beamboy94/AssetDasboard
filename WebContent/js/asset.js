function go(url)
{
	window.location = url;
}

function Add_asset()
{
	window.location = "Add_asset1.do";
}

function deleteAsset(url)
{
	var isOK = confirm("Are you sure to delete?");
	if(isOK)
	{
		
		go(url);
	}
}

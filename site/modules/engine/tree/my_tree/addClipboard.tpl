	this.addClipboard= function(node) {
    
    var content ="123";
    
	if (window.clipboardData && window.clipboardData.setData) {
		window.clipboardData.setData("Text", content);
		return true;
	}
	else {
			try { 
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
			} 
			catch (e) { 
                alert('Clipboard access not permitted, sorry. You will have to set signed.applet.codebase_principal_support to true in about:config');
				return false;
			}
	
	            var Cc = Components.classes;
	            var Ci = Components.interfaces;
	
				var clip = Cc["@mozilla.org/widget/clipboard;1"].getService(Ci.nsIClipboard);
				var trans = Cc["@mozilla.org/widget/transferable;1"].createInstance(Ci.nsITransferable);
				try {
					trans.addDataFlavor("text/unicode");
					clip.getData(trans, clip.kGlobalClipboard);
					
					var str = {}, length = {};
					trans.getTransferData(
						"text/unicode",
						str,
						length
					);
					if (length.value) {
						str = str.value.QueryInterface(Ci.nsISupportsString);
                        
	                    //alert(Base64.encode(str.data));

						Ext.Ajax.request({
							scope: this,
							url: './?page=tree',
							method: 'POST',
							params: {
										table: 'tree',
										task: 'insertRows',
										node_id: node.id,
                                        data: Base64.encode(str.data)
								},
							success: 
								function(response,options) {
									var responseData = Ext.util.JSON.decode(response.responseText);
									Ext.MessageBox.alert('Сообщение',responseData);
								}
						});
/**/

						// str = str.data;
						// if (str.length &&
						// DTA_AddingFunctions.isLinkOpenable(str)) {
						// hash = DTA_getLinkPrintHash(str);
						// address.value = str.replace(/#.*$/, '');
						// address.select();
						// }
					}
				}
				catch (ex) {
					alert("Not able to gather data from the clipboard!");
				}
	
	
	
	
	// alert(this.dump(textObj,0));
	// alert(transferable.getAnyTransferData());
	
	
	
	
				return true;
			} 
		};

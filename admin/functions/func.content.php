<?php

function initTabContent($tab,$i) {
?>

		this.tabs[<?=$i?>] = new Ext.Panel({
			title: '<?=!empty($tab['title'])?$tab['title']:'...'?>',
			header: false,
			autoLoad: { url: '<?=$tab['url']?>', scope: this },
			border: false,
			closable: <?=!empty($tab['closable'])?$tab['closable']?'true':'false':'false'?>,
			bodyStyle: '<?=!empty($tab['bodystyle'])?$tab['bodystyle']:''?>'
		});

<?if(isset($tab['refresh']) AND $tab['refresh']):?>
		this.tabs[<?=$i?>].on('activate', function(p) { p.getUpdater().refresh(); }, this);
<?endif;?>

<?php
}

?>
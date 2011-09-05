tinyMCEPopup.requireLangPack();

var PictureDialog = {
	init : function() {},

	insert : function() {
	  alt = document.forms[0].alt.value;
	  url = document.forms[0].url.value;
	  css_class = document.forms[0].css_class.value;
	  img_html = '<img src="' + img_src + '" alt="' + alt + '" class="' + css_class + '" />';
	  if (url.length > 0) {
	    img_html = img_html.link(url)
	  }
		tinyMCEPopup.editor.execCommand('mceInsertContent', false, img_html);
		tinyMCEPopup.close();
	}
};

tinyMCEPopup.onInit.add(PictureDialog.init, PictureDialog);

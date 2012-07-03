// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
/*
	 通过className获得标签
     第一个参数CSS类名，第二个参数父对象，第三个参数标签名(eg "div"、"li"）
     其中第一个参数必选，第二个第三个参数可选
*/
document.getElementsByClassName=function(className,parentElement,tagName) {
	var children = ($(parentElement)||document.body).getElementsByTagName(tagName||'*');
	var elements = [],child;
	for (var i=0,length=children.length;i<length;i++) {
		child = children[i];
		if (hasClassName(child,className))
			elements.push(child);
	}
	return elements;
};
//判断对象element是否包含指定类className
function hasClassName(element,className) {
    if (!(element=$(element))) return false;
    var elementClassName=element.className;
    if (elementClassName.length == 0) return false;
    if (elementClassName==className||elementClassName.match(new RegExp("(^|\\s)"+className+"(\\s|$)")))
        return true;
    return false;
}

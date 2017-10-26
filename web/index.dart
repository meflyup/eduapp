import 'dart:html';
import 'dart:math' as math;

void main() {
  Element sample_container_div = querySelector('#sample_container_id');
  sample_container_div.onClick.listen(showElementStructure);
}

void showElementStructure(MouseEvent event) {
  Element eventTarget = event.target;
  Element myparent = eventTarget.parent;
  List<Element> myChildren = eventTarget.children;
  PreElement p=querySelector("#for_button_id");
  ButtonElement btn=new ButtonElement();
  btn.text="click me";
  p.children.add(btn);
  querySelector("#parent_nodeName_id").text = myparent.nodeName;
  querySelector("#firstChild_naodeName_id").text = myChildren[0].nodeName;
}

void addPElement(MouseEvent event){
  
}

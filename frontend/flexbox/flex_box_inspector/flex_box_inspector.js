let myButton = document.createElement('button');
myButton.innerText = 'NEXT';
myButton.style = "position: fixed; bottom: 20px; right: 20px; z-index: 10000; padding: 10px 20px; background-color: red; color: white; border: none; border-radius: 5px; cursor: pointer";
function getFlexContainers (nodes) {
  let flexContainers = [];
  for (let i = 0; i < nodes.length; i++) {
    if (window.getComputedStyle(nodes[i]).display === 'flex') flexContainers.push(nodes[i]);
  }
  return flexContainers;
}
const myFlexContainers = getFlexContainers(document.querySelectorAll('*'));
let currentFlexIndex = 0;
let currentFlexContainer = myFlexContainers[currentFlexIndex];
let containerStyle = "background-color: rgba(255, 0, 0, 0.1); outline: 3px solid red;";
currentFlexContainer.style.cssText += containerStyle;
currentFlexContainer.scrollIntoView({ behavior: 'smooth', block: 'center' });

function myFunctionNext() {
  if (myFlexContainers.length === 0) return;
  let maxFlexIndex = myFlexContainers.length - 1;
  if (currentFlexIndex < 0 || currentFlexIndex > maxFlexIndex) return;
  currentFlexContainer.style.backgroundColor = '';
  currentFlexContainer.style.outline = '';
  if (currentFlexIndex === maxFlexIndex) {
    currentFlexIndex = 0;
  } else {
    currentFlexIndex++;
  }    
  currentFlexContainer = myFlexContainers[currentFlexIndex];
  currentFlexContainer.style.cssText += containerStyle;
  currentFlexContainer.scrollIntoView({ behavior: 'smooth', block: 'center' });
}
myButton.onclick = myFunctionNext;
document.body.appendChild(myButton);
//------------------------------------------
myButton = document.createElement('button');
myButton.innerText = 'PREVIOUS';
myButton.style = "position: fixed; bottom: 20px; right: 115px; z-index: 10000; padding: 10px 20px; background-color: red; color: white; border: none; border-radius: 5px; cursor: pointer";
function myFunctionPrevious() {
  if (myFlexContainers.length === 0) return;
  let maxFlexIndex = myFlexContainers.length - 1;
  if (currentFlexIndex < 0 || currentFlexIndex > maxFlexIndex) return;
  currentFlexContainer.style.backgroundColor = '';
  currentFlexContainer.style.outline = '';
  if (currentFlexIndex === 0) {
    currentFlexIndex = maxFlexIndex;
  } else {
    currentFlexIndex--;
  }    
  currentFlexContainer = myFlexContainers[currentFlexIndex];
  currentFlexContainer.style.cssText += containerStyle;
  currentFlexContainer.scrollIntoView({ behavior: 'smooth', block: 'center' });
}
myButton.onclick = myFunctionPrevious;
document.body.appendChild(myButton);
//------------------------------------------
let flexContainerInfo;
function printFlexContainerInfo(){
  let style = window.getComputedStyle(currentFlexContainer);
  let flexInfo = {
    "display": style.display,
    "flex-direction": style.flexDirection,
    "justify-content": style.justifyContent,
    "align-items": style.alignItems,
    "flex-wrap": style.flexWrap,
    "gap": style.gap,
    "padding": style.padding,
    "margin": style.margin,
    "width (resolved)": style.width,
    "height (resolved)": style.height
  };
  console.table(flexInfo);
  flexContainerInfo = JSON.stringify(flexInfo);
}
let flexItemsInfo;
function printFlexItemsInfo() {
  let children = currentFlexContainer.children;
  let data = Array.from(currentFlexContainer.children).map((child, index) => {
    let style = window.getComputedStyle(child);
    return {
      flex: style.flex,
      padding: style.padding,
      border: style.border,
      boxSizing: style.boxSizing,
      margin: style.margin,
      minWidth: style.minWidth,
      width: child.computedStyleMap().get('width').toString(),
      maxWidth: style.maxWidth,
      height: child.computedStyleMap().get('height').toString(),
      position: style.position
    }
  });
  console.table(data);
  flexItemsInfo = JSON.stringify(data);
}
function printIAInfo() {
  return currentFlexContainer.outerHTML + ' ' + flexContainerInfo + ' ' + flexItemsInfo;
}
//-----------------------------------------
function getFlexBaseSize(element) {
  if (window.getComputedStyle(element).flexBasis != 'auto') return null;
  let previousStyleValue = element.style.cssText;
  element.style.flex = '0 0 auto';
  element.style.width = 'max-content';
  element.style.minWidth = '0';
  element.style.maxWidth = 'none';
  element.style.whiteSpace = 'nowrap';
  let width = element.getBoundingClientRect().width;
  element.style.cssText = previousStyleValue;
  let style = window.getComputedStyle(element);
  if (style.boxSizing == 'border-box') {
    return width;
  } else if (style.boxSizing == 'content-box') {
    return width -
      parseFloat(style.borderLeftWidth) -
      parseFloat(style.borderRightWidth) -
      parseFloat(style.paddingLeftWidth) -
      parseFloat(style.paddingRightWidth);
  }
}
//-----------------------------------------
console.clear();
printFlexContainerInfo();
printFlexItemsInfo();
currentFlexContainer;
//-------------------------------------
{
  // to calculate the parent's inner width
  let style = window.getComputedStyle($0.parentElement);
  $0.parentElement.getBoundingClientRect().width - parseFloat(style.borderLeftWidth) - parseFloat(style.borderRightWidth);
}
// ia's prompt: Calculate base size of flex item 1 telling me what manual calculations I need to do and what information I need to consult in the browser.
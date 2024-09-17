// import*as t from"@hotwired/turbo";import{connectStreamSource as e,disconnectStreamSource as n}from"@hotwired/turbo";export{t as Turbo};import{s}from"../../../_/CbGBsmqA.js";
// export{c as cable}from"../../../_/CbGBsmqA.js";
// function walk(t){return t&&typeof t==="object"?t instanceof Date||t instanceof RegExp?t:Array.isArray(t)?t.map(walk):Object.keys(t).reduce((function(e,n){var s=n[0].toLowerCase()+n.slice(1).replace(/([A-Z]+)/g,(function(t,e){return"_"+e.toLowerCase()}));e[s]=walk(t[n]);return e}),{}):t}class TurboCableStreamSourceElement extends HTMLElement{async connectedCallback(){e(this);this.subscription=await s(this.channel,{received:this.dispatchMessageEvent.bind(this),connected:this.subscriptionConnected.bind(this),disconnected:this.subscriptionDisconnected.bind(this)})}disconnectedCallback(){n(this);this.subscription&&this.subscription.unsubscribe()}dispatchMessageEvent(t){const e=new MessageEvent("message",{data:t});return this.dispatchEvent(e)}subscriptionConnected(){this.setAttribute("connected","")}subscriptionDisconnected(){this.removeAttribute("connected")}get channel(){const t=this.getAttribute("channel");const e=this.getAttribute("signed-stream-name");return{channel:t,signed_stream_name:e,...walk({...this.dataset})}}}customElements.get("turbo-cable-stream-source")===void 0&&customElements.define("turbo-cable-stream-source",TurboCableStreamSourceElement);function encodeMethodIntoRequestBody(t){if(t.target instanceof HTMLFormElement){const{target:e,detail:{fetchOptions:n}}=t;e.addEventListener("turbo:submit-start",(({detail:{formSubmission:{submitter:t}}})=>{const s=isBodyInit(n.body)?n.body:new URLSearchParams;const o=determineFetchMethod(t,s,e);if(!/get/i.test(o)){/post/i.test(o)?s.delete("_method"):s.set("_method",o);n.method="post"}}),{once:true})}}function determineFetchMethod(t,e,n){const s=determineFormMethod(t);const o=e.get("_method");const i=n.getAttribute("method")||"get";return typeof s=="string"?s:typeof o=="string"?o:i}function determineFormMethod(t){return t instanceof HTMLButtonElement||t instanceof HTMLInputElement?t.name==="_method"?t.value:t.hasAttribute("formmethod")?t.formMethod:null:null}function isBodyInit(t){return t instanceof FormData||t instanceof URLSearchParams}window.Turbo=t;addEventListener("turbo:before-fetch-request",encodeMethodIntoRequestBody);


# Event Loop

The Javascript codes are executed by Javascript engines (which is a core part of browsers in the front end, and part of Node.JS platform in the back end).

You probably have heard that Javascript engine is single-thread. Is it bad? Would it cause performance issues? Let's give it more discussion in this section.

Before we start, let's look at the codes below. Can you guess what's the output on the console?

```javascript
function main(){
  console.log('A');
  setTimeout(
    function display(){ console.log('B'); }
  ,0);
	console.log('C');
}
main();
```

Now run it and verify if you guess correctly. 

Can you explain why? If not, you need to understand more about the event-loop implemented by Javascript engines.

## 5 Essential Concepts

Let's start by looking at the basic concepts.

![event loop](../../../images/event-loop.svg)


- **Call Stack**: Everytime a function is executed, a stack of frames (i.e. other function calls) is added, and as the frames finish execution, they are removed from the stack
  - What’s a stack? A stack is an array-like data structure but it can only add items to the back and only remove the last item. In short, it's Last In First Out (LIFO), like a stack of plates
- **Heap**: This is part of computer memory allocated to store Javascript objects.
- **Event Table**: The event table contains a key-value mapping between **events** and the corresponding **event handler** (which is a **callback function**).  Every time an event is emitted (e.g. click), it is checked against the event table. If the event is in the table, the event handler is added to the message queue. If there is no listener, the event is lost.
- **Message Queue (a.k.a. Event Queue)**: The javascript engine (e.g. Chrome V8) repeatly checks if there's anything in the event queue. If there is an event in the queue, and if the call stack is empty, it will move the message to the call stack.
  - What’s a queue? A queue is an array-like data structure but it can only add items to the back and only remove the first item. In short, it's First In First Out (FIFO), like a queue at the cashier
- **Event Loop**: The event loop got its name because of how it's usually implemented:
  - It keeps looping to check if there's anything in the message queue
  - If there's no message in the message queue, the event loop keeps looping and waiting until an event emission causes a message to be added to the queue
  - If there's a message, it gets added to the call stack. The call stack runs to completion, and the empties itself.
    - When the call stack is empty, the next message in the event queue is added to the call stack

With the understanding on the event loop, let's do another exercise. Run the code below. Can you explain what you observe with the event-loop model we introduce above?

```javascript
const s = new Date().getSeconds();

setTimeout(function() {
  // prints out "2", meaning that the callback is not called immediately after 500 milliseconds.
  console.log("Ran after " + (new Date().getSeconds() - s) + " seconds");
}, 500);

while(true) {
  if(new Date().getSeconds() - s >= 2) {
    console.log("Good, looped for 2 seconds");
    break;
  }
}
```

More discussion on the event-loop can be found in the links below
- [Concurrency model and Event Loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop#Runtime_concepts)
- [Javascript Event Loop Explained](https://medium.com/front-end-hacking/javascript-event-loop-explained-4cd26af121d4)
# Authentication and Session Management

In this section, we will learn how to protect your web API with authentication and how to keep track of session with client.

## Authentication

Authentication is the process for the client side (the user) to identify who they are. Typically a user would submit his user name and password to the server, and the server side needs to verify those credentials. If the user's identify is verified, a HTTP cookie or token needs to be sent back to the client side so that the subsequent requests in the same session do not trigger authentication again.

## Session Management

The subsequent requests in an authenticated session need to carry the cookie or token issued by the server side. The server side needs to verify the cookie or token before it grant the client to access protected resources (APIs).

There are quite a few challenges and choices with session management:

- Should we use session cookie or tokens?
- Where should client side store the cookie/tokens?

We will see more discussions on this topic.


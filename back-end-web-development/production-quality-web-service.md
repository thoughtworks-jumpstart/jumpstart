# Production Quality Web Service

After hours of hard work, you are going to deploy your web services to production. Before you do that, there are some important things to check and consider:

* What if the web service crash in production? What can you do to prevent/handle that situation?
* How do you configure your application in production? Specifically, how do you handle the secrets such as database passwords?
* Is your application secure? Have you put in protections against attacks like XSS and CSRF?

We are going to discuss some of the topics in this section.

## Use a reverse-proxy in front of node service

You should consider to use a [reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy) like [Nginx](https://www.nginx.com/) as the front-end server which will then proxy requests to your server running Node process.

Nginx provides a lot of tools out of the box that we can use to avoid unnecessary stress on our Node server, such as [GZIP encoding](https://en.wikipedia.org/wiki/HTTP_compression), static file serving, and HTTP caching.

## Set NODE\_ENV = “production”

Why is this variable so important?

Well, the modules we require\(\) and use sometimes check this variable’s value and operate differently in production mode. Express, for example, could run up to [3 times faster](http://apmblog.dynatrace.com/2015/07/22/the-drastic-effects-of-omitting-node_env-in-your-express-js-applications/) in production mode, which is significant.

If you’re using a process manager \(recommended for production environments\), for example, StrongLoop PM or PM2, define NODE\_ENV in the corresponding process manager configuration/ecosystem file.

If you’re directly executing your server, before executing your server run “export NODE\_ENV=production” on Linux/OS-X, or “SET NODE\_ENV=production” on Windows.

## Use a Process Manager

When you run Express apps for production, it is helpful to use process manager to achieve the following tasks:

* Restart the app automatically if it crashes.
* Gain insights into runtime performance and resource consumption.
* Modify settings dynamically to improve performance.
* Control clustering.

A process manager is somewhat like an application server: it’s a “container” for applications that facilitates deployment, provides high availability, and enables you to manage the application at runtime.

The most popular process managers for Express and other Node.js applications are as follows:

* [StrongLoop-PM](http://strong-pm.io/)
* [PM2](http://pm2.keymetrics.io/)
* [Forever](https://github.com/foreverjs/forever)
* [Pandora](https://github.com/midwayjs/pandora/)

These process managers are all feature-rich. You can find a brief introduction [here](https://expressjs.com/en/advanced/pm.html) and a detailed comparison of their features [here](http://strong-pm.io/compare/).

If you don't use process manager, you can achieve the purpose of auto-restarting failed processes with some other tools as well. Here are two more options:

### Heroku

If you deploy your application on Heroku, Heroku monitors your application and restart it in case of crash. Some documentation can be found [here](https://stackoverflow.com/questions/19265728/does-heroku-restart-nodejs-server-if-application-crashes)

### Docker Based Deployment

If you happen to deploy your applications in Docker container, there are some configuration to [restart container automatically](https://docs.docker.com/docker-cloud/apps/autorestart/) when the process in a container crashes.

## Run in Cluster Mode

Nowadays most of the powerful servers has multiple-CPU cores. However, Node based applications are single-threaded in nature.

What this means is that your node server can only use a single core, whereas all other cores might potentially be left unutilized. In order and harness these additional CPU resources to your server’s benefit, you have to run the server in cluster mode.

If you use a process manager, you can achieve this easily. For example, here is the command for PM2:

```text
pm2 start server.js -i 0
```

Note that the –i argument denotes the number of instances. Zero \(0\) means run on all CPUs/cores

### Resources

* [Production best practices: performance and reliability](https://expressjs.com/en/advanced/best-practice-performance.html)
* [Deploy NodeJS Servers Like a Pro](http://trainologic.com/deploy-node-js-servers-like-a-pro/)
* [Checklist: Node.JS production best practices](http://goldbergyoni.com/checklist-best-practice-of-node-js-in-production/)


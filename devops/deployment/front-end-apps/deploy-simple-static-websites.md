# Deploy simple static websites

If you only need a place to host your React application \(or any application with static assets only like HTML/CSS/Javascript\), you can consider the following options:

* [github pages](https://pages.github.com/)
* [netlify](https://www.netlify.com/)
* [surge](http://surge.sh/)
* [now](https://zeit.co/now)
* [aerobatic](https://www.aerobatic.com/)

Out of these choices, we recommend to use [Now](https://zeit.co/now) for its simplicity.

## Now

It's very easy to get started with [Now](https://zeit.co/now)

Step 1: Install CLI

```text
npm install -g now
```

Step 2: Run the `now` command for the first time to register an account

Once you provide your email, you need to verify your email account by checking an email sent into your inbox. After verification, some authentication token is stored in your `~/.now` directory so that you don't need to authenticate again to the Now website.

Step 3: Run `now` command in the directory which contains the static web assets you need to publish.

On the console, you will see the URL where your website is deployed to.

## GitHub Pages

You can find out to use GitHub Pages easily by following their step-by-step guide on the [landing page](https://pages.github.com/) \(**Note**: Scroll past the video and select "Project site" instead of "User or organization site"\). All you need is one `index.html` file and configure your GitHub project to enable GitHub Pages.

Caveat:

* It usually takes a minute or two after you push your changes to the github repository, before yuo can see the updates reflected in the github page website for the project.
* There are some [usage limits](https://help.github.com/articles/what-is-github-pages/#usage-limits) for Github Pages. One important thing is "GitHub Pages sites have a soft limit of 10 builds per hour." If you push some changes to the github repository and don't see the change in your website, it might due to the limit on the builds per hour.


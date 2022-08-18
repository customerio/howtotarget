---
client: Yahoo Japan
version:
platform: webmail
status: Working
languages:
  - HTML
  - CSS
contributor: Mark Robbins
---

```html
<noscript>
  <style>
    .& .foo{}
  </style>
</noscript>
```

Although it’s run as a separate company, the same targeting works for Yahoo Japan and Yahoo.com. However, Yahoo Japan displays the email in a sandboxed iframe and we can separate it with a noscript tag that Yahoo.com will ignore.

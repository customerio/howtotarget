---
client: Outlook
version:
platform: macOS
status: Working
languages:
  - CSS
contributor: Mark Robbins
---

```css
_:-webkit-full-screen, _::-webkit-full-page-media, _:future, :root body:not(.Singleton) .foo {}
```

The stuff before `.body` will target WebKit desktop apps on Mac (Apple Mail and Outlook Mac), then we add `:not(.Singleton)` to remove Apple Mail.

This also targets Spark desktop app.

Note that this will not work for non-Outlook accounts.

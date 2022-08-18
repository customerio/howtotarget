---
client: Gmail
version:
platform: Android
status: Working
languages:
  - CSS
contributor: Mark Robbins
---

```css
div > u + .body .foo
```

Gmail changes the doctype to `<u></u>`. This is placed adjacent to a div that inherits class and id from the body tag.

You must include a `doctype` tag.

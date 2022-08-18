---
client: Outlook
version:
platform: webmail
status: Working
languages:
  - CSS
contributor: Mark Robbins
---

```css
[class~="x_your-class-name"] { /* Replace this comment with your styles */ }
```

Outlook.com prefixes class names with `x_` but doesn't do this on attribute selectors. So `<div class="your-class-name">` can be targeted with `[class="x_your-class-name"]` and it'll only apply to Outlook.

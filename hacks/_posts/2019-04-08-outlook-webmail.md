---
client: Outlook
version:
platform: webmail
status: Working
contributor: Mark Robbins
---

```css
[class~="x_foo"]{}
```

Outlook.com prefixes class names with `x_` but doesn't do this on attribute selectors. So `<div class="foo">` can be targeted with `[class="x_foo"]` and it'll only apply to Outlook.

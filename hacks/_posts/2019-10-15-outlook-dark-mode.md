---
client: Outlook
version:
platform: webmail & iOS dark modes
status: Working
languages:
  - CSS
contributor: Mark Robbins
---

```css
[data-ogsc] .your-class-name {
  /* Replace this comment with your styles */
}
```

When changing a color style in dark mode, Outlook will add `data-ogsc` to the element. When changing a background-color style in dark mode, Outlook will add `data-ogsb` to the element.

This requires adding styles that Outlook will change to a wrapping element.

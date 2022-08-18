---
client: Outlook
version:
platform: iOS & Android
status: Working
languages:
  - CSS
contributor: Mark Robbins
---

```css
.foo\0{}
```

The `\0` gets removed as part of the HTML cleanup. Be aware that Gmail will remove a style block with this code, so it needs to be included in a separate `<style>` block.

This can also be added directly to a style, like `.foo{ background: red\0/;}`.

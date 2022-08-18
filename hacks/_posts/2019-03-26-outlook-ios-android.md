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
.your-class-name\0{
  /* Replace this comment with your styles */
}
```

The `\0` gets removed as part of the HTML cleanup. Be aware that Gmail will remove a style block with this code, so it needs to be included in a separate `<style>` block.

This can also be added directly to a style, like `.your-class-name { background: red\0/; }`.

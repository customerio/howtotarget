---
client: Outlook
version:
platform: webmail
status: Working
languages:
  - CSS
contributor: Cyrill Gross
---

```css
.your-class-name.x_chained-class-name {
  /* Styles for outlook webmail only */
}
.your-class-name.chained-class-name {
  /* Styles for everyone else */
}
```

```html
<div class="your-class-name chained-class-name">
  <!-- Your code -->
</div>
```

Outlook webmail (desktop and mobile) prefixes all class names with `x_`. It does this in the class attribute of html elements as well as class definitions in `<style>` blocks. However, in the `<style>` blocks it does it only on the first class name of chained classes: `.your-class-name.x_chained-class-name` will be changed to `.x_your-class-name.x_chained-class-name`. On the element `<div class="your-class-name chained-class-name">` will be changed to `<div class="x_your-class-name x_chained-class-name">` by Outlook webmails pre processor. 
This approach allows us to build a exclusive targeting which is helpful to tackle the `box-sizing:border-box !important;` style attribute which Outlook webmail adds on elements having widht / height AND paddings defined as we can set the width / heigth for border-box calculation for Outlook webmail only.
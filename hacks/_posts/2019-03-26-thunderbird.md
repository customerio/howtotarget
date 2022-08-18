---
client: Thunderbird
version:
platform:
status: Working
languages:
  - CSS
contributor: Mark Robbins
---

```css
meta ~ * .your-class-name { /* Replace this comment with your styles */ }
```

or

```css
title ~ * .your-class-name { /* Replace this comment with your styles */ }
```

The head and body structure of the email is removed, making content in the head siblings of that in the body, so we can target with this. Applies to Thunderbird, Freenet (`title` element only), Orange.fr, and Samsung.

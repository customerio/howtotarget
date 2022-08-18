---
client: Apple Mail
version:
platform: iPad
status: Working
languages:
  - CSS
contributor: Wilbert Heinen
---

```css
@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (-webkit-min-device-pixel-ratio: 2), (min-resolution: 2dppx) and (hover: none){
  _:-webkit-full-screen, _::-webkit-full-page-media, _:future, :root body:not(.Singleton) .your-class-name {}
}
```

Media queries detect the device size to filter out iPhones. Using `:not(.Singleton)` filters out Apple Mail desktop.

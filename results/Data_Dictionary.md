# Code Sniffer Data Dictionary

This is a brief explaination of the data fields returned by the CodeSniffer A11y application

## Sample

```

[{"code":"WCAG2AA.Principle2.Guideline2_4.2_4_2.H25.2",
  "context":"<title>18F Digital Services Delivery</title>",
  "message":"Check that the title element describes the document.",
  "selector":"html > head > title",
  "type":"notice",
  "typeCode":3}]
```
- **"code"** - The Accessibility section in which the error, notice, or warning is derived
  - [WCAG2AA](http://www.w3.org/TR/WCAG20/)
  - [508](http://www.access-board.gov/guidelines-and-standards/communications-and-it/about-the-section-508-standards/section-508-standards)
- **"context"** - The specific piece of HTML from the web page that the error, notice, or warning was found or relates to
- **"message"** - How the context relates to the section or how to check manually
- **"selector"** - CSS selector that points to the affected HTML element
- **"type"** - The type of issue found by the tool
 - **"notice"** - The tool is prompting the user of a possible error. This program is unable to properly test the compliance guideline, so further instructions are provided in context
 - **"warning"** - A possible error has been found. The program is reasonably sure, something is wrong, but requires a human to verify
 - **"error"** - An issue on the site has been found. Errors are the most sever type the program can assign and it is reserved for known issues
- **"typeCode"** - Corresponds to "type"
 - 3 = notice, 2 = warning, 1 = error

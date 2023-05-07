# Light Pollution

> Submitted as part of **Apple WWDC23 Swift Student Challenge**.

![Light Pollution Preview](https://user-images.githubusercontent.com/72428718/234043615-47d67c46-74a5-402d-a205-f64be999a97f.png)

## Introduction

As someone who loves to gaze at the stars, I've found that light pollution is an inconvenience. However, it's actually much more than that - light pollution has significant impacts that we should all be aware of.

In this playground, let's learn about this phenomenon together: what it is, why we should be concerned, and what we can do to mitigate it.

This playground consists of six main contents with interactive elements on each page with modular components to closely resembles real-life light pollution.

## Usage

This playground start from `MyApp.swift`.

It is **best viewed** on an `iPad Pro (12.9-inch)` in both portrait and landscape mode, and can also be run on `macOS Swift Playground 4.3`.

## Technology Used

1. SwiftUI
2. AVFoundation

## Assets

Graphic assets are created in `Figma` with inspiration from the Internet.
Audio assets are created with my light switch (edited on Audacity).

## Tools

1. XCode
2. Figma
3. Notion (For note-taking)
4. MacOS GarageBand
5. Audacity
6. My Light Switch :D

## Credits

This playground would not be complete without the contributions from the community.
Credit for various resources used in this playground can be found inside the playground.

Additionally, I would like to give credits to the following:

- Apple Documentation
- Stack Overflow
- GitHub
- YouTube
- Forums

## Directory

```shell
.
├── Assets.xcassets
├── ContentView.swift
├── MyApp.swift
├── Package.swift
├── README.md
├── components  // contains modular components
├── models      // contains observable objects
├── Resources   // contains audio resources
├── utilities   // contains extensions, functions, and etc.
└── views       // contains all views
    ├── main
    │   ├── Conclusion.swift
    │   ├── Introduction.swift
    │   ├── LightPollution.swift
    │   ├── LightPollutionAwareness.swift
    │   ├── LightPollutionTypes.swift
    │   └── WhatWeNeedToDo.swift
    └── other
        ├── Credits.swift
        ├── Onboarding.swift
        └── Settings.swift
```

## Thanks and Have Fun Learning

---

## Extra Notes

There are two .swiftpm file in this repository.

1. **Light Pollution (Original submission)**
   This is the original submission for WWDC2023 Swift Student Challenge.
2. **Light Pollution (Bug Fixed)**
    There are two bugs that I've discovered after passing the deadline, including:
    - Extra `Spacer()` causing moon to shift every 5 seconds in `Why Should We Aware?` page.
    - Directed light on `Incadescent`, `CFL`, and `LED` didn't went off when using light mode in `What Should We Do?` page.

---
Last edited on: 07 May 2023
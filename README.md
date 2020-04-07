# render_loop
[![GitHub release](https://img.shields.io/github/release/neutrinog/render_loop.svg)](https://github.com/neutrinog/render_loop/releases)
[![Build Status](https://travis-ci.org/neutrinog/render_loop.svg?branch=master)](https://travis-ci.org/neutrinog/render_loop)

A generic rendering loop that can be used as the foundation of any program that needs to render something to the screen. e.g. a 3D game.

There are no dependencies, and this won't draw anything for you on it's own.
What it does give you is:

* A loop - that will manage renders and udpates based on a specified framerate.
* A window interface - so you can use your favorite rendering context (e.g. GLFW, etc.).
* An engine interface - so you can configure things like a rendering engine, game engine, physics engine, etc.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     render_loop:
       github: neutrinog/render_loop
   ```

2. Run `shards install`

## Usage

```crystal
require "render_loop"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/neutrinog/render_loop/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Joel](https://github.com/neutrinog) - creator and maintainer

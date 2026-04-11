OpenVox Documentation Experiments
=================================

This repository is a proving ground for an experimental publishing
pipeline for OpenVox Documentation re-assembled from Puppet Open Source
releases and other upstream sources. This repository is inspired
by OpenVoxProject/openvox-docs, but is a from-scratch effort that
represents a clean break from the overgrown, calcified nature of that
codebase.

Everything produced and published here should be considered both 
experimental and ephemeral. The purpose of this repository is
to eventually be archived with any good stuff contributed upstream.

## Building Docs

To build the documentation in this repository, first install Ruby 3.2 or later.
Then use Bundler to install the project dependencies:

```
bundle install
```

After that, documentation can be built using:

```
bundle exec jekyll build
```

Or, served locally using:

```
bundle exec jekyll serve
```

## Editing Docs

The documentation content is contained in markdown files the `docs/` directory.
Each product has a versioned directory, i.e. `_openfact_5x`, with a `*_latest`
symlink pointing to it.

For usage of other files outside of the `docs/` directory, e.g. `_config.yml`,
`_data/`, or `index.md`, see the documentation for the Jekyll VitePress  template:

  https://jekyll-vitepress.dev

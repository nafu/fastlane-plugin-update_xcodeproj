# update_xcodeproj plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-update_xcodeproj)

[![Gem Version](https://badge.fury.io/rb/fastlane-plugin-update_xcodeproj.svg)](https://badge.fury.io/rb/fastlane-plugin-update_xcodeproj)
[![CircleCI](https://circleci.com/gh/nafu/fastlane-plugin-update_xcodeproj.svg?style=svg)](https://circleci.com/gh/nafu/fastlane-plugin-update_xcodeproj)
[![Code Climate](https://codeclimate.com/github/nafu/fastlane-plugin-update_xcodeproj/badges/gpa.svg)](https://codeclimate.com/github/nafu/fastlane-plugin-update_xcodeproj)
[![Coverage Status](https://coveralls.io/repos/github/nafu/fastlane-plugin-update_xcodeproj/badge.svg?branch=master)](https://coveralls.io/github/nafu/fastlane-plugin-update_xcodeproj?branch=master)
[![Dependency Status](https://gemnasium.com/badges/github.com/nafu/fastlane-plugin-update_xcodeproj.svg)](https://gemnasium.com/github.com/nafu/fastlane-plugin-update_xcodeproj)
[![Inline docs](http://inch-ci.org/github/nafu/fastlane-plugin-update_xcodeproj.svg?branch=master)](http://inch-ci.org/github/nafu/fastlane-plugin-update_xcodeproj)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-update_xcodeproj`, add it to your project by running:

```bash
fastlane add_plugin update_xcodeproj
```

## About update_xcodeproj

Update Xcode projects

```ruby
update_xcodeproj(
  xcodeproj: 'Example.xcodeproj', # Optional path to xcodeproj, will use first .xcodeproj if not set
  options: {'VARIABLE_YOUR_WANT_TO_CHANGE': 'new value'} # Key & Value pair to update xcode project
)
```

- Inspired
  - [update_app_identifier](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_app_identifier.rb)
  - [update_info_plist](https://github.com/fastlane/fastlane/blob/master/fastlane/lib/fastlane/actions/update_info_plist.rb)

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`. 

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use 
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate building and releasing your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

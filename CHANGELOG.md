# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:

New features:

Bugfixes:

Other improvements:

## [v4.1.1](https://github.com/purescript/purescript-either/releases/tag/v4.1.1) - 2018-11-30

Reordered instance chain for `Inject` so that `inj :: a -> a` succeeds (@hdgarrood)

## [v4.1.0](https://github.com/purescript/purescript-either/releases/tag/v4.1.0) - 2018-10-28

Added `FunctorWithIndex`, `FoldableWithIndex`, `TraversableWithIndex` instances (@MonoidMusician)

## [v4.0.0](https://github.com/purescript/purescript-either/releases/tag/v4.0.0) - 2018-05-23

- Updated for PureScript 0.12
- Added `\/` type synonym to `Data.Either.Nested`
- Added `Inject` class for injecting values into/projecting values out of nested `Eithers`

## [v3.2.0](https://github.com/purescript/purescript-either/releases/tag/v3.2.0) - 2018-04-15

- Added `note'` (lazy `note`) (@matthewleon)

## [v3.1.0](https://github.com/purescript/purescript-either/releases/tag/v3.1.0) - 2017-06-23

- Added `note` and `hush` functions (@kRITZCREEK)

## [v3.0.0](https://github.com/purescript/purescript-either/releases/tag/v3.0.0) - 2017-03-26

- Updated for PureScript 0.11

## [v2.2.1](https://github.com/purescript/purescript-either/releases/tag/v2.2.1) - 2017-03-05

- Fix lower bound of prelude dependency (@passy)

## [v2.2.0](https://github.com/purescript/purescript-either/releases/tag/v2.2.0) - 2017-03-02

- Added `Eq1` and `Ord1` instances

## [v2.1.0](https://github.com/purescript/purescript-either/releases/tag/v2.1.0) - 2016-12-24

Add `choose` function (@tmcgilchrist)

## [v2.0.0](https://github.com/purescript/purescript-either/releases/tag/v2.0.0) - 2016-10-03

- Updated dependencies
- The `Nested` module has been reworked for "open" nesting #20 (@natefaubion)

## [v1.0.0](https://github.com/purescript/purescript-either/releases/tag/v1.0.0) - 2016-06-01

This release is intended for the PureScript 0.9.1 compiler and newer.

**Note**: The v1.0.0 tag is not meant to indicate the library is “finished”, the core libraries are all being bumped to this for the 0.9 compiler release so as to use semver more correctly.

## [v1.0.0-rc.1](https://github.com/purescript/purescript-either/releases/tag/v1.0.0-rc.1) - 2016-03-13

- Release candidate for the psc 0.8+ core libraries

## [v0.2.3](https://github.com/purescript/purescript-either/releases/tag/v0.2.3) - 2015-09-26

Fixed error message (@zudov)

## [v0.2.2](https://github.com/purescript/purescript-either/releases/tag/v0.2.2) - 2015-08-14

- Added `Semiring` and `Semigroup` instances (@anttih)

## [v0.2.1](https://github.com/purescript/purescript-either/releases/tag/v0.2.1) - 2015-08-13

- Fixed warnings about partial functions

## [v0.2.0](https://github.com/purescript/purescript-either/releases/tag/v0.2.0) - 2015-06-30

This release works with versions 0.7.\* of the PureScript compiler. It will not work with older versions. If you are using an older version, you should require an older, compatible version of this library.

## [v0.2.0-rc.1](https://github.com/purescript/purescript-either/releases/tag/v0.2.0-rc.1) - 2015-06-06

Initial release candidate of the library intended for the 0.7 compiler.

## [v0.1.8](https://github.com/purescript/purescript-either/releases/tag/v0.1.8) - 2015-03-25

More helper functions for nested sums (@jdegoes)

## [v0.1.7](https://github.com/purescript/purescript-either/releases/tag/v0.1.7) - 2015-03-24

Reworked nested sums (@jdegoes)

## [v0.1.6](https://github.com/purescript/purescript-either/releases/tag/v0.1.6) - 2015-03-18

Add `fromLeft` and `fromRight` (@pseudonom)

## [v0.1.5](https://github.com/purescript/purescript-either/releases/tag/v0.1.5) - 2015-03-17

Update docs

## [v0.1.4](https://github.com/purescript/purescript-either/releases/tag/v0.1.4) - 2014-11-05



## [v0.1.3](https://github.com/purescript/purescript-either/releases/tag/v0.1.3) - 2014-08-26

Add `Alt` instance

## [v0.1.2](https://github.com/purescript/purescript-either/releases/tag/v0.1.2) - 2014-05-22

- Fixed `show` output (paf31)

## [v0.1.1](https://github.com/purescript/purescript-either/releases/tag/v0.1.1) - 2014-04-25



## [v0.1.0](https://github.com/purescript/purescript-either/releases/tag/v0.1.0) - 2014-04-21




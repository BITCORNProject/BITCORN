# Bitcorn's Next Generation Working Repository

[![Build Status](https://travis-ci.org/BITCORNProject/Bitcorn-Test.svg?branch=master)](https://travis-ci.org/BITCORNProject/Bitcorn-Test) ![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg)

## License

Bitcorn Core is released under the terms of the MIT license. See [COPYING](COPYING) for more
information or see https://opensource.org/licenses/MIT.

## Development Process

Developers work in their own trees, then submit pull requests to the development branch when they think their feature or bug fix is ready.

The patch will be accepted if there is broad consensus that it is a good thing. Developers should expect to rework and resubmit patches if they don't match the project's coding conventions see [developer-notes.md](https://github.com/BITCORNProject/BITCORN/blob/master/doc/developer-notes.md) or are controversial. We require multiple developers to review code changes. A developer who submits a pull request cannot approve the pull request themselves.

Milestones should be made to signify a future release. Bugs that are not network breaking or new/changed features should be tagged to a milestone. Not every new addition or change has to be tagged to the next milestone. Milestones are like a roadmap of the future. They are effective to set expectations of what is to be expected or achieved for future release(s). It is not uncommon to push tasks to a future milestone if the expectation of the said task cannot be completed in time or doesn't fit the next release time frame. Milestones also keep development tidy for testing of what should be expected for next release.

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/BITCORNProject/Bitcorn-Test/tags) are created
regularly to indicate new official, stable release versions of Bitcorn Core.

## Branching Strategy

Bitcorn uses four branches to ensure stability without slowing down the pace of the daily development activities - development, staging, master and hotfix.

The development branch is used for day-to-day activities. It is the most active branch and is where pull requests go by default. This branch may contain code which is not yet stable or ready for production, so it should only be executed on testnet to avoid disruption to production network.

When a decision has been made that the development branch should be moving towards a final release it is merged to staging where no new development takes place. This branch is purely to stabilize the code base and squash out bugs rained down from development. This is Bitcorn's beta testing phase.

Once the staging branch is stable and runs smoothly, it is merged to master, a tag is created, and a release is made available to the public.

When a bug is found in a production version and an update needs to be released quickly, the changes go into a hotfix branch for testing before being merged to master for release. This allows for production updates without having to merge straight to master if the staging branch is busy.

### Automated Testing

Developers are strongly encouraged to write [unit tests](src/test/README.md) for new code, and to
submit new unit tests for old code. Unit tests can be compiled and run
(assuming they weren't disabled in configure) with: `make check`. Further details on running
and extending unit tests can be found in [/src/test/README.md](/src/test/README.md).

There are also [regression and integration tests](/test), written
in Python, that are run automatically on the build server.
These tests can be run (if the [test dependencies](/test) are installed) with: `test/functional/test_runner.py`

The Travis CI system makes sure that every pull request is built for Windows, Linux, and macOS, and that unit/sanity tests are run automatically.

### Manual Quality Assurance (QA) Testing

Changes should be tested by somebody other than the developer who wrote the
code. This is especially important for large or high-risk changes. It is useful
to add a test plan to the pull request description if testing the changes is
not straightforward.

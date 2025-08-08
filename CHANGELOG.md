# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v5.0.0](https://github.com/saz/puppet-ntp/tree/v5.0.0) (2025-08-08)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v4.0.0...v5.0.0)

**Breaking changes:**

- replace puppet requirement by openvox [\#46](https://github.com/saz/puppet-ntp/pull/46) ([saz](https://github.com/saz))

## [v4.0.0](https://github.com/saz/puppet-ntp/tree/v4.0.0) (2025-01-14)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v3.0.0...v4.0.0)

**Merged pull requests:**

- use ntpsec on Debian based OS by default [\#42](https://github.com/saz/puppet-ntp/pull/42) ([saz](https://github.com/saz))
- fix service notify [\#41](https://github.com/saz/puppet-ntp/pull/41) ([saz](https://github.com/saz))
- add support for Debian Bookworm, refs ops/server\#500813 [\#40](https://github.com/saz/puppet-ntp/pull/40) ([saz](https://github.com/saz))
- replace params.pp with hiera data [\#39](https://github.com/saz/puppet-ntp/pull/39) ([saz](https://github.com/saz))

## [v3.0.0](https://github.com/saz/puppet-ntp/tree/v3.0.0) (2024-12-09)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.5.1...v3.0.0)

**Closed issues:**

- "thinker panic 0" for VMs [\#34](https://github.com/saz/puppet-ntp/issues/34)
- disable monitor [\#32](https://github.com/saz/puppet-ntp/issues/32)

**Merged pull requests:**

- replace legacy facts [\#38](https://github.com/saz/puppet-ntp/pull/38) ([saz](https://github.com/saz))
- Update from modulesync\_config [\#37](https://github.com/saz/puppet-ntp/pull/37) ([saz](https://github.com/saz))
- Service is not subscribed to the default config file if it exists [\#35](https://github.com/saz/puppet-ntp/pull/35) ([theosotr](https://github.com/theosotr))
- introduce the disable\_monitor flag [\#33](https://github.com/saz/puppet-ntp/pull/33) ([dlucredativ](https://github.com/dlucredativ))

## [v2.5.1](https://github.com/saz/puppet-ntp/tree/v2.5.1) (2018-01-12)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.5.0...v2.5.1)

**Closed issues:**

- Unknown variable: '::lsbmajdistrelease' [\#29](https://github.com/saz/puppet-ntp/issues/29)

**Merged pull requests:**

- fix issue 29 [\#30](https://github.com/saz/puppet-ntp/pull/30) ([bovy89](https://github.com/bovy89))

## [v2.5.0](https://github.com/saz/puppet-ntp/tree/v2.5.0) (2017-06-24)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.4.0...v2.5.0)

**Closed issues:**

- Error while evaluating a Function Call, 'versioncmp'  [\#27](https://github.com/saz/puppet-ntp/issues/27)

**Merged pull requests:**

- fix for issue \#27 [\#28](https://github.com/saz/puppet-ntp/pull/28) ([jbro](https://github.com/jbro))
- Enabled the use of ntp pools [\#26](https://github.com/saz/puppet-ntp/pull/26) ([jengell](https://github.com/jengell))

## [v2.4.0](https://github.com/saz/puppet-ntp/tree/v2.4.0) (2017-01-06)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.3.2...v2.4.0)

**Closed issues:**

- Error when running with parser=future on CentOS 7 [\#24](https://github.com/saz/puppet-ntp/issues/24)
- Fails on CentOS 7.2 [\#21](https://github.com/saz/puppet-ntp/issues/21)

**Merged pull requests:**

- undef not '' matches when facter can't find a fact [\#25](https://github.com/saz/puppet-ntp/pull/25) ([freepenguins](https://github.com/freepenguins))
- Evaluation error: comparison of String \>=Integer is not possible [\#23](https://github.com/saz/puppet-ntp/pull/23) ([JvdW](https://github.com/JvdW))
- Fix OS release detection [\#22](https://github.com/saz/puppet-ntp/pull/22) ([mhutter](https://github.com/mhutter))
- added whitespace for server\_options output in ntp.conf template [\#20](https://github.com/saz/puppet-ntp/pull/20) ([kallon](https://github.com/kallon))
- remove unknown params [\#19](https://github.com/saz/puppet-ntp/pull/19) ([jfroche](https://github.com/jfroche))
- add abstraction for SLE12 [\#18](https://github.com/saz/puppet-ntp/pull/18) ([mattiascockburn](https://github.com/mattiascockburn))

## [v2.3.2](https://github.com/saz/puppet-ntp/tree/v2.3.2) (2015-05-26)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.3.1...v2.3.2)

**Closed issues:**

- Variable access via 'statsdir' is deprecated [\#16](https://github.com/saz/puppet-ntp/issues/16)

**Merged pull requests:**

- silence deprecation warnings on puppet 3.x [\#17](https://github.com/saz/puppet-ntp/pull/17) ([endemics](https://github.com/endemics))

## [v2.3.1](https://github.com/saz/puppet-ntp/tree/v2.3.1) (2015-03-29)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.3.0...v2.3.1)

**Merged pull requests:**

- fix service name for opensusse 13.2 [\#15](https://github.com/saz/puppet-ntp/pull/15) ([lackhove](https://github.com/lackhove))

## [v2.3.0](https://github.com/saz/puppet-ntp/tree/v2.3.0) (2014-06-22)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.2.0...v2.3.0)

**Closed issues:**

- spec tests [\#11](https://github.com/saz/puppet-ntp/issues/11)

**Merged pull requests:**

- added Archlinux support and make service start in Fedora20 [\#14](https://github.com/saz/puppet-ntp/pull/14) ([alaureijs](https://github.com/alaureijs))

## [v2.2.0](https://github.com/saz/puppet-ntp/tree/v2.2.0) (2014-01-24)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.0.4...v2.2.0)

**Merged pull requests:**

- EL6 and Puppet 2 fixes [\#12](https://github.com/saz/puppet-ntp/pull/12) ([domcleal](https://github.com/domcleal))

## [v2.0.4](https://github.com/saz/puppet-ntp/tree/v2.0.4) (2013-12-03)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.0.3...v2.0.4)

**Merged pull requests:**

- Fix error message about Service\[ntp\] in 'absent' case [\#10](https://github.com/saz/puppet-ntp/pull/10) ([joschi](https://github.com/joschi))
- Addressed template variable warnings after upgrading to Puppet 3.2 [\#8](https://github.com/saz/puppet-ntp/pull/8) ([avtar](https://github.com/avtar))
- Ntpdate [\#4](https://github.com/saz/puppet-ntp/pull/4) ([razorsedge](https://github.com/razorsedge))

## [v2.0.3](https://github.com/saz/puppet-ntp/tree/v2.0.3) (2013-02-01)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/v2.0.0...v2.0.3)

**Closed issues:**

- ntp failure with Ubuntu 12.04 LTS [\#3](https://github.com/saz/puppet-ntp/issues/3)

**Merged pull requests:**

- make statsdir an empty variable [\#7](https://github.com/saz/puppet-ntp/pull/7) ([nbeernink](https://github.com/nbeernink))
- Sysconfig [\#5](https://github.com/saz/puppet-ntp/pull/5) ([razorsedge](https://github.com/razorsedge))
- Add params for OpenSuSE systems [\#2](https://github.com/saz/puppet-ntp/pull/2) ([vjt](https://github.com/vjt))
- Support for RedHat familiy. [\#1](https://github.com/saz/puppet-ntp/pull/1) ([razorsedge](https://github.com/razorsedge))

## [v2.0.0](https://github.com/saz/puppet-ntp/tree/v2.0.0) (2012-01-11)

[Full Changelog](https://github.com/saz/puppet-ntp/compare/eb43e02c394d4783222000e9b518d7c27ce3c896...v2.0.0)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*

# Ansible role: Fail2ban
[![Version](https://img.shields.io/badge/latest_version-1.0.1-green.svg)](https://git.yaegashi.fr/nishiki/ansible-role-fail2ban/releases)
[![Build Status](https://travis-ci.org/nishiki/ansible-role-fail2ban.svg?branch=master)](https://travis-ci.org/nishiki/ansible-role-fail2ban)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://git.yaegashi.fr/nishiki/ansible-role-fail2ban/src/branch/master/LICENSE)

Install and configure Fail2ban

## Requirements

* Ansible >= 2.4
* Debian Stretch

## Role variables

* `fail2ban_blocktype` - iptable policy for an ip banned (default: `DROP`)
* `fail2ban_bantime` - default ban time in second (default: `600`)
* `fail2ban_findtime` - default find time in second to count the retries (default: `600`)
* `fail2ban_maxretry` - default max retry before a ban (default: `6`)
* `fail2ban_ignoreip` - array with the ips ignored
* `fail2ban_filters` - array with custom filters

```
  - name: web
    failregex: Login failed.*Remote IP.*'<HOST>' 
```

* `fail2ban_jails` -  array with the jails to enable

```
  - name: web
    logpath: /var/log/web.log
    filter: web
    port: 80,443
    additional:
      maxretry: 3
      bantime: 3600
```

## How to use

 * Install:

```
- hosts: server
  roles:
    - fail2ban
```

## Development
### Tests with docker

* install [docker](https://docs.docker.com/engine/installation/)
* install ruby
* install bundler `gem install bundler`
* install dependencies `bundle install`
* run the tests `kitchen test`

## License

```
Copyright (c) 2018 Adrien Waksberg

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

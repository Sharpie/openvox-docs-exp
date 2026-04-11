---
title: "`bolt-defaults.yaml` options"
layout: default
---
# `bolt-defaults.yaml` options

This page lists the configuration options that are available in the `bolt-defaults.yaml` configuration file,
which is supported in both the [system-wide and user-level configuration directories](configuring_bolt.md).

## Options

### `analytics`


Whether to disable analytics. Setting this option to 'false' in the system-wide or user-level configuration will disable analytics for all projects, even if this option is set to 'true' at the project level.

- **Type:** Boolean


```yaml
analytics: false
```
### `color`


Whether to use colored output when printing messages to the console.

- **Type:** Boolean
- **Default:** true


```yaml
color: false
```
### `compile-concurrency`


The maximum number of simultaneous manifest block compiles.

- **Type:** Integer
- **Default:** Number of cores.


```yaml
compile-concurrency: 5
```
### `concurrency`


The number of threads to use when executing on remote targets.

- **Type:** Integer
- **Default:** 100 or 1/7 the ulimit, whichever is lower.


```yaml
concurrency: 50
```
### `disable-warnings`


An array of IDs of warnings to suppress. Warnings with a matching ID will not be logged by Bolt. If you are upgrading Bolt to a new major version, you should re-enable all warnings until you have finished upgrading.

- **Type:** Array


```yaml
disable-warnings:
- powershell_2
```
### `format`


The format to use when printing results.

- **Type:** String
- **Available values:** `human`, `json`, `rainbow`
- **Default:** human


```yaml
format: json
```
### `inventory-config`


A map of default configuration options for the inventory. This includes options for setting the default transport to use when connecting to targets, as well as options for configuring the default behavior of each transport.

- **Type:** Hash


For a detailed description of each option, their default values, and any available
sub-options, see [Transport configuration reference](bolt_transports_reference.md).

```yaml
inventory-config:
  transport: winrm
  docker:
    cleanup: false
    service-url: https://docker.example.com
  jail:
    :cleanup: false
  local:
    cleanup: false
    tmpdir: "/tmp/bolt"
  lxd:
    :cleanup: false
  podman:
    cleanup: false
    tmpdir: "/mount/tmp"
  remote:
    run-on: proxy_target
  ssh:
    password: hunter2!
    user: bolt
  winrm:
    password: hunter2!
    user: bolt
```
### `log`


A map of configuration for the logfile output. Under `log`, you can configure log options for `console` and add configuration for individual log files, such as `~/.puppetlabs/bolt/debug.log`. Individual log files must be valid filepaths. If the log file does not exist, then Bolt will create it before logging information. Set the value to `disable` to remove a log file defined at an earlier level of the config hierarchy. By default, Bolt logs to a bolt-debug.log file in the Bolt project directory.

- **Type:** Hash

#### `append`


Whether to append output to an existing log file.

- **Type:** Boolean
- **Default:** true

#### `level`


The type of information to log.

- **Type:** String
- **Available values:** `trace`, `debug`, `error`, `info`, `warn`, `fatal`
- **Default:** warn


```yaml
log:
  console:
    level: info
  "~/logs/debug.log":
    append: false
    level: debug
```
### `module-install`


Options that configure where Bolt downloads modules from. This option is only used when installing modules using the `bolt module add|install` commands and `Add|Install-BoltModule` cmdlets.

- **Type:** Hash

#### `forge`


A subsection for configuring connections to a Forge host.

- **Type:** Hash

#### `proxy`


The HTTP proxy to use for Git and Forge operations.

- **Type:** String


```yaml
module-install:
  forge:
    authorization_token: Bearer eyJhbGciOiJIUzI1NiIsInR5c...
    baseurl: https://forge.example.com
    proxy: https://my-forge-proxy.com:8080
  proxy: https://my-proxy.com:8080
```
### `plugin-cache`


This feature is experimental. Enable plugin caching and set the time-to-live.

- **Type:** Hash

#### `ttl`


Time in seconds to keep the plugin cache.

- **Type:** Integer


```yaml
plugin-cache:
  ttl: 3600
```
### `plugin-hooks`


A map of [plugin hooks](writing_plugins.md#hooks) and which plugins a hook should use. The only configurable plugin hook is `puppet_library`, which can use two possible plugins: [`puppet_agent`](https://github.com/puppetlabs/puppetlabs-puppet_agent#puppet_agentinstall) and [`task`](using_plugins.md#task).

- **Type:** Hash
- **Pluggable:** true


```yaml
plugin-hooks:
  puppet_library:
    plugin: puppet_agent
    version: 6.15.0
    _run_as: root
```
### `plugins`


A map of plugins and their configuration data, where each key is the name of a plugin and its value is a map of configuration data. Configurable options are specified by the plugin. Read more about configuring plugins in [Using plugins](using_plugins.md#configuring-plugins).

- **Type:** Hash


```yaml
plugins:
  pkcs7:
    keysize: 1024
```
### `puppetdb`


A map containing options for [configuring the Bolt PuppetDB client](bolt_connect_puppetdb.md).

- **Type:** Hash
- **Pluggable:** true

#### `cacert`


The path to the ca certificate for PuppetDB.

- **Type:** String

- **Pluggable:** true
#### `cert`


The path to the client certificate file to use for authentication.

- **Type:** String

- **Pluggable:** true
#### `connect_timeout`


How long to wait in seconds when establishing connections with PuppetDB.

- **Type:** Integer
- **Default:** 60

- **Pluggable:** true
#### `key`


The private key for the certificate.

- **Type:** String

- **Pluggable:** true
#### `read_timeout`


How long to wait in seconds for a response from PuppetDB.

- **Type:** Integer
- **Default:** 60

- **Pluggable:** true
#### `server_urls`


An array containing the PuppetDB host to connect to. Include the protocol `https` and the port, which is usually `8081`. For example, `https://my-puppetdb-server.com:8081`.

- **Type:** Array

- **Pluggable:** true
#### `token`


The path to the PE RBAC Token.

- **Type:** String

- **Pluggable:** true

```yaml
puppetdb:
  cacert: "/etc/puppetlabs/puppet/ssl/certs/ca.pem"
  cert: "/etc/puppetlabs/puppet/ssl/certs/my-host.example.com.pem"
  connect_timeout: 120
  key: "/etc/puppetlabs/puppet/ssl/private_keys/my-host.example.com.pem"
  read_timeout: 120
  server_urls:
  - https://puppet.example.com:8081
  token: "~/.puppetlabs/token"
```
### `puppetdb-instances`


A map of named PuppetDB instances and their configuration, where keys are the name of a PuppetDB instance and values are maps of configuration options. For more information, see [Connecting Bolt to PuppetDB](bolt_connect_puppetdb.md).

- **Type:** Hash
- **Pluggable:** true


```yaml

```
### `save-rerun`


Whether to update `.rerun.json` in the Bolt project directory. If your target names include passwords, set this value to `false` to avoid writing passwords to disk.

- **Type:** Boolean
- **Default:** true


```yaml
save-rerun: false
```
### `spinner`


Whether to print a spinner to the console for long-running Bolt operations.

- **Type:** Boolean
- **Default:** true


```yaml
spinner: false
```
### `stream`


Whether to stream output from scripts and commands to the console. **This option is experimental**.

- **Type:** Boolean
- **Default:** false


```yaml
stream: true
```

## Example file

```yaml
# bolt-defaults.yaml
analytics: false
color: false
compile-concurrency: 5
concurrency: 50
disable-warnings:
- powershell_2
format: json
inventory-config:
  transport: winrm
  docker:
    cleanup: false
    service-url: https://docker.example.com
  jail:
    :cleanup: false
  local:
    cleanup: false
    tmpdir: "/tmp/bolt"
  lxd:
    :cleanup: false
  podman:
    cleanup: false
    tmpdir: "/mount/tmp"
  remote:
    run-on: proxy_target
  ssh:
    password: hunter2!
    user: bolt
  winrm:
    password: hunter2!
    user: bolt
log:
  console:
    level: info
  "~/logs/debug.log":
    append: false
    level: debug
module-install:
  forge:
    authorization_token: Bearer eyJhbGciOiJIUzI1NiIsInR5c...
    baseurl: https://forge.example.com
    proxy: https://my-forge-proxy.com:8080
  proxy: https://my-proxy.com:8080
plugin-cache:
  ttl: 3600
plugin-hooks:
  puppet_library:
    plugin: puppet_agent
    version: 6.15.0
    _run_as: root
plugins:
  pkcs7:
    keysize: 1024
puppetdb:
  cacert: "/etc/puppetlabs/puppet/ssl/certs/ca.pem"
  cert: "/etc/puppetlabs/puppet/ssl/certs/my-host.example.com.pem"
  connect_timeout: 120
  key: "/etc/puppetlabs/puppet/ssl/private_keys/my-host.example.com.pem"
  read_timeout: 120
  server_urls:
  - https://puppet.example.com:8081
  token: "~/.puppetlabs/token"
save-rerun: false
spinner: false
stream: true
```

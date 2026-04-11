# `bolt-project.yaml` options

This page lists the configuration options that are available in the `bolt-project.yaml`.
For more information, see [Configuring Bolt](configuring_bolt.md).

## Options

### `analytics`


Whether to disable analytics. Setting this option to 'false' in the system-wide or user-level configuration will disable analytics for all projects, even if this option is set to 'true' at the project level.

- **Type:** Boolean


```yaml
analytics: false
```
### `apply-settings`


A map of Puppet settings to use when applying Puppet code using the `apply` plan function or the `bolt apply` command.

- **Type:** Hash

#### `evaltrace`


Whether each resource should log when it is being evaluated. This allows you to interactively see exactly what is being done.

- **Type:** Boolean
- **Default:** `false`
#### `log_level`


The log level for logs in apply reports from Puppet. These can be seen in ApplyResults.

- **Type:** String
- **Available values:** `debug`, `info`, `notice`, `warning`, `err`, `alert`, `emerg`, `crit`
- **Default:** `notice`
#### `show_diff`


Whether to log and report a contextual diff.

- **Type:** Boolean
- **Default:** `false`
#### `trace`


Whether to print stack traces on some errors. Will print internal Ruby stack trace interleaved with Puppet function frames.

- **Type:** Boolean
- **Default:** `false`


```yaml
apply-settings:
  evaltrace: true
  log_level: debug
  show_diff: true
  trace: true
```
### `color`


Whether to use colored output when printing messages to the console.

- **Type:** Boolean
- **Default:** `true`


```yaml
color: false
```
### `compile-concurrency`


The maximum number of simultaneous manifest block compiles.

- **Type:** Integer
- **Default:** `Number of cores.`


```yaml
compile-concurrency: 5
```
### `concurrency`


The number of threads to use when executing on remote targets.

- **Type:** Integer
- **Default:** `100 or 1/7 the ulimit, whichever is lower.`


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
- **Default:** `human`


```yaml
format: json
```
### `future`


Enable new Bolt features that may include breaking changes.

- **Type:** Hash

#### ⛔ `file_paths`

_This option is deprecated._

Load scripts from the `scripts/` directory of a module.

- **Type:** Boolean
- **Default:** `false`
#### `script_interpreter`


Use a target's [`interpreters` configuration](bolt_transports_reference.md#interpreters) when running a script.

- **Type:** Boolean
- **Default:** `false`


```yaml
future:
  script_interpreter: true
```
### `hiera-config`


The path to the Hiera configuration file.

- **Type:** String
- **Default:** `project/hiera.yaml`


```yaml
hiera-config: "~/.puppetlabs/bolt/hiera.yaml"
```
### `log`


A map of configuration for the logfile output. Under `log`, you can configure log options for `console` and add configuration for individual log files, such as `~/.puppetlabs/bolt/debug.log`. Individual log files must be valid filepaths. If the log file does not exist, then Bolt will create it before logging information. Set the value to `disable` to remove a log file defined at an earlier level of the config hierarchy. By default, Bolt logs to a bolt-debug.log file in the Bolt project directory.

- **Type:** Hash

#### `append`


Whether to append output to an existing log file.

- **Type:** Boolean
- **Default:** `true`
#### `level`


The type of information to log.

- **Type:** String
- **Available values:** `trace`, `debug`, `error`, `info`, `warn`, `fatal`
- **Default:** `warn`


```yaml
log:
  console:
    level: info
  "~/logs/debug.log":
    append: false
    level: debug
```
### `modulepath`


An array of directories that Bolt loads content such as plans and tasks from. Read more about modules in [Module structure](module_structure.md).

- **Type:** Array, String
- **Default:** `["project/modules"]`


```yaml
modulepath:
- "~/.puppetlabs/bolt/modules"
- "~/.puppetlabs/bolt/site-modules"
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
### `modules`


A list of module dependencies for the project. Each dependency is a map of data specifying the module to install. To install the project's module dependencies, run the `bolt module install` command. For more information about specifying modules, see [the documentation](https://pup.pt/bolt-module-specs).

- **Type:** Array
- **Default:** `[]`


```yaml
modules:
- puppetlabs-facts
- name: puppetlabs-mysql
- name: puppetlabs-apache
  version_requirement: 5.5.0
- name: puppetlabs-puppetdb
  version_requirement: 7.x
- name: puppetlabs-firewall
  version_requirement: ">= 1.0.0 < 3.0.0"
- git: https://github.com/puppetlabs/puppetlabs-apt
  ref: 7.6.0
```
### `name`


The name of the Bolt project. When this option is configured, the project is considered a [Bolt project](projects.md), allowing Bolt to load content from the project directory as though it were a module.

- **Type:** String


```yaml
name: myproject
```
### `plans`


A list of plan names and glob patterns to filter the project's plans by. This option is used to limit the visibility of plans for users of the project. For example, project authors might want to limit the visibility of plans that are bundled with Bolt or plans that should only be run as part of another plan. When this option is not configured, all plans are visible. This option does not prevent users from running plans that are not part of this list.

- **Type:** Array


```yaml
plans:
- myproject
- myproject::foo
- myproject::bar
- myproject::deploy::*
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
### `policies`


A list of policy names and glob patterns to filter the project's policies by. This option is used to specify which policies are available to a project and can be applied to targets. When this option is not configured, policies are not available to the project and cannot be applied to targets.

- **Type:** Array


```yaml
policies:
- myproject::apache
- myproject::postgres
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
- **Default:** `60`
- **Pluggable:** true
#### `key`


The private key for the certificate.

- **Type:** String
- **Pluggable:** true
#### `read_timeout`


How long to wait in seconds for a response from PuppetDB.

- **Type:** Integer
- **Default:** `60`
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
### `rerunfile`


The path to the project's rerun file. The rerun file is used to store information about targets from the most recent run. Expands relative to the project directory.

- **Type:** String
- **Pluggable:** true


```yaml
rerunfile: "/Users/bolt/project/rerun.json"
```
### `save-rerun`


Whether to update `.rerun.json` in the Bolt project directory. If your target names include passwords, set this value to `false` to avoid writing passwords to disk.

- **Type:** Boolean
- **Default:** `true`


```yaml
save-rerun: false
```
### `spinner`


Whether to print a spinner to the console for long-running Bolt operations.

- **Type:** Boolean
- **Default:** `true`


```yaml
spinner: false
```
### `stream`


Whether to stream output from scripts and commands to the console. **This option is experimental**.

- **Type:** Boolean
- **Default:** `false`


```yaml
stream: true
```
### `tasks`


A list of task names and glob patterns to filter the project's tasks by. This option is used to limit the visibility of tasks for users of the project. For example, project authors might want to limit the visibility of tasks that are bundled with Bolt or plans that should only be run as part of a larger workflow. When this option is not configured, all tasks are visible. This option does not prevent users from running tasks that are not part of this list.

- **Type:** Array


```yaml
tasks:
- myproject
- myproject::foo
- myproject::bar
- myproject::deploy_*
```
### `trusted-external-command`


The path to an executable on the Bolt controller that can produce external trusted facts. **External trusted facts are experimental in both Puppet and Bolt and this API might change or be removed.**

- **Type:** String


```yaml
trusted-external-command: "/etc/puppetlabs/facts/trusted_external.sh"
```

## Example file

```yaml
# bolt-project.yaml
analytics: false
apply-settings:
  evaltrace: true
  log_level: debug
  show_diff: true
  trace: true
color: false
compile-concurrency: 5
concurrency: 50
disable-warnings:
- powershell_2
format: json
future:
  script_interpreter: true
hiera-config: "~/.puppetlabs/bolt/hiera.yaml"
log:
  console:
    level: info
  "~/logs/debug.log":
    append: false
    level: debug
modulepath:
- "~/.puppetlabs/bolt/modules"
- "~/.puppetlabs/bolt/site-modules"
module-install:
  forge:
    authorization_token: Bearer eyJhbGciOiJIUzI1NiIsInR5c...
    baseurl: https://forge.example.com
    proxy: https://my-forge-proxy.com:8080
  proxy: https://my-proxy.com:8080
modules:
- puppetlabs-facts
- name: puppetlabs-mysql
- name: puppetlabs-apache
  version_requirement: 5.5.0
- name: puppetlabs-puppetdb
  version_requirement: 7.x
- name: puppetlabs-firewall
  version_requirement: ">= 1.0.0 < 3.0.0"
- git: https://github.com/puppetlabs/puppetlabs-apt
  ref: 7.6.0
name: myproject
plans:
- myproject
- myproject::foo
- myproject::bar
- myproject::deploy::*
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
policies:
- myproject::apache
- myproject::postgres
puppetdb:
  cacert: "/etc/puppetlabs/puppet/ssl/certs/ca.pem"
  cert: "/etc/puppetlabs/puppet/ssl/certs/my-host.example.com.pem"
  connect_timeout: 120
  key: "/etc/puppetlabs/puppet/ssl/private_keys/my-host.example.com.pem"
  read_timeout: 120
  server_urls:
  - https://puppet.example.com:8081
  token: "~/.puppetlabs/token"
rerunfile: "/Users/bolt/project/rerun.json"
save-rerun: false
spinner: false
stream: true
tasks:
- myproject
- myproject::foo
- myproject::bar
- myproject::deploy_*
trusted-external-command: "/etc/puppetlabs/facts/trusted_external.sh"
```

📖 **Related information**  

- [Bolt projects](projects.md)

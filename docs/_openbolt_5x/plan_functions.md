---
title: Plan functions
layout: default
---
# Plan functions

Plans can use functions that are built into Bolt and Puppet, or custom
functions included in modules. This reference
page includes a list of built-in Bolt functions. To see a list of built-in
Puppet functions, see Puppet's [built-in function
reference](https://puppet.com/docs/puppet/latest/function.html). To learn how
to write custom Puppet functions, see [the Puppet documentation on writing
functions](https://puppet.com/docs/puppet/latest/writing_custom_functions.html).


## `add_facts`

Deep merges a hash of facts with the existing facts on a target.

> **Note:** Not available in apply block


```
add_facts($target, $facts) => Target
```

This function returns
an object with the type `Target` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | A target. |
| `facts` | `Hash` | A hash of fact names to values that can include structured facts. |



**Example usage**

Adding facts to a target
```
add_facts($target, { 'os' => { 'family' => 'windows', 'name' => 'windows' } })
```

## `add_to_group`

Adds a target to specified inventory group.

> **Note:** Not available in apply block


```
add_to_group($targets, $group) => Array[Target]
```

This function returns
an object with the type `Array[Target]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `targets` | `TargetSpec` | A pattern or array of patterns identifying a set of targets. |
| `group` | `String[1]` | The name of the group to add targets to. |



**Example usage**

Add new Target to group.
```
Target.new('foo@example.com', 'password' => 'secret').add_to_group('group1')
```
Add new target to group by name.
```
add_to_group('bolt:bolt@web.com', 'group1')
```
Add an array of targets to group by name.
```
add_to_group(['host1', 'group1', 'winrm://host2:54321'], 'group1')
```
Add a comma separated list list of targets to group by name.
```
add_to_group('foo,bar,baz', 'group1')
```

## `apply`

Applies a block of manifest code to the targets.

Applying manifest code requires facts to compile a catalog. Targets must also have the Puppet agent package installed to apply manifest code. To prep targets for an apply, call the [apply_prep](#apply-prep) function before the apply function.

To learn more about applying manifest code from a plan, see [Applying manifest blocks from a Puppet plan](applying_manifest_blocks.md#applying-manifest-blocks-from-a-puppet-plan).

> **Note:** The `apply` function returns a `ResultSet` object containing `ApplyResult`
> objects.


```
apply($targets, $options, &block) => ResultSet
```

This function returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `targets` | `TargetSpec` | The targets to apply the Puppet code to. |
| `options` | `Optional[Hash]` | A hash of additional options. |
| `&block` | `Callable` | The manifest code to apply to the targets. |


This function accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | When `true`, returns a `ResultSet` including failed results, rather than failing the plan. |
| `_description` | `String` | Adds a description to the apply block, allowing you to distinguish apply blocks. |
| `_noop` | `Boolean` | When `true`, applies the manifest block in Puppet no-operation mode, returning a report of the changes it would make while taking no action. |
| `_puppetdb` | `String` | The named PuppetDB instance to connect to when making PuppetDB queries during catalog compilation. |
| `_run_as` | `String` | The user to apply the manifest block as. Only available for transports that support the `run-as` option. |


**Example usage**

Apply manifest code, logging the provided description.
```
apply($targets, '_description' => 'Install Docker') {
  include 'docker'
}
```
Apply manifest code as another user, catching any errors.
```
$apply_results = apply($targets, '_catch_errors' => true, '_run_as' => 'bolt') {
  file { '/etc/puppetlabs':
    ensure => present
  }
}
```

## `apply_prep`

Installs the `puppet-agent` package on targets if needed, then collects facts,
including any custom facts found in Bolt's module path. The package is
installed using either the configured plugin or the `task` plugin with the
`puppet_agent::install` task.

Agent installation will be skipped if the target includes the `puppet-agent`
feature, either as a property of its transport (PCP) or by explicitly setting
it as a feature in Bolt's inventory.

> **Note:** Not available in apply block


```
apply_prep($targets, $options) => Bolt::ResultSet
```

This function returns
an object with the type `Bolt::ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `targets` | `TargetSpec` | A pattern or array of patterns identifying a set of targets. |
| `options` | `Optional[Hash[String, Data]]` | Options hash. |


This function accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_required_modules` | `Array` | An array of modules to sync to the target. |
| `_run_as` | `String` | User to run as using privilege escalation. |


**Example usage**

Prepare targets by name.
```
apply_prep('target1,target2')
```

## `background`

Starts a block of code in parallel with the main plan without blocking.
Returns a Future object.

> **Note:** Not available in apply block


```
background($name, &block) => Future
```

This function returns
an object with the type `Future` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | `Optional[String[1]]` | An optional name for legible logs. |
| `&block` | `Callable[0, 0]` | The code block to run in the background. |



**Example usage**

Start a long-running process
```
background() || {
  run_task('superlong::task', $targets)
}
run_command("echo 'Continue immediately'", $targets)
```

## `catch_errors`

Catches errors in a given block and returns them. This will return the
output of the block if no errors are raised. Accepts an optional list of
error kinds to catch.

> **Note:** Not available in apply block


```
catch_errors($error_types, &block) => Any
```

This function returns
an object with the type `Any` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `error_types` | `Optional[Array[String[1]]]` | An array of error types to catch |
| `&block` | `Callable[0, 0]` | The block of steps to catch errors on |



**Example usage**

Catch errors for a block
```
catch_errors() || {
  run_command("whoami", $targets)
  run_command("adduser ryan", $targets)
}
```
Catch parse errors for a block of code
```
catch_errors(['bolt/parse-error']) || {
 run_plan('canary', $targets)
 run_plan('other_plan)
 apply($targets) || {
   notify { "Hello": }
 }
}
```

## `ctrl::do_until`

Repeat the block until it returns a truthy value. Returns the value.


```
ctrl::do_until($options, &block) => Any
```

This function returns
an object with the type `Any` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |
| `&block` | `Callable` | The code block to repeat. |


This function accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `limit` | `Numeric` | The number of times to repeat the block. |
| `interval` | `Numeric` | The number of seconds to wait before repeating the block. |


**Example usage**

Run a task until it succeeds
```
ctrl::do_until() || {
  run_task('test', $target, '_catch_errors' => true).ok()
}
```
Run a task until it succeeds or fails 10 times
```
ctrl::do_until('limit' => 10) || {
  run_task('test', $target, '_catch_errors' => true).ok()
}
```
Run a task and wait 10 seconds before running it again
```
ctrl::do_until('interval' => 10) || {
  run_task('test', $target, '_catch_errors' => true).ok()
}
```

## `ctrl::sleep`

Sleeps for specified number of seconds.


```
ctrl::sleep($period) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `period` | `Numeric` | Time to sleep (in seconds) |



**Example usage**

Sleep for 5 seconds
```
ctrl::sleep(5)
```

## `dir::children`

Returns an array containing all of the filenames except for "." and ".." in the given directory.


```
dir::children($dirname) => Array
```

This function returns
an object with the type `Array` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `dirname` | `String` | Absolute path or Puppet module name. |



**Example usage**

List filenames from an absolute path.
```
dir::children('/home/user/subdir/')
```
List filenames from a Puppet file path.
```
dir::children('puppet_agent')
```

## `download_file`

Downloads the given file or directory from the given set of targets and saves it to a directory
matching the target's name under the given destination directory. Returns the result from each
download. This does nothing if the list of targets is empty.

> **Note:** Existing content in the destination directory is deleted before downloading from
> the targets.

> **Note:** Not available in apply block

**Download a file or directory**


```
download_file($source, $destination, $targets, $options) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `source` | `String[1]` | The absolute path to the file or directory on the target(s). |
| `destination` | `String[1]` | The relative path to the destination directory on the local system. Expands relative to `<project>/downloads/`. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |

**Download a file or directory, logging the provided description**


```
download_file($source, $destination, $targets, $description, $options) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `source` | `String[1]` | The absolute path to the file or directory on the target(s). |
| `destination` | `String[1]` | The relative path to the destination directory on the local system. Expands relative to `<project>/downloads/`. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `description` | `String` | A description to be output when calling this function. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |


**Example usage**

Download a file from multiple Linux targets to a destination directory
```
download_file('/etc/ssh/ssh_config', '~/Downloads', $targets)
```
Download a directory from multiple Linux targets to a project downloads directory
```
download_file('/etc/ssh', 'ssh', $targets)
```
Download a file from multiple Linux targets and compare its contents to a local file
```
$results = download_file($source, $destination, $targets)

$local_content = file::read($source)

$mismatched_files = $results.filter |$result| {
  $remote_content = file::read($result['path'])
  $remote_content == $local_content
}
```
Download a file from multiple Linux targets to a destination directory
```
download_file('/etc/ssh/ssh_config', '~/Downloads', $targets, 'Downloading remote SSH config')
```

## `facts`

Returns the facts hash for a target.

Using the `facts` function does not automatically collect facts for a target,
and will only return facts that are currently set in the inventory. To collect
facts from a target and set them in the inventory, run the
[facts](writing_plans.md#collect-facts-from-targets) plan or
[puppetdb_fact](writing_plans.md#collect-facts-from-puppetdb) plan.


```
facts($target) => Hash[String, Data]
```

This function returns
an object with the type `Hash[String, Data]` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | A target. |



**Example usage**

Getting facts
```
facts($target)
```

## `fail_plan`

Raises a `Bolt::PlanFailure` exception to signal to callers that the plan failed.

Plan authors should call this function when their plan is not successful. The
error may then be caught by another plans `run_plan` function or in Bolt itself

> **Note:** Not available in apply block

**Fail a plan, generating an exception from the parameters**


```
fail_plan($msg, $kind, $details, $issue_code) => Any
```

This function signature returns
an object with the type `Any` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `msg` | `String[1]` | An error message. |
| `kind` | `Optional[String[1]]` | An easily matchable error kind. |
| `details` | `Optional[Hash[String[1], Any]]` | Machine-parseable details about the error. |
| `issue_code` | `Optional[String[1]]` | Unused. |


**Fail a plan, generating an exception from an existing Error object**


```
fail_plan($error) => Any
```

This function signature returns
an object with the type `Any` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `error` | `Error` | An error object. |



**Example usage**

Raise an exception
```
fail_plan('We goofed up', 'task-unexpected-result', { 'result' => 'null' })
```
Raise an exception
```
fail_plan(Error('We goofed up', 'task-unexpected-result', { 'result' => 'null' }))
```

## `file::delete`

Delete a file on localhost using ruby's `File.delete`. This will only delete
files on the machine you run Bolt on.


```
file::delete($filename) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `filename` | `String[1]` | Absolute path. |



**Example usage**

Delete a file from disk
```
file::delete('C:/Users/me/report')
```

## `file::exists`

Check if a local file exists using Puppet's
`Puppet::Parser::Files.find_file()` function. This will only check files that
are on the machine Bolt is run on.


```
file::exists($filename) => Boolean
```

This function returns
an object with the type `Boolean` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `filename` | `String[1]` | Absolute path or Puppet file path. |



**Example usage**

Check a file on disk
```
file::exists('/tmp/i_dumped_this_here')
```
check a file from the modulepath
```
file::exists('example/VERSION')
```

## `file::join`

Join file paths using ruby's `File.join()` function.


```
file::join($*paths) => String
```

This function returns
an object with the type `String` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `*paths` | `String` | The paths to join. |



**Example usage**

Join file paths
```
file::join('./path', 'to/files')
```

## `file::read`

Read a file on localhost and return its contents using ruby's `File.read`. This will
only read files on the machine you run Bolt on.


```
file::read($filename) => String
```

This function returns
an object with the type `String` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `filename` | `String[1]` | Absolute path or Puppet file path. |



**Example usage**

Read a file from disk
```
file::read('/tmp/i_dumped_this_here')
```
Read a file from the modulepath
```
file::read('example/VERSION')
```

## `file::readable`

Check if a local file is readable using Puppet's
`Puppet::Parser::Files.find_file()` function. This will only check files on the
machine you run Bolt on.


```
file::readable($filename) => Boolean
```

This function returns
an object with the type `Boolean` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `filename` | `String[1]` | Absolute path or Puppet file path. |



**Example usage**

Check a file on disk
```
file::readable('/tmp/i_dumped_this_here')
```
check a file from the modulepath
```
file::readable('example/VERSION')
```

## `file::write`

Write a string to a file on localhost using ruby's `File.write`. This will
only write files to the machine you run Bolt on. Use `write_file()` to write
to remote targets.


```
file::write($filename, $content) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `filename` | `String` | Absolute path. |
| `content` | `String` | File content to write. |



**Example usage**

Write a file to disk
```
file::write('C:/Users/me/report', $apply_result.first.report)
```

## `get_resources`

Query the state of resources on a list of targets using resource definitions in Bolt's module path.
The results are returned as a list of hashes representing each resource.

Requires the Puppet Agent be installed on the target, which can be accomplished with apply_prep
or by directly running the `puppet_agent::install` task. In order to be able to reference types without
string quoting (for example `get_resources($target, Package)` instead of `get_resources($target, 'Package')`),
run the command `bolt puppetfile generate-types` to generate type references in `$Boldir/.resource_types`.

> **Note:** Not available in apply block


```
get_resources($targets, $resources) => ResultSet
```

This function returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `targets` | `TargetSpec` | A pattern or array of patterns identifying a set of targets. |
| `resources` | `Variant[String, Type[Resource], Array[Variant[String, Type[Resource]]]]` | A resource type or instance, or an array of such. |



**Example usage**

Collect resource states for packages and a file
```
get_resources('target1,target2', [Package, File[/etc/puppetlabs]])
```

## `get_target`

Get a single target from inventory if it exists, otherwise create a new Target.

> **Note:** Calling `get_target('all')` returns an empty array.


```
get_target($name) => Target
```

This function returns
an object with the type `Target` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | `TargetSpec` | A Target name. |



**Example usage**

Create a new Target from a URI
```
get_target('winrm://host2:54321')
```
Get an existing Target from inventory
```
get_target('existing-target')
```

## `get_targets`

Parses common ways of referring to targets and returns an array of Targets.

> **Note:** Not available in apply block


```
get_targets($names) => Array[Target]
```

This function returns
an object with the type `Array[Target]` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `names` | `TargetSpec` | A pattern or array of patterns identifying a set of targets. |



**Example usage**

Resolve a group
```
get_targets('group1')
```
Resolve a target URI
```
get_targets('winrm://host2:54321')
```
Resolve array of groups and/or target URIs
```
get_targets(['host1', 'group1', 'winrm://host2:54321'])
```
Resolve string consisting of a comma-separated list of groups and/or target URIs
```
get_targets('host1,group1,winrm://host2:54321')
```
Run on localhost
```
get_targets('localhost')
```

## `log::debug`

Log a debugging message.

Messages logged at this level typically include detailed information about
what a plan is doing. For example, you might log a message at the `debug`
level that shows what value is returned from a function invocation.

See [Logs](logs.md) for more information about Bolt's log levels.

> **Note:** Not available in apply block


```
log::debug($message) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `Any` | The message to log. |



**Example usage**

Log a debugging message
```
log::debug("Function frogsay returned: ${result}")
```

## `log::error`

Log an error message.

Messages logged at this level typically indicate that the plan encountered an
error that can be recovered from. For example, you might log a message at the
`error` level if you want to inform the user an action running on a target
failed but that the plan will continue running.

See [Logs](logs.md) for more information about Bolt's log levels.

> **Note:** Not available in apply block


```
log::error($message) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `Any` | The message to log. |



**Example usage**

Log an error message
```
log::error("The HTTP request returned an error, continuing the plan: ${result}")
```

## `log::fatal`

Log a fatal message.

Messages logged at this level indicate that the plan encountered an error that
could not be recovered from. For example, you might log a message at the
`fatal` level if a service is unavailable and the plan cannot continue running
without it.

See [Logs](logs.md) for more information about Bolt's log levels.

> **Note:** Not available in apply block


```
log::fatal($message) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `Any` | The message to log. |



**Example usage**

Log a fatal message
```
log::fatal("The service is unavailable, unable to continue running: ${result}")
```

## `log::info`

Log an info message.

Messages logged at this level typically include high-level information about
what a plan is doing. For example, you might log a message at the `info` level
that informs users that the plan is reading a file on disk.

See [Logs](logs.md) for more information about Bolt's log levels.

> **Note:** Not available in apply block


```
log::info($message) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `Any` | The message to log. |



**Example usage**

Log an info message
```
log::info("Reading network device command file ${file}.")
```

## `log::trace`

Log a trace message.

Messages logged at this level typically include the most detailed information
about what a plan is doing. For example, you might log a message at the `trace`
level that describes how a plan is manipulating data.

See [Logs](logs.md) for more information about Bolt's log levels.

> **Note:** Not available in apply block


```
log::trace($message) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `Any` | The message to log. |



**Example usage**

Log a trace message
```
log::trace("Creating Target object with data ${data} from file ${file}")
```

## `log::warn`

Log a warning message.

Messages logged at this level typically include messages about deprecated
behavior or potentially harmful situations that might affect the plan run.
For example, you might log a message at the `warn` level if you are
planning to make a breaking change to your plan in a future release and
want to notify users.

See [Logs](logs.md) for more information about Bolt's log levels.

> **Note:** Not available in apply block


```
log::warn($message) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `Any` | The message to log. |



**Example usage**

Log a warning message
```
log::warn('This plan will no longer install the package in a future release.')
```

## `out::message`

Output a message for the user.

This will print a message to stdout when using the human output format,
and print to stderr when using the json output format. Messages are
also logged at the `info` level. For more information about logs, see
[Logs](logs.md).

> **Note:** Not available in apply block


```
out::message($message) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `Any` | The message to output. |



**Example usage**

Print a message
```
out::message('Something went wrong')
```

## `out::verbose`

Output a message for the user when running in verbose mode.

This will print a message to stdout when using the human output format,
and print to stderr when using the json output format. Messages are
also logged at the `debug` level. For more information about logs, see
[Logs](logs.md).

> **Note:** Not available in apply block


```
out::verbose($message) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `message` | `Any` | The message to output. |



**Example usage**

Print a message
```
out::verbose('Something went wrong')
```

## `parallelize`

Map a code block onto an array, where each array element executes in parallel.
This function is experimental.

> **Note:** Not available in apply block.


```
parallelize($data, &block) => Array[PlanResult]
```

This function returns
an object with the type `Array[PlanResult]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `data` | `Array[Any]` | The array to apply the block to. |
| `&block` | `Callable[Any]` | The code block to execute for each array element. |



**Example usage**

Execute two tasks on two targets.
```
$targets = get_targets(["host1", "host2"])
$result = parallelize ($targets) |$t| {
  run_task('a', $t)
  run_task('b', $t)
}
```

## `prompt`

Display a prompt and wait for a response.

> **Note:** Not available in apply block


```
prompt($prompt, $options) => Variant[String, Sensitive]
```

This function returns
an object with the type `Variant[String, Sensitive]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `prompt` | `String` | The prompt to display. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `sensitive` | `Boolean` | Disable echo back and mark the response as sensitive. The returned value will be wrapped by the `Sensitive` data type. To access the raw value, use the `unwrap` function (i.e. `$sensitive_value.unwrap`). |
| `default` | `String` | The default value to return if the user does not provide input or if stdin is not a tty. |


**Example usage**

Prompt the user if plan execution should continue
```
$response = prompt('Continue executing plan? [Y\N]')
```
Prompt the user for sensitive information
```
$password = prompt('Enter your password', 'sensitive' => true)
out::message("Password is: ${password.unwrap}")
```
Prompt the user and provide a default value
```
$user = prompt('Enter your login username', 'default' => 'root')
```
Prompt the user for sensitive information, returning a sensitive default if one is not provided
```
$token = prompt('Enter token', 'default' => lookup('default_token'), 'sensitive' => true)
out::message("Token is: ${token.unwrap}")
```
Prompt the user and fail with a custom message if no input was provided
```
$response = prompt('Enter your name', 'default' => '')
if $response.empty {
  fail_plan('Must provide your name')
}
```

## `prompt::menu`

Display a menu prompt and wait for a response. Continues to prompt
until an option from the menu is selected.

> **Note:** Not available in apply block

**Select from a list of options**


```
prompt::menu($prompt, $menu, $options) => Variant[Target, Data]
```

This function signature returns
an object with the type `Variant[Target, Data]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `prompt` | `String` | The prompt to display. |
| `menu` | `Array[Variant[Target, Data]]` | A list of options to choose from. |
| `options` | `Optional[Hash[String[1], Variant[Target, Data]]]` | A hash of additional options. |


This function signature accepts the following option:

| Option | Type | Description |
| --- | --- | --- |
| `default` | `String` | The default option to return if the user does not provide input or if standard in (stdin) is not a tty. Must be an option present in the menu. |

**Select from a list of options with custom inputs**


```
prompt::menu($prompt, $menu, $options) => Variant[TargetSpec, Data]
```

This function signature returns
an object with the type `Variant[TargetSpec, Data]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `prompt` | `String` | The prompt to display. |
| `menu` | `Hash[String[1], Variant[Target, Data]]` | A hash of options to choose from, where keys are the input used to select a value. |
| `options` | `Optional[Hash[String[1], Variant[Target, Data]]]` | A hash of additional options. |


This function signature accepts the following option:

| Option | Type | Description |
| --- | --- | --- |
| `default` | `String` | The default option to return if the user does not provide input or if standard in (stdin) is not a tty. Must be an option present in the menu. |


**Example usage**

Prompt the user to select from a list of options
```
$selection = prompt::menu('Select a fruit', ['apple', 'banana', 'carrot'])
```
Prompt the user to select from a list of options with a default value
```
$selection = prompt::menu('Select environment', ['development', 'production'], 'default' => 'development')
```
Prompt the user to select from a list of options with custom inputs
```
$menu = { 'y' => 'yes', 'n' => 'no' }
$selection = prompt::menu('Install Puppet?', $menu)
```

## `puppetdb_command`

Send a command with a payload to PuppetDB.

The `pdb_command` function only supports version 5 of the `replace_facts`
command. Other commands might also work, but are not tested or supported
by Bolt.

See the [commands endpoint](https://puppet.com/docs/puppetdb/latest/api/command/v1/commands.html)
documentation for more information about available commands and payload
format.

_This function is experimental and subject to change._

> **Note:** Not available in apply block

**Send a command with a payload to PuppetDB**


```
puppetdb_command($command, $version, $payload) => String
```

This function signature returns
an object with the type `String` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `command` | `String[1]` | The command to invoke. |
| `version` | `Integer` | The version of the command to invoke. |
| `payload` | `Hash[Data, Data]` | The payload to the command. |


**Send a command with a payload to a named PuppetDB instance**


```
puppetdb_command($command, $version, $payload, $instance) => String
```

This function signature returns
an object with the type `String` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `command` | `String[1]` | The command to invoke. |
| `version` | `Integer` | The version of the command to invoke. |
| `payload` | `Hash[Data, Data]` | The payload to the command. |
| `instance` | `String` | The PuppetDB instance to send the command to. |



**Example usage**

Replace facts for a target
```
$payload = {
  'certname'           => 'localhost',
  'environment'        => 'dev',
  'producer'           => 'bolt',
  'producer_timestamp' => '1970-01-01',
  'values'             => { 'orchestrator' => 'bolt' }
}

puppetdb_command('replace_facts', 5, $payload)
```
Replace facts for a target using a named PuppetDB instance
```
$payload = {
  'certname'           => 'localhost',
  'environment'        => 'dev',
  'producer'           => 'bolt',
  'producer_timestamp' => '1970-01-01',
  'values'             => { 'orchestrator' => 'bolt' }
}

puppetdb_command('replace_facts', 5, $payload, 'instance-1')
```

## `puppetdb_fact`

Collects facts based on a list of certnames.

If a node is not found in PuppetDB, it's included in the returned hash with an empty facts hash.
Otherwise, the node is included in the hash with a value that is a hash of its facts.

**Collect facts from PuppetDB**


```
puppetdb_fact($certnames) => Hash[String, Data]
```

This function signature returns
an object with the type `Hash[String, Data]` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `certnames` | `Array[String]` | Array of certnames. |


**Collects facts from a named PuppetDB instance**


```
puppetdb_fact($certnames, $instance) => Hash[String, Data]
```

This function signature returns
an object with the type `Hash[String, Data]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `certnames` | `Array[String]` | Array of certnames. |
| `instance` | `String` | The PuppetDB instance to query. |



**Example usage**

Get facts for nodes
```
puppetdb_fact(['app.example.com', 'db.example.com'])
```
Get facts for nodes from a named PuppetDB instance
```
puppetdb_fact(['app.example.com', 'db.example.com'], 'instance-1')
```

## `puppetdb_query`

Makes a query to [puppetdb](https://puppet.com/docs/puppetdb/latest/index.html)
using Bolt's PuppetDB client.

**rubocop:disable Layout/LineLength**
Make a query to PuppetDB.

rubocop:enable Layout/LineLength

```
puppetdb_query($query) => Array[Data]
```

This function signature returns
an object with the type `Array[Data]` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `query` | `Variant[String, Array[Data]]` | A PQL query. Learn more about [Puppet's query language](https://puppet.com/docs/puppetdb/latest/api/query/tutorial-pql.html), PQL. |


**rubocop:disable Layout/LineLength**
Make a query to a named PuppetDB instance.

rubocop:enable Layout/LineLength

```
puppetdb_query($query, $instance) => Array[Data]
```

This function signature returns
an object with the type `Array[Data]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `query` | `Variant[String, Array[Data]]` | A PQL query. Learn more about [Puppet's query language](https://puppet.com/docs/puppetdb/latest/api/query/tutorial-pql.html), PQL. |
| `instance` | `String` | The PuppetDB instance to query. |



**Example usage**

Request certnames for all nodes
```
puppetdb_query('nodes[certname] {}')
```
Request certnames for all nodes using a named PuppetDB instance
```
puppetdb_query('nodes[certname] {}', 'instance-1')
```

## `remove_from_group`

Removes a target from the specified inventory group.

The target is removed from all child groups and all parent groups where the target has
not been explicitly defined. A target cannot be removed from the `all` group.

> **Note:** Not available in apply block


```
remove_from_group($target, $group) => nil
```

This function returns
an object with the type `nil` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `TargetSpec` | A pattern identifying a single target. |
| `group` | `String[1]` | The name of the group to remove the target from. |



**Example usage**

Remove Target from group.
```
remove_from_group('foo@example.com', 'group1')
```
Remove failing Targets from the rest of a plan
```
$result = run_command(uptime, my_group, '_catch_errors' => true)
$result.error_set.targets.each |$t| { remove_from_group($t, my_group) }
run_command(next_command, my_group) # does not target the failing nodes.
```

## `resolve_references`

Evaluates all `_plugin` references in a hash and returns the resolved reference data.


```
resolve_references($references) => Data
```

This function returns
an object with the type `Data` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `references` | `Data` | A hash of reference data to resolve. |



**Example usage**

Resolve a hash of reference data
```
$references = {
  "targets" => [
    "_plugin" => "terraform",
    "dir" => "path/to/terraform/project",
    "resource_type" => "aws_instance.web",
    "uri" => "public_ip"
  ]
}

resolve_references($references)
```

## `resource`

Lookup a resource in the target's data.

For more information about resources see [the
documentation](https://puppet.com/docs/puppet/latest/lang_resources.html).

> **Note:** The `ResourceInstance` data type is under active development and is subject to
  change. You can read more about the data type in the [experimental features
  documentation](experimental_features.md#resourceinstance-data-type).

**Lookup a resource in the target's data**


```
resource($target, $type, $title) => Optional[ResourceInstance]
```

This function signature returns
an object with the type `Optional[ResourceInstance]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | The Target object to add resources to. See [`get_targets`](#get_targets). |
| `type` | `Type[Resource]` | The type of the resource |
| `title` | `String[1]` | The title of the resource |


**Lookup a resource in the target's data, referring to resource as a string**


```
resource($target, $type, $title) => Optional[ResourceInstance]
```

This function signature returns
an object with the type `Optional[ResourceInstance]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | The Target object to add resources to. See [`get_targets`](#get_targets). |
| `type` | `String[1]` | The type of the resource |
| `title` | `String[1]` | The title of the resource |



**Example usage**

Get the openssl package resource
```
$target.apply_prep
$resources = $target.get_resources(Package).first['resources']
$target.set_resources($resources)
$openssl = $target.resource('Package', 'openssl')
```

## `run_command`

Runs a command on the given set of targets and returns the result from each command execution.
This function does nothing if the list of targets is empty.

> **Note:** Not available in apply block

**Run a command**


```
run_command($command, $targets, $options) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `command` | `String[1]` | A command to run on target. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |
| `_env_vars` | `Hash[String, Any]` | Map of environment variables to set |

**Run a command, logging the provided description**


```
run_command($command, $targets, $description, $options) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `command` | `String[1]` | A command to run on target. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `description` | `String` | A description to be output when calling this function. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |
| `_env_vars` | `Hash[String, Any]` | Map of environment variables to set |


**Example usage**

Run a command on targets
```
run_command('hostname', $targets, '_catch_errors' => true)
```
Run a command on targets
```
run_command('hostname', $targets, 'Get hostname')
```

## `run_container`

Run a container and return its output to stdout and stderr.

> **Note:** Not available in apply block


```
run_container($image, $options) => ContainerResult
```

This function returns
an object with the type `ContainerResult` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `image` | `String[1]` | The name of the image to run. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `cmd` | `String` | A command to run in the container. |
| `env_vars` | `Hash[String, Data]` | Map of environment variables to set. |
| `ports` | `Hash[Integer, Integer]` | A map of container ports to publish. Keys are the host port, values are the corresponding container port. |
| `rm` | `Boolean` | Whether to remove the container once it exits. |
| `volumes` | `Hash[String, String]` | A map of absolute paths on the host to absolute paths on the remote to mount. |
| `workdir` | `String` | The working directory within the container. |


**Example usage**

Run Nginx proxy manager
```
run_container('jc21/nginx-proxy-manager', 'ports' => { 80 => 80, 81 => 81, 443 => 443 })
```

## `run_plan`

Runs the `plan` referenced by its name. A plan is autoloaded from `$MODULEROOT/plans`.

> **Note:** Not available in apply block

**Run a plan**


```
run_plan($plan_name, $args) => PlanResult
```

This function signature returns
an object with the type `PlanResult` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `plan_name` | `String` | The plan to run. |
| `args` | `Optional[Hash]` | A hash of arguments to the plan. Can also include additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. This option sets the [run-as user](privilege_escalation.md) for all targets whenever Bolt connects to a target. This is set for all functions in the called plan, including `run_plan()`. |

**Run a plan, specifying `$nodes` or `$targets` as a positional argument**

> **Note:** When running a plan with both a `$nodes` and `$targets` parameter, and using the second
positional argument, the plan will fail.

```
run_plan($plan_name, $targets, $args) => PlanResult
```

This function signature returns
an object with the type `PlanResult` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `plan_name` | `String` | The plan to run. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `args` | `Optional[Hash]` | A hash of arguments to the plan. Can also include additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. This option sets the [run-as user](privilege_escalation.md) for all targets whenever Bolt connects to a target. This is set for all functions in the called plan, including `run_plan()`. |


**Example usage**

Run a plan
```
run_plan('canary', 'command' => 'false', 'targets' => $targets, '_catch_errors' => true)
```
Run a plan
```
run_plan('canary', $targets, 'command' => 'false')
```

## `run_script`

Uploads the given script to the given set of targets and returns the result of having each target execute the script.
This function does nothing if the list of targets is empty.

> **Note:** Not available in apply block

**Run a script**


```
run_script($script, $targets, $options) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `script` | `String[1]` | Path to a script to run on target. Can be an absolute path or a modulename/filename selector for a file in $MODULEROOT/files. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `arguments` | `Array[String]` | An array of arguments to be passed to the script. Cannot be used with `pwsh_params`. |
| `pwsh_params` | `Hash` | Map of named parameters to pass to a PowerShell script. Cannot be used with `arguments`. |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |
| `_env_vars` | `Hash[String, Any]` | Map of environment variables to set. |

**Run a script, logging the provided description**


```
run_script($script, $targets, $description, $options) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `script` | `String[1]` | Path to a script to run on target. Can be an absolute path or a modulename/filename selector for a file in $MODULEROOT/files. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `description` | `String` | A description to be output when calling this function. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `arguments` | `Array[String]` | An array of arguments to be passed to the script. Cannot be used with `pwsh_params`. |
| `pwsh_params` | `Hash` | Map of named parameters to pass to a PowerShell script. Cannot be used with `arguments`. |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |
| `_env_vars` | `Hash[String, Any]` | Map of environment variables to set. |


**Example usage**

Run a local script on Linux targets as 'root'
```
run_script('/var/tmp/myscript', $targets, '_run_as' => 'root')
```
Run a module-provided script with arguments
```
run_script('iis/setup.ps1', $target, 'arguments' => ['/u', 'Administrator'])
```
Pass named parameters to a PowerShell script
```
run_script('iis/setup.ps1', $target, 'pwsh_params' => { 'User' => 'Administrator' })
```
Run a script
```
run_script('/var/tmp/myscript', $targets, 'Downloading my application')
```

## `run_task`

Runs a given instance of a `Task` on the given set of targets and returns the result from each.
This function does nothing if the list of targets is empty.

> **Note:** Not available in apply block

**Run a task**


```
run_task($task_name, $targets, $args) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `task_name` | `String[1]` | The task to run. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `args` | `Optional[Hash[String[1], Any]]` | A hash of arguments to the task. Can also include additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |
| `_noop` | `Boolean` | Run the task in noop mode if available. |

**Run a task, logging the provided description**


```
run_task($task_name, $targets, $description, $args) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `task_name` | `String[1]` | The task to run. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `description` | `Optional[String]` | A description to be output when calling this function. |
| `args` | `Optional[Hash[String[1], Any]]` | A hash of arguments to the task. Can also include additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |
| `_noop` | `Boolean` | Run the task in noop mode if available. |


**Example usage**

Run a task as root
```
run_task('facts', $targets, '_run_as' => 'root')
```
Run a task
```
run_task('facts', $targets, 'Gather OS facts')
```

## `run_task_with`

Runs a given instance of a `Task` with target-specific parameters on the given set of targets and
returns the result from each. This function differs from [`run_task`](#run_task) by accepting a block that returns
a `Hash` of target-specific parameters that are passed to the task. This can be used to send parameters
based on a target's attributes, such as its `facts`, or to use conditional logic to determine the
parameters a task should receive for a specific target.

This function does nothing if the list of targets is empty.

> **Note:** Not available in apply block

> **Note:** Not available to targets using the pcp transport

**Run a task with target-specific parameters**


```
run_task_with($task_name, $targets, $options, &block) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `task_name` | `String[1]` | The task to run. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |
| `&block` | `Callable[Target]` | A block that returns a `Hash` of target-specific parameters for the task. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_noop` | `Boolean` | Run the task in noop mode if available. |
| `_run_as` | `String` | User to run as using privilege escalation. |

**Run a task with target-specific parameters, logging the provided description**


```
run_task_with($task_name, $targets, $description, $options, &block) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `task_name` | `String[1]` | The task to run. |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `description` | `Optional[String]` | A description to be output when calling this function. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |
| `&block` | `Callable[Target]` | A block that returns a `Hash` of target-specific parameters for the task. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_noop` | `Boolean` | Run the task in noop mode if available. |
| `_run_as` | `String` | User to run as using privilege escalation. |


**Example usage**

Run a task with target-specific parameters as root
```
run_task_with('my_task', $targets, '_run_as' => 'root') |$t| {
  { 'param1' => $t.vars['var1'],
    'param2' => $t.vars['var2'] }
}
```
Run a task with target-specific parameters and a description
```
run_task_with('my_task', $targets, 'Update system packages') |$t| {
  { 'param1' => $t.vars['var1'],
    'param2' => $t.vars['var2'] }
}
```

## `set_config`

Set configuration options on a target.

> **Note:** Not available in apply block

> **Note:** Only compatible with inventory v2


```
set_config($target, $key_or_key_path, $value) => Target
```

This function returns
an object with the type `Target` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | The Target object to configure. See [`get_targets`](#get_targets). |
| `key_or_key_path` | `Variant[String, Array[String]]` | The configuration setting to update. |
| `value` | `Any` | The configuration value |



**Example usage**

Set the transport for a target
```
set_config($target, 'transport', 'ssh')
```
Set the ssh password
```
set_config($target, ['ssh', 'password'], 'secret')
```
Overwrite ssh config
```
set_config($target, 'ssh', { user => 'me', password => 'secret' })
```

## `set_feature`

Sets a particular feature to present on a target.

Features are used to determine what implementation of a task should be run.
Supported features are:
- `powershell`
- `shell`
- `puppet-agent`

> **Note:** Not available in apply block


```
set_feature($target, $feature, $value) => Target
```

This function returns
an object with the type `Target` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | The Target object to add features to. See [`get_targets`](#get_targets). |
| `feature` | `String` | The string identifying the feature. |
| `value` | `Optional[Boolean]` | Whether the feature is supported. |



**Example usage**

Add the `puppet-agent` feature to a target
```
set_feature($target, 'puppet-agent', true)
```

## `set_resources`

Sets one or more ResourceInstances on a Target. This function does not apply or modify
resources on a target.

For more information about resources see [the
documentation](https://puppet.com/docs/puppet/latest/lang_resources.html).

> **Note:** The `ResourceInstance` data type is under active development and is subject to
  change. You can read more about the data type in the [experimental features
  documentation](experimental_features.md#resourceinstance-data-type).

> **Note:** Not available in apply block

**Set a single resource from a data hash**


```
set_resources($target, $resource) => Array[ResourceInstance]
```

This function signature returns
an object with the type `Array[ResourceInstance]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | The `Target` object to add a resource to. See [`get_targets`](#get_targets). |
| `resource` | `Hash` | The resource data hash used to set a resource on the target. |


**Set a single resource from a `ResourceInstance` object**


```
set_resources($target, $resource) => Array[ResourceInstance]
```

This function signature returns
an object with the type `Array[ResourceInstance]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | The `Target` object to add a resource to. See [`get_targets`](#get_targets). |
| `resource` | `ResourceInstance` | The `ResourceInstance` object to set on the target. |


**Set multiple resources from an array of data hashes and `ResourceInstance` objects**


```
set_resources($target, $resources) => Array[ResourceInstance]
```

This function signature returns
an object with the type `Array[ResourceInstance]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | The `Target` object to add resources to. See [`get_targets`](#get_targets). |
| `resources` | `Array[Variant[Hash, ResourceInstance]]` | The resource data hashes and `ResourceInstance` objects to set on the target. |



**Example usage**

Add a resource to a target from a data hash.
```
$resource_hash = {
  'type'  => File,
  'title' => '/etc/puppetlabs',
  'state' => { 'ensure' => 'present' }
}

$target.set_resources($resource_hash)
```
Add a resource to a target from a `ResourceInstance` object.
```
$resource_instance = ResourceInstance.new(
  'target' => $target,
  'type'   => File,
  'title'  => '/etc/puppetlabs',
  'state'  => { 'ensure' => 'present' }
)

$target.set_resources($resource_instance)
```
Add resources from resource data hashes returned from an apply block.
```
$apply_results = apply($targets) {
  File { '/etc/puppetlabs':
    ensure => present
  }
  Package { 'openssl':
    ensure => installed
  }
}

$apply_results.each |$result| {
  $result.target.set_resources($result.report['resource_statuses'].values)
}
```
Add resources retrieved with [`get_resources`](#get_resources) to a target.
```
$resources = $target.get_resources(Package).first['resources']
$target.set_resources($resources)
```

## `set_var`

Sets a variable `[` key => value `](# key => value )` for a target.

> **Note:** Not available in apply block


```
set_var($target, $key, $value) => Target
```

This function returns
an object with the type `Target` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | The Target object to set the variable for. See [`get_targets`](#get_targets). |
| `key` | `String` | The key for the variable. |
| `value` | `Data` | The value of the variable. |



**Example usage**

Set a variable on a target
```
$target.set_var('ephemeral', true)
```

## `system::env`

Get an environment variable.


```
system::env($name) => Optional[String]
```

This function returns
an object with the type `Optional[String]` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | `String` | Environment variable name. |



**Example usage**

Get the USER environment variable
```
system::env('USER')
```

## `upload_file`

Uploads the given file or directory to the given set of targets and returns the result from each upload.
This function does nothing if the list of targets is empty.

> **Note:** Not available in apply block

**Upload a file or directory**


```
upload_file($source, $destination, $targets, $options) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `source` | `String[1]` | A source path, either an absolute path or a modulename/filename selector for a file or directory in $MODULEROOT/files. |
| `destination` | `String[1]` | An absolute path on the target(s). |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |

**Upload a file or directory, logging the provided description**


```
upload_file($source, $destination, $targets, $description, $options) => ResultSet
```

This function signature returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `source` | `String[1]` | A source path, either an absolute path or a modulename/filename selector for a file or directory in $MODULEROOT/files. |
| `destination` | `String[1]` | An absolute path on the target(s). |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `description` | `String` | A description to be output when calling this function. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |


**Example usage**

Upload a local file to Linux targets and change owner to 'root'
```
upload_file('/var/tmp/payload.tgz', '/tmp/payload.tgz', $targets, '_run_as' => 'root')
```
Upload a module file to a Windows target
```
upload_file('postgres/default.conf', 'C:/ProgramData/postgres/default.conf', $target)
```
Upload a file
```
upload_file('/var/tmp/payload.tgz', '/tmp/payload.tgz', $targets, 'Uploading payload to unpack')
```

## `vars`

Returns a hash of the 'vars' (variables) assigned to a target.

Vars can be assigned through the inventory file or `set_var` function.
Plan authors can call this function on a target to get the variable hash
for that target.


```
vars($target) => Hash[String, Data]
```

This function returns
an object with the type `Hash[String, Data]` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `target` | `Target` | The Target object to get variables from. See [`get_targets`](#get_targets). |



**Example usage**

Get vars for a target
```
$target.vars
```

## `wait`

Wait for a Future or array of Futures to finish and return results,
optionally with a timeout.

> **Note:** Not available in apply block

**Wait for Futures to finish**


```
wait($futures, $options) => Array[PlanResult]
```

This function signature returns
an object with the type `Array[PlanResult]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `futures` | `Variant[Future, Array[Future]]` | A Bolt Future object or array of Bolt Futures to wait on. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following option:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |

**Wait for all Futures in the current plan to finish**


```
wait($options) => Array[PlanResult]
```

This function signature returns
an object with the type `Array[PlanResult]` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following option:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |

**Wait for all Futures in the current plan to finish with a timeout**


```
wait($timeout, $options) => Array[PlanResult]
```

This function signature returns
an object with the type `Array[PlanResult]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `timeout` | `Variant[Integer[0], Float[0.0]]` | How long to wait for Futures to finish before raising a Timeout error. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following option:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |

**Wait for Futures to finish with timeout**


```
wait($futures, $timeout, $options) => Array[PlanResult]
```

This function signature returns
an object with the type `Array[PlanResult]` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `futures` | `Variant[Future, Array[Future]]` | A Bolt Future object or array of Bolt Futures to wait on. |
| `timeout` | `Variant[Integer[0], Float[0.0]]` | How long to wait for Futures to finish before raising a Timeout error. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function signature accepts the following option:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |


**Example usage**

Upload a large file in the background, then wait until it's loaded
```
$futures = background() || {
  upload_file("./very_large_file", "/opt/jfrog/artifactory/var/etc/artifactory", $targets)
}
# Run an unrelated task
run_task("deploy", $targets)
# Wait for the file upload to finish
$results = wait($futures)
```
Perform multiple tasks in the background, then wait for all of them to finish
```
background() || { upload_file("./large_file", "/opt/jfrog/...", $targets) }
background() || { run_task("db::migrate", $targets) }
# Wait for all futures in the plan to finish and return all results
$results = wait()
```
Perform multiple tasks in the background, then wait for all of them to finish with a timeout
```
background() || { upload_file("./large_file", "/opt/jfrog/...", $targets) }
background() || { run_task("db::migrate", $targets) }
# Wait for all futures in the plan to finish and return all results
$results = wait(30)
```
Upload a large file in the background with a 30 second timeout.
```
$futures = background() || {
  upload_file("./very_large_file", "/opt/jfrog/artifactory/var/etc/artifactory", $targets)
}
# Run an unrelated task
run_task("deploy", $targets)
# Wait for the file upload to finish
$results = wait($futures, 30)
```
Upload a large file in the background with a 30 second timeout, catching any errors.
```
$futures = background() || {
  upload_file("./very_large_file", "/opt/jfrog/artifactory/var/etc/artifactory", $targets)
}
# Run an unrelated task
run_task("deploy", $targets)
# Wait for the file upload to finish
$results = wait($futures, 30, '_catch_errors' => true)
```

## `wait_until_available`

Wait until all targets accept connections. This function allows a plan execution to wait for a customizable
amount of time via the `wait_time` option until a target connection can be reestablished. The plan proceeds
to the next step if the connection fails to reconnect in the time specified (default: 120 seconds). A typical
use case for this function is if your plan reboots a remote host and the plan needs to wait for the host to reconnect
before it continues to the next step.

> **Note:** Not available in apply block


```
wait_until_available($targets, $options) => ResultSet
```

This function returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `description` | `String` | A description for logging. (default: 'wait until available') |
| `wait_time` | `Numeric` | The time to wait, in seconds. (default: 120) |
| `retry_interval` | `Numeric` | The interval to wait before retrying, in seconds. (default: 1) |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |


**Example usage**

Wait for targets
```
wait_until_available($targets, wait_time => 300)
```

## `without_default_logging`

Define a block where default logging is suppressed.

Messages for actions within this block will be logged at `info` level instead
of `notice`, so they will not be seen normally but will still be present
when `verbose` logging is requested.

> **Note:** Not available in apply block


```
without_default_logging(&block) => Undef
```

This function returns
an object with the type `Undef` and accepts the following
parameter:

| Parameter | Type | Description |
| --- | --- | --- |
| `&block` | `Callable[0, 0]` | The block where action logging is suppressed. |



**Example usage**

Suppress default logging for a series of functions
```
without_default_logging() || {
  notice("Deploying on ${nodes}")
  get_targets($targets).each |$target| {
    run_task(deploy, $target)
  }
}
```

## `write_file`

Write contents to a file on the given set of targets.

> **Note:** Not available in apply block


```
write_file($content, $destination, $targets, $options) => ResultSet
```

This function returns
an object with the type `ResultSet` and accepts the following
parameters:

| Parameter | Type | Description |
| --- | --- | --- |
| `content` | `String` | File content to write. |
| `destination` | `String[1]` | An absolute path on the target(s). |
| `targets` | `TargetSpec` | A pattern identifying zero or more targets. See [`get_targets`](#get_targets) for accepted patterns. |
| `options` | `Optional[Hash[String[1], Any]]` | A hash of additional options. |


This function accepts the following options:

| Option | Type | Description |
| --- | --- | --- |
| `_catch_errors` | `Boolean` | Whether to catch raised errors. |
| `_run_as` | `String` | User to run as using privilege escalation. |


**Example usage**

Write a file to a target
```
$content = 'Hello, world!'
write_file($content, '/Users/me/hello.txt', $targets)
```

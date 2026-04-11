---
title: "*nix shell commands"
layout: default
---
# *nix shell commands

## Command syntax

Bolt shell commands follow a noun-verb convention.

To view a full list of
available commands, use the `bolt help` command:

```shell
bolt help
```

## Commands

These subcommands, actions, and options are available for Bolt.


### apply

[0m
Apply Puppet manifest code on the specified targets.

[36mDocumentation[0m
For documentation see http://pup.pt/bolt-apply.

[36m

**Usage**

```bash
[0m
    bolt apply [manifest] {--targets TARGETS | --query QUERY | --rerun FILTER}
      [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-u</code>, <code>--user USER</code></td>
        <td>User to authenticate as.</td>
    </tr>   
      <tr>
        <td><code>-p</code>, <code>--password PASSWORD</code></td>
        <td>Password to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--password-prompt</code></td>
        <td>Prompt for user to input password.</td>
    </tr>   
      <tr>
        <td><code>--private-key KEY</code></td>
        <td>Path to private ssh key to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--[no-]host-key-check</code></td>
        <td>Check host keys with SSH.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl</code></td>
        <td>Use SSL with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl-verify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--run-as USER</code></td>
        <td>User to run as using privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password PASSWORD</code></td>
        <td>Password for privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password-prompt</code></td>
        <td>Prompt for user to input escalation password.</td>
    </tr>   
      <tr>
        <td><code>--sudo-executable EXEC</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
    </tr>   
      <tr>
        <td><code>-c</code>, <code>--concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous connections.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--[no-]save-rerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
    </tr>   
      <tr>
        <td><code>--[no-]cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
    </tr>   
      <tr>
        <td><code>--puppetdb INSTANCE</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--transport TRANSPORT</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>For more information, see 'bolt guide transports'.</td>
    </tr>   
      <tr>
        <td><code>--connect-timeout TIMEOUT</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
    </tr>   
      <tr>
        <td><code>--[no-]tty</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
    </tr>   
      <tr>
        <td><code>--[no-]native-ssh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--ssh-command EXEC</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--copy-command EXEC</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>-v</code>, <code>--[no-]verbose</code></td>
        <td>Display verbose logging.</td>
    </tr>   
      <tr>
        <td><code>--trace</code></td>
        <td>Display error stack traces.</td>
    </tr>   
      <tr>
        <td><code>--stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>Run with --no-verbose to prevent Bolt from displaying output<p>a second time after the action is completed.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--noop</code></td>
        <td>See what changes Bolt will make without actually executing the changes.</td>
    </tr>   
      <tr>
        <td><code>-e</code>, <code>--execute CODE</code></td>
        <td>Puppet manifest code to apply to the targets.</td>
    </tr>   
      <tr>
        <td><code>--compile-concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous manifest block compiles (default: number of cores).</td>
    </tr>   
      <tr>
        <td><code>--hiera-config PATH</code></td>
        <td>Specify where to load Hiera config from (default: &lt;project>/hiera.yaml).</td>
    </tr>   
  
  </tbody>
</table>

### command run

[0m
Run a command on the specified targets.

[36mDocumentation[0m
For documentation see http://pup.pt/bolt-commands.

[36m

**Usage**

```bash
[0m
    bolt command run <command> {--targets TARGETS | --query QUERY | --rerun FILTER}
      [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-u</code>, <code>--user USER</code></td>
        <td>User to authenticate as.</td>
    </tr>   
      <tr>
        <td><code>-p</code>, <code>--password PASSWORD</code></td>
        <td>Password to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--password-prompt</code></td>
        <td>Prompt for user to input password.</td>
    </tr>   
      <tr>
        <td><code>--private-key KEY</code></td>
        <td>Path to private ssh key to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--[no-]host-key-check</code></td>
        <td>Check host keys with SSH.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl</code></td>
        <td>Use SSL with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl-verify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--run-as USER</code></td>
        <td>User to run as using privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password PASSWORD</code></td>
        <td>Password for privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password-prompt</code></td>
        <td>Prompt for user to input escalation password.</td>
    </tr>   
      <tr>
        <td><code>--sudo-executable EXEC</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
    </tr>   
      <tr>
        <td><code>-c</code>, <code>--concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous connections.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--[no-]save-rerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
    </tr>   
      <tr>
        <td><code>--[no-]cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
    </tr>   
      <tr>
        <td><code>--puppetdb INSTANCE</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--transport TRANSPORT</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>For more information, see 'bolt guide transports'.</td>
    </tr>   
      <tr>
        <td><code>--connect-timeout TIMEOUT</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
    </tr>   
      <tr>
        <td><code>--[no-]tty</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
    </tr>   
      <tr>
        <td><code>--[no-]native-ssh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--ssh-command EXEC</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--copy-command EXEC</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>-v</code>, <code>--[no-]verbose</code></td>
        <td>Display verbose logging.</td>
    </tr>   
      <tr>
        <td><code>--trace</code></td>
        <td>Display error stack traces.</td>
    </tr>   
      <tr>
        <td><code>--stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>Run with --no-verbose to prevent Bolt from displaying output<p>a second time after the action is completed.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--env-var ENVIRONMENT_VARIABLES</code></td>
        <td>Environment variables to set on the target.</td>
    </tr>   
  
  </tbody>
</table>

### file download

[0m
Download a file or directory from one or more targets.

Downloaded files and directories are saved to the a subdirectory
matching the target's name under the destination directory. The
destination directory is expanded relative to the downloads
subdirectory of the project directory.

[36mDocumentation[0m
For documentation see http://pup.pt/bolt-commands.

[36m

**Usage**

```bash
[0m
    bolt file download <source> <destination> {--targets TARGETS | --query QUERY | --rerun FILTER}
      [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-u</code>, <code>--user USER</code></td>
        <td>User to authenticate as.</td>
    </tr>   
      <tr>
        <td><code>-p</code>, <code>--password PASSWORD</code></td>
        <td>Password to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--password-prompt</code></td>
        <td>Prompt for user to input password.</td>
    </tr>   
      <tr>
        <td><code>--private-key KEY</code></td>
        <td>Path to private ssh key to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--[no-]host-key-check</code></td>
        <td>Check host keys with SSH.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl</code></td>
        <td>Use SSL with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl-verify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--run-as USER</code></td>
        <td>User to run as using privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password PASSWORD</code></td>
        <td>Password for privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password-prompt</code></td>
        <td>Prompt for user to input escalation password.</td>
    </tr>   
      <tr>
        <td><code>--sudo-executable EXEC</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
    </tr>   
      <tr>
        <td><code>-c</code>, <code>--concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous connections.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--[no-]save-rerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
    </tr>   
      <tr>
        <td><code>--[no-]cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
    </tr>   
      <tr>
        <td><code>--puppetdb INSTANCE</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--transport TRANSPORT</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>For more information, see 'bolt guide transports'.</td>
    </tr>   
      <tr>
        <td><code>--connect-timeout TIMEOUT</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
    </tr>   
      <tr>
        <td><code>--[no-]tty</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
    </tr>   
      <tr>
        <td><code>--[no-]native-ssh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--ssh-command EXEC</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--copy-command EXEC</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>-v</code>, <code>--[no-]verbose</code></td>
        <td>Display verbose logging.</td>
    </tr>   
      <tr>
        <td><code>--trace</code></td>
        <td>Display error stack traces.</td>
    </tr>   
      <tr>
        <td><code>--stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>Run with --no-verbose to prevent Bolt from displaying output<p>a second time after the action is completed.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
  
  </tbody>
</table>

### file upload

[0m
Upload a local file or directory.

[36mDocumentation[0m
For documentation see http://pup.pt/bolt-commands.

[36m

**Usage**

```bash
[0m
    bolt file upload <source> <destination> {--targets TARGETS | --query QUERY | --rerun FILTER}
      [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-u</code>, <code>--user USER</code></td>
        <td>User to authenticate as.</td>
    </tr>   
      <tr>
        <td><code>-p</code>, <code>--password PASSWORD</code></td>
        <td>Password to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--password-prompt</code></td>
        <td>Prompt for user to input password.</td>
    </tr>   
      <tr>
        <td><code>--private-key KEY</code></td>
        <td>Path to private ssh key to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--[no-]host-key-check</code></td>
        <td>Check host keys with SSH.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl</code></td>
        <td>Use SSL with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl-verify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--run-as USER</code></td>
        <td>User to run as using privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password PASSWORD</code></td>
        <td>Password for privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password-prompt</code></td>
        <td>Prompt for user to input escalation password.</td>
    </tr>   
      <tr>
        <td><code>--sudo-executable EXEC</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
    </tr>   
      <tr>
        <td><code>-c</code>, <code>--concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous connections.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--[no-]save-rerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
    </tr>   
      <tr>
        <td><code>--[no-]cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
    </tr>   
      <tr>
        <td><code>--puppetdb INSTANCE</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--transport TRANSPORT</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>For more information, see 'bolt guide transports'.</td>
    </tr>   
      <tr>
        <td><code>--connect-timeout TIMEOUT</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
    </tr>   
      <tr>
        <td><code>--[no-]tty</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
    </tr>   
      <tr>
        <td><code>--[no-]native-ssh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--ssh-command EXEC</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--copy-command EXEC</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>-v</code>, <code>--[no-]verbose</code></td>
        <td>Display verbose logging.</td>
    </tr>   
      <tr>
        <td><code>--trace</code></td>
        <td>Display error stack traces.</td>
    </tr>   
      <tr>
        <td><code>--stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>Run with --no-verbose to prevent Bolt from displaying output<p>a second time after the action is completed.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--tmpdir DIR</code></td>
        <td>The directory to upload and execute temporary files on the target.</td>
    </tr>   
  
  </tbody>
</table>

### group show

[0m
Show the list of groups in the inventory.

[36mDocumentation[0m
To learn more about the inventory run 'bolt guide inventory'.

**Usage**

```bash
[0m
    bolt group show [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
  
  </tbody>
</table>

### guide

[0m
View guides for Bolt's concepts and features.

Omitting a topic will display a list of available guides,
while providing a topic will display the relevant guide.

[36m

**Usage**

```bash
[0m
    bolt guide [topic] [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
  
  </tbody>
</table>

### inventory show

[0m
Show the list of targets an action would run on. This command will list
all targets in the project's inventory by default.

To filter the targets in the list, use the --targets, --query, or --rerun
options. To view detailed configuration and data for targets, use the
--detail option. To learn more about the inventory run 'bolt guide inventory'.

[36mDocumentation[0m
To learn more about the inventory run 'bolt guide inventory'.

**Usage**

```bash
[0m
    bolt inventory show [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--detail</code></td>
        <td>Show resolved configuration for the targets.</td>
    </tr>   
  
  </tbody>
</table>

### lookup

[0m
Look up a value with Hiera.

[36mDocumentation[0m
Learn more about using Hiera with Bolt at https://pup.pt/bolt-hiera.

[36m

**Usage**

```bash
[0m
    bolt lookup <key> {--targets TARGETS | --query QUERY | --rerun FILTER | --plan-hierarchy}
      [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-u</code>, <code>--user USER</code></td>
        <td>User to authenticate as.</td>
    </tr>   
      <tr>
        <td><code>-p</code>, <code>--password PASSWORD</code></td>
        <td>Password to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--password-prompt</code></td>
        <td>Prompt for user to input password.</td>
    </tr>   
      <tr>
        <td><code>--private-key KEY</code></td>
        <td>Path to private ssh key to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--[no-]host-key-check</code></td>
        <td>Check host keys with SSH.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl</code></td>
        <td>Use SSL with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl-verify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--run-as USER</code></td>
        <td>User to run as using privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password PASSWORD</code></td>
        <td>Password for privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password-prompt</code></td>
        <td>Prompt for user to input escalation password.</td>
    </tr>   
      <tr>
        <td><code>--sudo-executable EXEC</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
    </tr>   
      <tr>
        <td><code>-c</code>, <code>--concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous connections.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--[no-]save-rerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
    </tr>   
      <tr>
        <td><code>--[no-]cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
    </tr>   
      <tr>
        <td><code>--puppetdb INSTANCE</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--transport TRANSPORT</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>For more information, see 'bolt guide transports'.</td>
    </tr>   
      <tr>
        <td><code>--connect-timeout TIMEOUT</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
    </tr>   
      <tr>
        <td><code>--[no-]tty</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
    </tr>   
      <tr>
        <td><code>--[no-]native-ssh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--ssh-command EXEC</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--copy-command EXEC</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>-v</code>, <code>--[no-]verbose</code></td>
        <td>Display verbose logging.</td>
    </tr>   
      <tr>
        <td><code>--trace</code></td>
        <td>Display error stack traces.</td>
    </tr>   
      <tr>
        <td><code>--stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>Run with --no-verbose to prevent Bolt from displaying output<p>a second time after the action is completed.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--hiera-config PATH</code></td>
        <td>Specify where to load Hiera config from (default: &lt;project>/hiera.yaml).</td>
    </tr>   
      <tr>
        <td><code>--plan-hierarchy</code></td>
        <td>Look up a value with Hiera in the context of a specific plan.</td>
    </tr>   
  
  </tbody>
</table>

### module add

[0m
Add a module to the project.

Module declarations are loaded from the project's configuration
file. Bolt will automatically resolve all module dependencies,
generate a Puppetfile, and install the modules.

[36mDocumentation[0m
To learn more about Bolt modules, run 'bolt guide module'.

**Usage**

```bash
[0m
    bolt module add <module> [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
  
  </tbody>
</table>

### module generate-types

[0m
Generate type references to register in plans. To learn more about
Bolt modules, run 'bolt guide module'.

[36mDocumentation[0m
To learn more about Bolt modules, run 'bolt guide module'.

**Usage**

```bash
[0m
    bolt module generate-types [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
  
  </tbody>
</table>

### module install

[0m
Install the project's modules.

Module declarations are loaded from the project's configuration
file. Bolt will automatically resolve all module dependencies,
generate a Puppetfile, and install the modules.

[36mDocumentation[0m
To learn more about Bolt modules, run 'bolt guide module'.

**Usage**

```bash
[0m
    bolt module install [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>--force</code></td>
        <td>Force a destructive action.</td>
    </tr>   
      <tr>
        <td><code>--[no-]resolve</code></td>
        <td>Use --no-resolve to install modules listed in the Puppetfile without resolving modules configured<p>in Bolt project configuration.</td>
    </tr>   
  
  </tbody>
</table>

### module show

[0m
List modules available to the Bolt project.

Providing the name of a module will display detailed documentation for
the module.

[36mDocumentation[0m
To learn more about Bolt modules, run 'bolt guide module'.

**Usage**

```bash
[0m
    bolt module show [module name] [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
  
  </tbody>
</table>

### plan convert

[0m
Convert a YAML plan to a Puppet language plan and print the converted
plan to stdout.

Converting a YAML plan might result in a plan that is syntactically
correct but has different behavior. Always verify a converted plan's
functionality. Note that the converted plan is not written to a file.

[36mDocumentation[0m
Learn more about Bolt plans at https://pup.pt/bolt-plans.

[36m

**Usage**

```bash
[0m
    bolt plan convert <plan name> [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
  
  </tbody>
</table>

### plan new

[0m
Create a new plan in the current project.

[36mDocumentation[0m
Learn more about Bolt plans at https://pup.pt/bolt-plans.

[36m

**Usage**

```bash
[0m
    bolt plan new <plan name> [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>--pp</code></td>
        <td>Create a new Puppet language plan.</td>
    </tr>   
  
  </tbody>
</table>

### plan run

[0m
Run a plan on the specified targets.

[36mDocumentation[0m
Learn more about Bolt plans at https://pup.pt/bolt-plans.

[36m

**Usage**

```bash
[0m
    bolt plan run <plan name> [parameters] [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-u</code>, <code>--user USER</code></td>
        <td>User to authenticate as.</td>
    </tr>   
      <tr>
        <td><code>-p</code>, <code>--password PASSWORD</code></td>
        <td>Password to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--password-prompt</code></td>
        <td>Prompt for user to input password.</td>
    </tr>   
      <tr>
        <td><code>--private-key KEY</code></td>
        <td>Path to private ssh key to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--[no-]host-key-check</code></td>
        <td>Check host keys with SSH.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl</code></td>
        <td>Use SSL with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl-verify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--run-as USER</code></td>
        <td>User to run as using privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password PASSWORD</code></td>
        <td>Password for privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password-prompt</code></td>
        <td>Prompt for user to input escalation password.</td>
    </tr>   
      <tr>
        <td><code>--sudo-executable EXEC</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
    </tr>   
      <tr>
        <td><code>-c</code>, <code>--concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous connections.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--[no-]save-rerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
    </tr>   
      <tr>
        <td><code>--[no-]cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
    </tr>   
      <tr>
        <td><code>--puppetdb INSTANCE</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--transport TRANSPORT</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>For more information, see 'bolt guide transports'.</td>
    </tr>   
      <tr>
        <td><code>--connect-timeout TIMEOUT</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
    </tr>   
      <tr>
        <td><code>--[no-]tty</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
    </tr>   
      <tr>
        <td><code>--[no-]native-ssh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--ssh-command EXEC</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--copy-command EXEC</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>-v</code>, <code>--[no-]verbose</code></td>
        <td>Display verbose logging.</td>
    </tr>   
      <tr>
        <td><code>--trace</code></td>
        <td>Display error stack traces.</td>
    </tr>   
      <tr>
        <td><code>--stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>Run with --no-verbose to prevent Bolt from displaying output<p>a second time after the action is completed.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--params PARAMETERS</code></td>
        <td>Parameters to a task or plan as json, a json file '@&lt;file>', or on stdin '-'.</td>
    </tr>   
      <tr>
        <td><code>--compile-concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous manifest block compiles (default: number of cores).</td>
    </tr>   
      <tr>
        <td><code>--tmpdir DIR</code></td>
        <td>The directory to upload and execute temporary files on the target.</td>
    </tr>   
      <tr>
        <td><code>--hiera-config PATH</code></td>
        <td>Specify where to load Hiera config from (default: &lt;project>/hiera.yaml).</td>
    </tr>   
  
  </tbody>
</table>

### plan show

[0m
Show available plans and plan documentation.

Omitting the name of a plan will display a list of plans available
in the Bolt project.

Providing the name of a plan will display detailed documentation for
the plan, including a list of available parameters.

[36mDocumentation[0m
Learn more about Bolt plans at https://pup.pt/bolt-plans.

[36m

**Usage**

```bash
[0m
    bolt plan show [plan name] [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--filter FILTER</code></td>
        <td>Filter tasks and plans by a matching substring.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
  
  </tbody>
</table>

### plugin show

[0m
Show available plugins.

[36mDocumentation[0m
Learn more about Bolt plugins at https://pup.pt/bolt-plugins.

**Usage**

```bash
[0m
    bolt plugin show [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
  
  </tbody>
</table>

### policy apply

[0m
Apply a policy to the specified targets.

**Usage**

```bash
[0m
    bolt policy apply <policy> [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-u</code>, <code>--user USER</code></td>
        <td>User to authenticate as.</td>
    </tr>   
      <tr>
        <td><code>-p</code>, <code>--password PASSWORD</code></td>
        <td>Password to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--password-prompt</code></td>
        <td>Prompt for user to input password.</td>
    </tr>   
      <tr>
        <td><code>--private-key KEY</code></td>
        <td>Path to private ssh key to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--[no-]host-key-check</code></td>
        <td>Check host keys with SSH.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl</code></td>
        <td>Use SSL with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl-verify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--run-as USER</code></td>
        <td>User to run as using privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password PASSWORD</code></td>
        <td>Password for privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password-prompt</code></td>
        <td>Prompt for user to input escalation password.</td>
    </tr>   
      <tr>
        <td><code>--sudo-executable EXEC</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
    </tr>   
      <tr>
        <td><code>-c</code>, <code>--concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous connections.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--[no-]save-rerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
    </tr>   
      <tr>
        <td><code>--[no-]cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
    </tr>   
      <tr>
        <td><code>--puppetdb INSTANCE</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--transport TRANSPORT</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>For more information, see 'bolt guide transports'.</td>
    </tr>   
      <tr>
        <td><code>--connect-timeout TIMEOUT</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
    </tr>   
      <tr>
        <td><code>--[no-]tty</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
    </tr>   
      <tr>
        <td><code>--[no-]native-ssh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--ssh-command EXEC</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--copy-command EXEC</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>-v</code>, <code>--[no-]verbose</code></td>
        <td>Display verbose logging.</td>
    </tr>   
      <tr>
        <td><code>--trace</code></td>
        <td>Display error stack traces.</td>
    </tr>   
      <tr>
        <td><code>--stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>Run with --no-verbose to prevent Bolt from displaying output<p>a second time after the action is completed.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--compile-concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous manifest block compiles (default: number of cores).</td>
    </tr>   
      <tr>
        <td><code>--hiera-config PATH</code></td>
        <td>Specify where to load Hiera config from (default: &lt;project>/hiera.yaml).</td>
    </tr>   
      <tr>
        <td><code>--noop</code></td>
        <td>See what changes Bolt will make without actually executing the changes.</td>
    </tr>   
  
  </tbody>
</table>

### policy new

[0m
Create a new policy in the current project.

**Usage**

```bash
[0m
    bolt policy new <policy> [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
  
  </tbody>
</table>

### policy show

[0m
Show available policies.

**Usage**

```bash
[0m
    bolt policy show [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
  
  </tbody>
</table>

### project init

[0m
Create a new Bolt project in the current working directory.

Specify a name for the Bolt project. Defaults to the basename of the current working directory.

[36mDocumentation[0m
To learn more about Bolt projects, run 'bolt guide project'.

[36m

**Usage**

```bash
[0m
    bolt project init [name] [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--modules MODULES</code></td>
        <td>A comma-separated list of modules to install from the Puppet Forge<p>when initializing a project. Resolves and installs all dependencies.</td>
    </tr>   
  
  </tbody>
</table>

### project migrate

[0m
Migrate a Bolt project to use current best practices and the latest version of
configuration files.

[36mDocumentation[0m
To learn more about Bolt projects, run 'bolt guide project'.

**Usage**

```bash
[0m
    bolt project migrate [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
  
  </tbody>
</table>

### script run

[0m
Run a script on the specified targets.

Arguments passed to a script are passed literally and are not interpolated
by the shell. Any arguments containing spaces or special characters should
be quoted.

[36mDocumentation[0m
Learn more about running scripts at https://pup.pt/bolt-commands.

[36m

**Usage**

```bash
[0m
    bolt script run <script> [arguments] {--targets TARGETS | --query QUERY | --rerun FILTER}
      [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-u</code>, <code>--user USER</code></td>
        <td>User to authenticate as.</td>
    </tr>   
      <tr>
        <td><code>-p</code>, <code>--password PASSWORD</code></td>
        <td>Password to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--password-prompt</code></td>
        <td>Prompt for user to input password.</td>
    </tr>   
      <tr>
        <td><code>--private-key KEY</code></td>
        <td>Path to private ssh key to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--[no-]host-key-check</code></td>
        <td>Check host keys with SSH.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl</code></td>
        <td>Use SSL with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl-verify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--run-as USER</code></td>
        <td>User to run as using privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password PASSWORD</code></td>
        <td>Password for privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password-prompt</code></td>
        <td>Prompt for user to input escalation password.</td>
    </tr>   
      <tr>
        <td><code>--sudo-executable EXEC</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
    </tr>   
      <tr>
        <td><code>-c</code>, <code>--concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous connections.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--[no-]save-rerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
    </tr>   
      <tr>
        <td><code>--[no-]cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
    </tr>   
      <tr>
        <td><code>--puppetdb INSTANCE</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--transport TRANSPORT</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>For more information, see 'bolt guide transports'.</td>
    </tr>   
      <tr>
        <td><code>--connect-timeout TIMEOUT</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
    </tr>   
      <tr>
        <td><code>--[no-]tty</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
    </tr>   
      <tr>
        <td><code>--[no-]native-ssh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--ssh-command EXEC</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--copy-command EXEC</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>-v</code>, <code>--[no-]verbose</code></td>
        <td>Display verbose logging.</td>
    </tr>   
      <tr>
        <td><code>--trace</code></td>
        <td>Display error stack traces.</td>
    </tr>   
      <tr>
        <td><code>--stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>Run with --no-verbose to prevent Bolt from displaying output<p>a second time after the action is completed.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--tmpdir DIR</code></td>
        <td>The directory to upload and execute temporary files on the target.</td>
    </tr>   
      <tr>
        <td><code>--env-var ENVIRONMENT_VARIABLES</code></td>
        <td>Environment variables to set on the target.</td>
    </tr>   
  
  </tbody>
</table>

### secret createkeys

[0m
Create new encryption keys.

[36mDocumentation[0m
Learn more about secrets plugins at http://pup.pt/bolt-plugins.

**Usage**

```bash
[0m
    bolt secret createkeys [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--plugin PLUGIN</code></td>
        <td>Select the plugin to use.</td>
    </tr>   
      <tr>
        <td><code>--force</code></td>
        <td>Force a destructive action.</td>
    </tr>   
  
  </tbody>
</table>

### secret decrypt

[0m
Decrypt a value.

[36mDocumentation[0m
Learn more about secrets plugins at http://pup.pt/bolt-plugins.

**Usage**

```bash
[0m
    bolt secret decrypt <ciphertext> [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--plugin PLUGIN</code></td>
        <td>Select the plugin to use.</td>
    </tr>   
  
  </tbody>
</table>

### secret encrypt

[0m
Encrypt a value.

[36mDocumentation[0m
Learn more about secrets plugins at http://pup.pt/bolt-plugins.

**Usage**

```bash
[0m
  bolt secret encrypt <plaintext> [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--plugin PLUGIN</code></td>
        <td>Select the plugin to use.</td>
    </tr>   
  
  </tbody>
</table>

### task run

[0m
Run a task on the specified targets.

Parameters take the form parameter=value.

[36mDocumentation[0m
Learn more about Bolt tasks at http://pup.pt/bolt-tasks.

[36m

**Usage**

```bash
[0m
    bolt task run <task name> [parameters] {--targets TARGETS | --query QUERY | --rerun FILTER}
      [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-t</code>, <code>--targets TARGETS</code></td>
        <td>Identifies the targets of the command.<p>For more information, see 'bolt guide targets'.</td>
    </tr>   
      <tr>
        <td><code>-q</code>, <code>--query QUERY</code></td>
        <td>Query PuppetDB to determine the targets.</td>
    </tr>   
      <tr>
        <td><code>--rerun FILTER</code></td>
        <td>Retry on targets from the last run.<p>Available filters are 'all', 'failure', and 'success'.</td>
    </tr>   
      <tr>
        <td><code>-u</code>, <code>--user USER</code></td>
        <td>User to authenticate as.</td>
    </tr>   
      <tr>
        <td><code>-p</code>, <code>--password PASSWORD</code></td>
        <td>Password to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--password-prompt</code></td>
        <td>Prompt for user to input password.</td>
    </tr>   
      <tr>
        <td><code>--private-key KEY</code></td>
        <td>Path to private ssh key to authenticate with.</td>
    </tr>   
      <tr>
        <td><code>--[no-]host-key-check</code></td>
        <td>Check host keys with SSH.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl</code></td>
        <td>Use SSL with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--[no-]ssl-verify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
    </tr>   
      <tr>
        <td><code>--run-as USER</code></td>
        <td>User to run as using privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password PASSWORD</code></td>
        <td>Password for privilege escalation.</td>
    </tr>   
      <tr>
        <td><code>--sudo-password-prompt</code></td>
        <td>Prompt for user to input escalation password.</td>
    </tr>   
      <tr>
        <td><code>--sudo-executable EXEC</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
    </tr>   
      <tr>
        <td><code>-c</code>, <code>--concurrency CONCURRENCY</code></td>
        <td>Maximum number of simultaneous connections.</td>
    </tr>   
      <tr>
        <td><code>-i</code>, <code>--inventoryfile PATH</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
    </tr>   
      <tr>
        <td><code>--[no-]save-rerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
    </tr>   
      <tr>
        <td><code>--[no-]cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
    </tr>   
      <tr>
        <td><code>--puppetdb INSTANCE</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--transport TRANSPORT</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>For more information, see 'bolt guide transports'.</td>
    </tr>   
      <tr>
        <td><code>--connect-timeout TIMEOUT</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
    </tr>   
      <tr>
        <td><code>--[no-]tty</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
    </tr>   
      <tr>
        <td><code>--[no-]native-ssh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--ssh-command EXEC</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
    </tr>   
      <tr>
        <td><code>--copy-command EXEC</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
      <tr>
        <td><code>--[no-]color</code></td>
        <td>Whether to show output in color.</td>
    </tr>   
      <tr>
        <td><code>-v</code>, <code>--[no-]verbose</code></td>
        <td>Display verbose logging.</td>
    </tr>   
      <tr>
        <td><code>--trace</code></td>
        <td>Display error stack traces.</td>
    </tr>   
      <tr>
        <td><code>--stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>Run with --no-verbose to prevent Bolt from displaying output<p>a second time after the action is completed.</td>
    </tr>   
      <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--params PARAMETERS</code></td>
        <td>Parameters to a task or plan as json, a json file '@&lt;file>', or on stdin '-'.</td>
    </tr>   
      <tr>
        <td><code>--tmpdir DIR</code></td>
        <td>The directory to upload and execute temporary files on the target.</td>
    </tr>   
      <tr>
        <td><code>--noop</code></td>
        <td>See what changes Bolt will make without actually executing the changes.</td>
    </tr>   
  
  </tbody>
</table>

### task show

[0m
Show available tasks and task documentation.

Omitting the name of a task will display a list of tasks available
in the Bolt project.

Providing the name of a task will display detailed documentation for
the task, including a list of available parameters.

[36mDocumentation[0m
Learn more about Bolt tasks at http://pup.pt/bolt-tasks.

[36m

**Usage**

```bash
[0m
    bolt task show [task name] [options]

[36m
```

<table class="table">
  <thead>
    <tr>
     <th>Option</th>
     <th>Description</th>
    </tr>
  </thead>
  <tbody>
        <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Display help.</td>
    </tr>   
      <tr>
        <td><code>--version</code></td>
        <td>Display the version.</td>
    </tr>   
      <tr>
        <td><code>--log-level LEVEL</code></td>
        <td>Set the log level for the console. Available options are<p>trace, debug, info, warn, error, fatal.</td>
    </tr>   
      <tr>
        <td><code>--clear-cache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
    </tr>   
      <tr>
        <td><code>--project PATH</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
    </tr>   
      <tr>
        <td><code>-m</code>, <code>--modulepath MODULES</code></td>
        <td>List of directories containing modules, separated by ':'<p>Directories are case-sensitive.</td>
    </tr>   
      <tr>
        <td><code>--filter FILTER</code></td>
        <td>Filter tasks and plans by a matching substring.</td>
    </tr>   
      <tr>
        <td><code>--format FORMAT</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
    </tr>   
  
  </tbody>
</table>



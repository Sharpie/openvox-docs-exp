---
title: PowerShell cmdlets
layout: default
---
# PowerShell cmdlets

To use the PuppetBolt PowerShell module, see the [installation
documentation](bolt_installing.md#puppetbolt-powershell-module).

## Cmdlet syntax

Bolt PowerShell cmdlets follow a verb-noun convention.

To view a full list of available cmdlets, use the `Get-Command` cmdlet:

```shell
Get-Command -Module PuppetBolt
```

## Cmdlets

These PowerShell cmdlets are available in the Bolt PowerShell module.


### Invoke-BoltApply

[0m Apply Puppet manifest code on the specified targets.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Manifest</code></td>
        <td>The manifest to apply</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-User</code></td>
        <td>User to authenticate as.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Password</code></td>
        <td>Password to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PasswordPrompt</code></td>
        <td>Prompt for user to input password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PrivateKey</code></td>
        <td>Path to private ssh key to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HostKeyCheck</code></td>
        <td>Check host keys with SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Ssl</code></td>
        <td>Use SSL with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SslVerify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-RunAs</code></td>
        <td>User to run as using privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPassword</code></td>
        <td>Password for privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPasswordPrompt</code></td>
        <td>Prompt for user to input escalation password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoExecutable</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Concurrency</code></td>
        <td>Maximum number of simultaneous connections.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SaveRerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Puppetdb</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Transport</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>  For more information, see 'bolt guide transports'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ConnectTimeout</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-TTY</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-NativeSsh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SshCommand</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CopyCommand</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Trace</code></td>
        <td>Display error stack traces.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>  Run with --no-verbose to prevent Bolt from displaying output<p>  a second time after the action is completed.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Noop</code></td>
        <td>See what changes Bolt will make without actually executing the changes.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Execute</code></td>
        <td>Puppet manifest code to apply to the targets.</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-CompileConcurrency</code></td>
        <td>Maximum number of simultaneous manifest block compiles (default: number of cores).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HieraConfig</code></td>
        <td>Specify where to load Hiera config from (default: &lt;project>/hiera.yaml).</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Invoke-BoltCommand

[0m Run a command on the specified targets.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Command</code></td>
        <td>The command to execute</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-User</code></td>
        <td>User to authenticate as.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Password</code></td>
        <td>Password to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PasswordPrompt</code></td>
        <td>Prompt for user to input password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PrivateKey</code></td>
        <td>Path to private ssh key to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HostKeyCheck</code></td>
        <td>Check host keys with SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Ssl</code></td>
        <td>Use SSL with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SslVerify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-RunAs</code></td>
        <td>User to run as using privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPassword</code></td>
        <td>Password for privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPasswordPrompt</code></td>
        <td>Prompt for user to input escalation password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoExecutable</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Concurrency</code></td>
        <td>Maximum number of simultaneous connections.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SaveRerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Puppetdb</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Transport</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>  For more information, see 'bolt guide transports'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ConnectTimeout</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-TTY</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-NativeSsh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SshCommand</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CopyCommand</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Trace</code></td>
        <td>Display error stack traces.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>  Run with --no-verbose to prevent Bolt from displaying output<p>  a second time after the action is completed.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-EnvVar</code></td>
        <td>Environment variables to set on the target.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Receive-BoltFile

[0m Download a file or directory from one or more targets. Downloaded files and directories are saved to the a subdirectory matching the target's name under the destination directory. The destination directory is expanded relative to the downloads subdirectory of the project directory.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Source</code></td>
        <td>The source file or directory to download</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Destination</code></td>
        <td>The destination to download to</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-User</code></td>
        <td>User to authenticate as.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Password</code></td>
        <td>Password to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PasswordPrompt</code></td>
        <td>Prompt for user to input password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PrivateKey</code></td>
        <td>Path to private ssh key to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HostKeyCheck</code></td>
        <td>Check host keys with SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Ssl</code></td>
        <td>Use SSL with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SslVerify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-RunAs</code></td>
        <td>User to run as using privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPassword</code></td>
        <td>Password for privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPasswordPrompt</code></td>
        <td>Prompt for user to input escalation password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoExecutable</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Concurrency</code></td>
        <td>Maximum number of simultaneous connections.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SaveRerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Puppetdb</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Transport</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>  For more information, see 'bolt guide transports'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ConnectTimeout</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-TTY</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-NativeSsh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SshCommand</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CopyCommand</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Trace</code></td>
        <td>Display error stack traces.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>  Run with --no-verbose to prevent Bolt from displaying output<p>  a second time after the action is completed.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Send-BoltFile

[0m Upload a local file or directory.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Source</code></td>
        <td>The source file or directory to upload</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Destination</code></td>
        <td>The destination to upload to</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-User</code></td>
        <td>User to authenticate as.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Password</code></td>
        <td>Password to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PasswordPrompt</code></td>
        <td>Prompt for user to input password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PrivateKey</code></td>
        <td>Path to private ssh key to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HostKeyCheck</code></td>
        <td>Check host keys with SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Ssl</code></td>
        <td>Use SSL with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SslVerify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-RunAs</code></td>
        <td>User to run as using privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPassword</code></td>
        <td>Password for privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPasswordPrompt</code></td>
        <td>Prompt for user to input escalation password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoExecutable</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Concurrency</code></td>
        <td>Maximum number of simultaneous connections.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SaveRerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Puppetdb</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Transport</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>  For more information, see 'bolt guide transports'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ConnectTimeout</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-TTY</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-NativeSsh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SshCommand</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CopyCommand</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Trace</code></td>
        <td>Display error stack traces.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>  Run with --no-verbose to prevent Bolt from displaying output<p>  a second time after the action is completed.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Tmpdir</code></td>
        <td>The directory to upload and execute temporary files on the target.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Get-BoltGroup

[0m Show the list of groups in the inventory.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Get-BoltInventory

[0m Show the list of targets an action would run on. This command will list all targets in the project's inventory by default. To filter the targets in the list, use the --targets, --query, or --rerun options. To view detailed configuration and data for targets, use the --detail option. To learn more about the inventory run 'bolt guide inventory'.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Detail</code></td>
        <td>Show resolved configuration for the targets.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Invoke-BoltLookup

[0m Look up a value with Hiera.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Key</code></td>
        <td>The key to look up</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-User</code></td>
        <td>User to authenticate as.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Password</code></td>
        <td>Password to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PasswordPrompt</code></td>
        <td>Prompt for user to input password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PrivateKey</code></td>
        <td>Path to private ssh key to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HostKeyCheck</code></td>
        <td>Check host keys with SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Ssl</code></td>
        <td>Use SSL with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SslVerify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-RunAs</code></td>
        <td>User to run as using privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPassword</code></td>
        <td>Password for privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPasswordPrompt</code></td>
        <td>Prompt for user to input escalation password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoExecutable</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Concurrency</code></td>
        <td>Maximum number of simultaneous connections.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SaveRerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Puppetdb</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Transport</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>  For more information, see 'bolt guide transports'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ConnectTimeout</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-TTY</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-NativeSsh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SshCommand</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CopyCommand</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Trace</code></td>
        <td>Display error stack traces.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>  Run with --no-verbose to prevent Bolt from displaying output<p>  a second time after the action is completed.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HieraConfig</code></td>
        <td>Specify where to load Hiera config from (default: &lt;project>/hiera.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PlanHierarchy</code></td>
        <td>Look up a value with Hiera in the context of a specific plan.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Add-BoltModule

[0m Add a module to the project. Module declarations are loaded from the project's configuration file. Bolt will automatically resolve all module dependencies, generate a Puppetfile, and install the modules.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Module</code></td>
        <td>The name of the module to add to the Bolt project</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Register-BoltModuleTypes

[0m Generate type references to register in plans. To learn more about Bolt modules, run 'bolt guide module'.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Install-BoltModule

[0m Install the project's modules. Module declarations are loaded from the project's configuration file. Bolt will automatically resolve all module dependencies, generate a Puppetfile, and install the modules.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Force</code></td>
        <td>Force a destructive action.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Resolve</code></td>
        <td>Use --no-resolve to install modules listed in the Puppetfile without resolving modules configured<p>  in Bolt project configuration.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Get-BoltModule

[0m List modules available to the Bolt project. Providing the name of a module will display detailed documentation for the module.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The module to show</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Get-BoltPlan

[0m Show available plans and plan documentation. Omitting the name of a plan will display a list of plans available in the Bolt project. Providing the name of a plan will display detailed documentation for the plan, including a list of available parameters.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The plan to show</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Filter</code></td>
        <td>Filter tasks and plans by a matching substring.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Invoke-BoltPlan

[0m Run a plan on the specified targets.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The plan to run</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-User</code></td>
        <td>User to authenticate as.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Password</code></td>
        <td>Password to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PasswordPrompt</code></td>
        <td>Prompt for user to input password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PrivateKey</code></td>
        <td>Path to private ssh key to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HostKeyCheck</code></td>
        <td>Check host keys with SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Ssl</code></td>
        <td>Use SSL with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SslVerify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-RunAs</code></td>
        <td>User to run as using privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPassword</code></td>
        <td>Password for privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPasswordPrompt</code></td>
        <td>Prompt for user to input escalation password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoExecutable</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Concurrency</code></td>
        <td>Maximum number of simultaneous connections.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SaveRerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Puppetdb</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Transport</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>  For more information, see 'bolt guide transports'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ConnectTimeout</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-TTY</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-NativeSsh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SshCommand</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CopyCommand</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Trace</code></td>
        <td>Display error stack traces.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>  Run with --no-verbose to prevent Bolt from displaying output<p>  a second time after the action is completed.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Params</code></td>
        <td>Parameters to a task or plan as json, a json file '@&lt;file>', or on stdin '-'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CompileConcurrency</code></td>
        <td>Maximum number of simultaneous manifest block compiles (default: number of cores).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Tmpdir</code></td>
        <td>The directory to upload and execute temporary files on the target.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HieraConfig</code></td>
        <td>Specify where to load Hiera config from (default: &lt;project>/hiera.yaml).</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Convert-BoltPlan

[0m Convert a YAML plan to a Puppet language plan and print the converted plan to stdout. Converting a YAML plan might result in a plan that is syntactically correct but has different behavior. Always verify a converted plan's functionality. Note that the converted plan is not written to a file.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The plan to convert</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### New-BoltPlan

[0m Create a new plan in the current project.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The plan to create</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Pp</code></td>
        <td>Create a new Puppet language plan.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Get-BoltPlugin

[0m Show available plugins.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Invoke-BoltPolicy

[0m Apply a policy to the specified targets.

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The policy or policies to apply</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-User</code></td>
        <td>User to authenticate as.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Password</code></td>
        <td>Password to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PasswordPrompt</code></td>
        <td>Prompt for user to input password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PrivateKey</code></td>
        <td>Path to private ssh key to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HostKeyCheck</code></td>
        <td>Check host keys with SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Ssl</code></td>
        <td>Use SSL with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SslVerify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-RunAs</code></td>
        <td>User to run as using privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPassword</code></td>
        <td>Password for privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPasswordPrompt</code></td>
        <td>Prompt for user to input escalation password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoExecutable</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Concurrency</code></td>
        <td>Maximum number of simultaneous connections.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SaveRerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Puppetdb</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Transport</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>  For more information, see 'bolt guide transports'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ConnectTimeout</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-TTY</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-NativeSsh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SshCommand</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CopyCommand</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Trace</code></td>
        <td>Display error stack traces.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>  Run with --no-verbose to prevent Bolt from displaying output<p>  a second time after the action is completed.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CompileConcurrency</code></td>
        <td>Maximum number of simultaneous manifest block compiles (default: number of cores).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HieraConfig</code></td>
        <td>Specify where to load Hiera config from (default: &lt;project>/hiera.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Noop</code></td>
        <td>See what changes Bolt will make without actually executing the changes.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### New-BoltPolicy

[0m Create a new policy in the current project.

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The policy to create</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Get-BoltPolicy

[0m Show available policies.

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### New-BoltProject

[0m Create a new Bolt project in the current working directory. Specify a name for the Bolt project. Defaults to the basename of the current working directory.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The name of the Bolt project to create</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modules</code></td>
        <td>A comma-separated list of modules to install from the Puppet Forge<p>  when initializing a project. Resolves and installs all dependencies.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Update-BoltProject

[0m Migrate a Bolt project to use current best practices and the latest version of configuration files.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Invoke-BoltScript

[0m Run a script on the specified targets. Arguments passed to a script are passed literally and are not interpolated by the shell. Any arguments containing spaces or special characters should be quoted.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Script</code></td>
        <td>The script to execute</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Arguments</code></td>
        <td>The arguments to the script</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-User</code></td>
        <td>User to authenticate as.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Password</code></td>
        <td>Password to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PasswordPrompt</code></td>
        <td>Prompt for user to input password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PrivateKey</code></td>
        <td>Path to private ssh key to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HostKeyCheck</code></td>
        <td>Check host keys with SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Ssl</code></td>
        <td>Use SSL with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SslVerify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-RunAs</code></td>
        <td>User to run as using privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPassword</code></td>
        <td>Password for privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPasswordPrompt</code></td>
        <td>Prompt for user to input escalation password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoExecutable</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Concurrency</code></td>
        <td>Maximum number of simultaneous connections.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SaveRerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Puppetdb</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Transport</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>  For more information, see 'bolt guide transports'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ConnectTimeout</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-TTY</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-NativeSsh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SshCommand</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CopyCommand</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Trace</code></td>
        <td>Display error stack traces.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>  Run with --no-verbose to prevent Bolt from displaying output<p>  a second time after the action is completed.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Tmpdir</code></td>
        <td>The directory to upload and execute temporary files on the target.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-EnvVar</code></td>
        <td>Environment variables to set on the target.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Protect-BoltSecret

[0m Encrypt a value.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Text</code></td>
        <td>The text to encrypt</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Plugin</code></td>
        <td>Select the plugin to use.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Unprotect-BoltSecret

[0m Decrypt a value.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Text</code></td>
        <td>The text to decrypt</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Plugin</code></td>
        <td>Select the plugin to use.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### New-BoltSecretKey

[0m Create new encryption keys.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Plugin</code></td>
        <td>Select the plugin to use.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Force</code></td>
        <td>Force a destructive action.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Get-BoltTask

[0m Show available tasks and task documentation. Omitting the name of a task will display a list of tasks available in the Bolt project. Providing the name of a task will display detailed documentation for the task, including a list of available parameters.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The task to show</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Filter</code></td>
        <td>Filter tasks and plans by a matching substring.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>

### Invoke-BoltTask

[0m Run a task on the specified targets. Parameters take the form parameter=value.[36m

<table class="table">
  <thead>
   <tr>
        <th>Option</th>
        <th>Description</th>
        <th align="center">Mandatory?</th>
    </tr>
  </thead>
  <tbody>
         <tr>
        <td><code>-Name</code></td>
        <td>The task to run</td>
        <td align="center">✓</td>
     </tr>
         <tr>
        <td><code>-Targets</code></td>
        <td>Identifies the targets of the command.<p>  For more information, see 'bolt guide targets'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Query</code></td>
        <td>Query PuppetDB to determine the targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Rerun</code></td>
        <td>Retry on targets from the last run.<p>  Available filters are 'all', 'failure', and 'success'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-User</code></td>
        <td>User to authenticate as.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Password</code></td>
        <td>Password to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PasswordPrompt</code></td>
        <td>Prompt for user to input password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-PrivateKey</code></td>
        <td>Path to private ssh key to authenticate with.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-HostKeyCheck</code></td>
        <td>Check host keys with SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Ssl</code></td>
        <td>Use SSL with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SslVerify</code></td>
        <td>Verify remote host SSL certificate with WinRM.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-RunAs</code></td>
        <td>User to run as using privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPassword</code></td>
        <td>Password for privilege escalation.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoPasswordPrompt</code></td>
        <td>Prompt for user to input escalation password.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SudoExecutable</code></td>
        <td>Experimental. Specify an executable for running as another user.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Concurrency</code></td>
        <td>Maximum number of simultaneous connections.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Inventoryfile</code></td>
        <td>Specify where to load inventory from (default: &lt;project>/inventory.yaml).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SaveRerun</code></td>
        <td>Whether to update the rerun file after this command.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Cleanup</code></td>
        <td>Whether to clean up temporary files created on targets.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Puppetdb</code></td>
        <td>The named PuppetDB instance to connect to by default.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Project</code></td>
        <td>Path to load the Bolt project from (default: autodiscovered from current dir).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Modulepath</code></td>
        <td>List of directories containing modules, separated by ':'<p>  Directories are case-sensitive.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Transport</code></td>
        <td>Specify a default transport: docker, jail, local, lxd, podman, remote, ssh, winrm.<p>  For more information, see 'bolt guide transports'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ConnectTimeout</code></td>
        <td>Connection timeout in seconds (defaults vary).</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-TTY</code></td>
        <td>Request a pseudo TTY on targets that support it.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-NativeSsh</code></td>
        <td>Experimental. Whether to shell out to native SSH or use the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-SshCommand</code></td>
        <td>Experimental. Executable to use instead of the net-ssh Ruby library.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-CopyCommand</code></td>
        <td>Experimental. Command to copy files to remote hosts if using native SSH.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Format</code></td>
        <td>Output format to use: human, json, or rainbow.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Color</code></td>
        <td>Whether to show output in color.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Trace</code></td>
        <td>Display error stack traces.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Stream</code></td>
        <td>Stream output from scripts and commands to the console.<p>  Run with --no-verbose to prevent Bolt from displaying output<p>  a second time after the action is completed.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-LogLevel</code></td>
        <td>Set the log level for the console. Available options are<p>  trace, debug, info, warn, error, fatal.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-ClearCache</code></td>
        <td>Clear plugin, plan, and task caches before executing.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Params</code></td>
        <td>Parameters to a task or plan as json, a json file '@&lt;file>', or on stdin '-'.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Tmpdir</code></td>
        <td>The directory to upload and execute temporary files on the target.</td>
        <td align="center"></td>
     </tr>
         <tr>
        <td><code>-Noop</code></td>
        <td>See what changes Bolt will make without actually executing the changes.</td>
        <td align="center"></td>
     </tr>
   
  </tbody>
</table>


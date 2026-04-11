---
title: Transport configuration options
layout: default
---
# Transport configuration options

This page lists the configuration options that are available to each transport used by Bolt to connect
to targets. These options can be set in multiple locations:

- Under a `config` key in an [inventory file](inventory_files.md). 
- Under the `inventory-config` key in a [`bolt-defaults.yaml` file](bolt_defaults_reference.md).
- As top-level keys in a `bolt.yaml` file. ⛔ **The `bolt.yaml` file is deprecated.
  Use one of the other options above instead.**

## `transport`

The default transport to use when the transport for a target is not specified in the URI.


- **Default:** `ssh`



```yaml
transport: winrm
```

## `docker`

A map of configuration options for the docker transport.



### `cleanup`

Whether to clean up temporary files created on targets. When running commands on a target, Bolt might create temporary files. After completing the command, these files are automatically deleted. This value can be set to 'false' if you wish to leave these temporary files on the target.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
cleanup: false
```

### `host`

The target's hostname.

- **Type:** String
- **Pluggable:** true


```yaml
host: docker_host_production
```

### `interpreters`

A map of an extension name to the absolute path of an executable,  enabling you to override the shebang defined in a task executable. The extension can optionally be specified with the `.` character (`.py` and `py` both map to a task executable `task.py`) and the extension is case sensitive. When a target's name is `localhost`, Ruby tasks run with the Bolt Ruby interpreter by default.

- **Type:** Hash
- **Pluggable:** true


```yaml
interpreters:
  rb:
  - "/usr/bin/ruby"
  - "-r"
  - puppet
  ".py": "/usr/bin/python3"
```

### `run-as`

The user to run commands as after login. The run-as user must be different than the login user.

- **Type:** String
- **Pluggable:** true


```yaml
run-as: root
```

### `run-as-command`

The command to elevate permissions. Bolt appends the user and command strings to the configured `run-as-command` before running it on the target. This command must not require  aninteractive password prompt, and the `sudo-password` option is ignored when `run-as-command` is specified. The `run-as-command` must be specified as an array.

- **Type:** Array
- **Pluggable:** true


```yaml
run-as-command:
- sudo
- "-nkSEu"
```

### `service-url`

The URL of the host used for API requests.

- **Type:** String
- **Pluggable:** true


```yaml
service-url: https://api.example.com:8143
```

### `shell-command`

A shell command to wrap any exec commands in, such as `bash -lc`.

- **Type:** String
- **Pluggable:** true


```yaml
shell-command: bash -lc
```

### `sudo-executable`

The executable to use when escalating to the configured `run-as` user. This is useful when you want to escalate using the configured `sudo-password`, since `run-as-command` does not use `sudo-password` or support prompting. The command executed on the target is `<sudo-executable> -S -u <user> -p custom_bolt_prompt <command>`. **This option is experimental.**

- **Type:** String
- **Pluggable:** true


```yaml
sudo-executable: dzdo
```

### `sudo-password`

The password to use when changing users via `run-as`.

- **Type:** String
- **Pluggable:** true


```yaml
sudo-password: p@$$w0rd!
```

### `tmpdir`

The directory to upload and execute temporary files on the target.

- **Type:** String
- **Pluggable:** true


```yaml
tmpdir: "/tmp/bolt"
```

### `tty`

Whether to enable tty on exec commands.

- **Type:** Boolean
- **Pluggable:** true


```yaml
tty: true
```





## `jail`

A map of configuration options for the jail transport.



### `cleanup`

Whether to clean up temporary files created on targets. When running commands on a target, Bolt might create temporary files. After completing the command, these files are automatically deleted. This value can be set to 'false' if you wish to leave these temporary files on the target.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
cleanup: false
```

### `host`

The target's hostname.

- **Type:** String
- **Pluggable:** true


```yaml
host: docker_host_production
```

### `interpreters`

A map of an extension name to the absolute path of an executable,  enabling you to override the shebang defined in a task executable. The extension can optionally be specified with the `.` character (`.py` and `py` both map to a task executable `task.py`) and the extension is case sensitive. When a target's name is `localhost`, Ruby tasks run with the Bolt Ruby interpreter by default.

- **Type:** Hash
- **Pluggable:** true


```yaml
interpreters:
  rb:
  - "/usr/bin/ruby"
  - "-r"
  - puppet
  ".py": "/usr/bin/python3"
```

### `run-as`

The user to run commands as after login. The run-as user must be different than the login user.

- **Type:** String
- **Pluggable:** true


```yaml
run-as: root
```

### `run-as-command`

The command to elevate permissions. Bolt appends the user and command strings to the configured `run-as-command` before running it on the target. This command must not require  aninteractive password prompt, and the `sudo-password` option is ignored when `run-as-command` is specified. The `run-as-command` must be specified as an array.

- **Type:** Array
- **Pluggable:** true


```yaml
run-as-command:
- sudo
- "-nkSEu"
```

### `shell-command`

A shell command to wrap any exec commands in, such as `bash -lc`.

- **Type:** String
- **Pluggable:** true


```yaml
shell-command: bash -lc
```

### `sudo-executable`

The executable to use when escalating to the configured `run-as` user. This is useful when you want to escalate using the configured `sudo-password`, since `run-as-command` does not use `sudo-password` or support prompting. The command executed on the target is `<sudo-executable> -S -u <user> -p custom_bolt_prompt <command>`. **This option is experimental.**

- **Type:** String
- **Pluggable:** true


```yaml
sudo-executable: dzdo
```

### `sudo-password`

The password to use when changing users via `run-as`.

- **Type:** String
- **Pluggable:** true


```yaml
sudo-password: p@$$w0rd!
```

### `tmpdir`

The directory to upload and execute temporary files on the target.

- **Type:** String
- **Pluggable:** true


```yaml
tmpdir: "/tmp/bolt"
```

### `user`

The user name to login as.

- **Type:** String
- **Pluggable:** true


```yaml
user: bolt
```





## `local`

A map of configuration options for the local transport. The set of available options is platform dependent.

- ***nix:** `bundled-ruby`, `cleanup`, `extensions`, `interpreters`, `run-as`, `run-as-command`, `sudo-executable`, `sudo-password`, `tmpdir`
- **Windows:** `bundled-ruby`, `cleanup`, `extensions`, `interpreters`, `tmpdir`


### `bundled-ruby`

Whether to use the Ruby bundled with Bolt packages for local targets.

- **Type:** Boolean
- **Default:** `true`


```yaml
bundled-ruby: true
```

### `cleanup`

Whether to clean up temporary files created on targets. When running commands on a target, Bolt might create temporary files. After completing the command, these files are automatically deleted. This value can be set to 'false' if you wish to leave these temporary files on the target.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
cleanup: false
```

### `extensions`

A list of file extensions that are accepted for scripts or tasks on Windows. Scripts with these file extensions rely on the target's file type association to run. For example, if Python is installed on the system, a `.py` script runs with `python.exe`. The extensions `.ps1`, `.rb`, and `.pp` are always allowed and run via hard-coded executables.

- **Type:** Array
- **Pluggable:** true


```yaml
extensions:
- ".sh"
```

### `interpreters`

A map of an extension name to the absolute path of an executable,  enabling you to override the shebang defined in a task executable. The extension can optionally be specified with the `.` character (`.py` and `py` both map to a task executable `task.py`) and the extension is case sensitive. When a target's name is `localhost`, Ruby tasks run with the Bolt Ruby interpreter by default.

- **Type:** Hash
- **Pluggable:** true


```yaml
interpreters:
  rb:
  - "/usr/bin/ruby"
  - "-r"
  - puppet
  ".py": "/usr/bin/python3"
```

### `run-as`

The user to run commands as after login. The run-as user must be different than the login user.

- **Type:** String
- **Pluggable:** true


```yaml
run-as: root
```

### `run-as-command`

The command to elevate permissions. Bolt appends the user and command strings to the configured `run-as-command` before running it on the target. This command must not require  aninteractive password prompt, and the `sudo-password` option is ignored when `run-as-command` is specified. The `run-as-command` must be specified as an array.

- **Type:** Array
- **Pluggable:** true


```yaml
run-as-command:
- sudo
- "-nkSEu"
```

### `sudo-executable`

The executable to use when escalating to the configured `run-as` user. This is useful when you want to escalate using the configured `sudo-password`, since `run-as-command` does not use `sudo-password` or support prompting. The command executed on the target is `<sudo-executable> -S -u <user> -p custom_bolt_prompt <command>`. **This option is experimental.**

- **Type:** String
- **Pluggable:** true


```yaml
sudo-executable: dzdo
```

### `sudo-password`

The password to use when changing users via `run-as`.

- **Type:** String
- **Pluggable:** true


```yaml
sudo-password: p@$$w0rd!
```

### `tmpdir`

The directory to upload and execute temporary files on the target.

- **Type:** String
- **Pluggable:** true


```yaml
tmpdir: "/tmp/bolt"
```





## `lxd`

A map of configuration options for the LXD transport. The LXD transport is experimental and might include breaking changes between minor versions.



### `cleanup`

Whether to clean up temporary files created on targets. When running commands on a target, Bolt might create temporary files. After completing the command, these files are automatically deleted. This value can be set to 'false' if you wish to leave these temporary files on the target.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
cleanup: false
```

### `interpreters`

A map of an extension name to the absolute path of an executable,  enabling you to override the shebang defined in a task executable. The extension can optionally be specified with the `.` character (`.py` and `py` both map to a task executable `task.py`) and the extension is case sensitive. When a target's name is `localhost`, Ruby tasks run with the Bolt Ruby interpreter by default.

- **Type:** Hash
- **Pluggable:** true


```yaml
interpreters:
  rb:
  - "/usr/bin/ruby"
  - "-r"
  - puppet
  ".py": "/usr/bin/python3"
```

### `remote`

The LXD remote host to use.

- **Type:** String
- **Default:** `local`


```yaml
remote: myremote
```

### `run-as`

The user to run commands as after login. The run-as user must be different than the login user.

- **Type:** String
- **Pluggable:** true


```yaml
run-as: root
```

### `run-as-command`

The command to elevate permissions. Bolt appends the user and command strings to the configured `run-as-command` before running it on the target. This command must not require  aninteractive password prompt, and the `sudo-password` option is ignored when `run-as-command` is specified. The `run-as-command` must be specified as an array.

- **Type:** Array
- **Pluggable:** true


```yaml
run-as-command:
- sudo
- "-nkSEu"
```

### `shell-command`

A shell command to wrap any exec commands in, such as `bash -lc`.

- **Type:** String
- **Pluggable:** true


```yaml
shell-command: bash -lc
```

### `sudo-executable`

The executable to use when escalating to the configured `run-as` user. This is useful when you want to escalate using the configured `sudo-password`, since `run-as-command` does not use `sudo-password` or support prompting. The command executed on the target is `<sudo-executable> -S -u <user> -p custom_bolt_prompt <command>`. **This option is experimental.**

- **Type:** String
- **Pluggable:** true


```yaml
sudo-executable: dzdo
```

### `sudo-password`

The password to use when changing users via `run-as`.

- **Type:** String
- **Pluggable:** true


```yaml
sudo-password: p@$$w0rd!
```

### `tmpdir`

The directory to upload and execute temporary files on the target.

- **Type:** String
- **Pluggable:** true


```yaml
tmpdir: "/tmp/bolt"
```

### `tty`

Whether to enable tty on exec commands.

- **Type:** Boolean
- **Pluggable:** true


```yaml
tty: true
```





## `podman`

A map of configuration options for the podman transport.



### `cleanup`

Whether to clean up temporary files created on targets. When running commands on a target, Bolt might create temporary files. After completing the command, these files are automatically deleted. This value can be set to 'false' if you wish to leave these temporary files on the target.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
cleanup: false
```

### `host`

The target's hostname.

- **Type:** String
- **Pluggable:** true


```yaml
host: docker_host_production
```

### `interpreters`

A map of an extension name to the absolute path of an executable,  enabling you to override the shebang defined in a task executable. The extension can optionally be specified with the `.` character (`.py` and `py` both map to a task executable `task.py`) and the extension is case sensitive. When a target's name is `localhost`, Ruby tasks run with the Bolt Ruby interpreter by default.

- **Type:** Hash
- **Pluggable:** true


```yaml
interpreters:
  rb:
  - "/usr/bin/ruby"
  - "-r"
  - puppet
  ".py": "/usr/bin/python3"
```

### `run-as`

The user to run commands as after login. The run-as user must be different than the login user.

- **Type:** String
- **Pluggable:** true


```yaml
run-as: root
```

### `run-as-command`

The command to elevate permissions. Bolt appends the user and command strings to the configured `run-as-command` before running it on the target. This command must not require  aninteractive password prompt, and the `sudo-password` option is ignored when `run-as-command` is specified. The `run-as-command` must be specified as an array.

- **Type:** Array
- **Pluggable:** true


```yaml
run-as-command:
- sudo
- "-nkSEu"
```

### `shell-command`

A shell command to wrap any exec commands in, such as `bash -lc`.

- **Type:** String
- **Pluggable:** true


```yaml
shell-command: bash -lc
```

### `sudo-executable`

The executable to use when escalating to the configured `run-as` user. This is useful when you want to escalate using the configured `sudo-password`, since `run-as-command` does not use `sudo-password` or support prompting. The command executed on the target is `<sudo-executable> -S -u <user> -p custom_bolt_prompt <command>`. **This option is experimental.**

- **Type:** String
- **Pluggable:** true


```yaml
sudo-executable: dzdo
```

### `sudo-password`

The password to use when changing users via `run-as`.

- **Type:** String
- **Pluggable:** true


```yaml
sudo-password: p@$$w0rd!
```

### `tmpdir`

The directory to upload and execute temporary files on the target.

- **Type:** String
- **Pluggable:** true


```yaml
tmpdir: "/tmp/bolt"
```

### `tty`

Whether to enable tty on exec commands.

- **Type:** Boolean
- **Pluggable:** true


```yaml
tty: true
```





## `remote`

A map of configuration options for the remote transport.



### `run-on`

The proxy target that the task executes on.

- **Type:** String
- **Default:** `localhost`
- **Pluggable:** true


```yaml
run-on: proxy_target
```





## `ssh`

A map of configuration options for the ssh transport.



### `cleanup`

Whether to clean up temporary files created on targets. When running commands on a target, Bolt might create temporary files. After completing the command, these files are automatically deleted. This value can be set to 'false' if you wish to leave these temporary files on the target.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
cleanup: false
```

### `connect-timeout`

How long to wait in seconds when establishing connections. Set this value higher if you frequently encounter connection timeout errors when running Bolt.

- **Type:** Integer
- **Default:** `10`
- **Pluggable:** true


```yaml
connect-timeout: 15
```

### `disconnect-timeout`

How long to wait in seconds before force-closing a connection.

- **Type:** Integer
- **Default:** `5`
- **Pluggable:** true


```yaml
disconnect-timeout: 10
```

### `encryption-algorithms`

A list of encryption algorithms to use when establishing a connection to a target. Supported algorithms are defined by the Ruby net-ssh library and can be viewed [here](https://github.com/net-ssh/net-ssh#supported-algorithms). All supported, non-deprecated algorithms are available by default when this option is not used. To reference all default algorithms using this option, add 'defaults' to the list of supported algorithms.

- **Type:** Array
- **Pluggable:** true


```yaml
encryption-algorithms:
- defaults
- idea-cbc
```

### `extensions`

A list of file extensions that are accepted for scripts or tasks on Windows. Scripts with these file extensions rely on the target's file type association to run. For example, if Python is installed on the system, a `.py` script runs with `python.exe`. The extensions `.ps1`, `.rb`, and `.pp` are always allowed and run via hard-coded executables.

- **Type:** Array
- **Pluggable:** true


```yaml
extensions:
- ".sh"
```

### `host`

The target's hostname.

- **Type:** String
- **Pluggable:** true


```yaml
host: docker_host_production
```

### `host-key-algorithms`

A list of host key algorithms to use when establishing a connection to a target. Supported algorithms are defined by the Ruby net-ssh library and can be viewed [here](https://github.com/net-ssh/net-ssh#supported-algorithms). All supported, non-deprecated algorithms are available by default when this option is not used. To reference all default algorithms using this option, add 'defaults' to the list of supported algorithms.

- **Type:** Array
- **Pluggable:** true


```yaml
host-key-algorithms:
- defaults
- ssh-dss
```

### `host-key-check`

Whether to perform host key validation when connecting.

- **Type:** Boolean
- **Pluggable:** true


```yaml
host-key-check: false
```

### `interpreters`

A map of an extension name to the absolute path of an executable,  enabling you to override the shebang defined in a task executable. The extension can optionally be specified with the `.` character (`.py` and `py` both map to a task executable `task.py`) and the extension is case sensitive. When a target's name is `localhost`, Ruby tasks run with the Bolt Ruby interpreter by default.

- **Type:** Hash
- **Pluggable:** true


```yaml
interpreters:
  rb:
  - "/usr/bin/ruby"
  - "-r"
  - puppet
  ".py": "/usr/bin/python3"
```

### `kex-algorithms`

A list of key exchange algorithms to use when establishing a connection to a target. Supported algorithms are defined by the Ruby net-ssh library and can be viewed [here](https://github.com/net-ssh/net-ssh#supported-algorithms). All supported, non-deprecated algorithms are available by default when this option is not used. To reference all default algorithms using this option, add 'defaults' to the list of supported algorithms.

- **Type:** Array
- **Pluggable:** true


```yaml
kex-algorithms:
- defaults
- diffie-hellman-group1-sha1
```

### `load-config`

Whether to load system SSH configuration from '~/.ssh/config' and '/etc/ssh_config'.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
load-config: false
```

### `login-shell`

Which login shell Bolt should expect on the target. Supported shells are sh, bash, zsh, dash, ksh, powershell. **This option is experimental.**

- **Type:** String
- **Available values:** `sh`, `bash`, `zsh`, `dash`, `ksh`, `powershell`
- **Default:** `bash`
- **Pluggable:** true


```yaml
login-shell: powershell
```

### `mac-algorithms`

List of message authentication code algorithms to use when establishing a connection to a target. Supported algorithms are defined by the Ruby net-ssh library and can be viewed [here](https://github.com/net-ssh/net-ssh#supported-algorithms). All supported, non-deprecated algorithms are available by default when this option is not used. To reference all default algorithms using this option, add 'defaults' to the list of supported algorithms.

- **Type:** Array
- **Pluggable:** true


```yaml
mac-algorithms:
- defaults
- hmac-md5
```

### `password`

The password to use to login.

- **Type:** String
- **Pluggable:** true


```yaml
password: hunter2!
```

### `port`

The port to use when connecting to the target.

- **Type:** Integer
- **Pluggable:** true


```yaml
port: 22
```

### `private-key`

Either the path to the private key file to use for authentication, or a hash with the key `key-data` and the contents of the private key. Note that the key cannot be encrypted if using the `key-data` hash.

- **Type:** Hash, String
- **Pluggable:** true


```yaml
private-key: "~/.ssh/id_rsa"
```

### `proxyjump`

A jump host to proxy connections through, and an optional user to connect with.

- **Type:** String
- **Pluggable:** true


```yaml
proxyjump: jump.example.com
```

### `run-as`

The user to run commands as after login. The run-as user must be different than the login user.

- **Type:** String
- **Pluggable:** true


```yaml
run-as: root
```

### `run-as-command`

The command to elevate permissions. Bolt appends the user and command strings to the configured `run-as-command` before running it on the target. This command must not require  aninteractive password prompt, and the `sudo-password` option is ignored when `run-as-command` is specified. The `run-as-command` must be specified as an array.

- **Type:** Array
- **Pluggable:** true


```yaml
run-as-command:
- sudo
- "-nkSEu"
```

### `script-dir`

The subdirectory of the tmpdir to use in place of a randomized subdirectory for uploading and executing temporary files on the target. It's expected that this directory already exists as a subdir of tmpdir, which is either configured or defaults to `/tmp`.

- **Type:** String
- **Pluggable:** true


```yaml
script-dir: bolt_scripts
```

### `sudo-executable`

The executable to use when escalating to the configured `run-as` user. This is useful when you want to escalate using the configured `sudo-password`, since `run-as-command` does not use `sudo-password` or support prompting. The command executed on the target is `<sudo-executable> -S -u <user> -p custom_bolt_prompt <command>`. **This option is experimental.**

- **Type:** String
- **Pluggable:** true


```yaml
sudo-executable: dzdo
```

### `sudo-password`

The password to use when changing users via `run-as`.

- **Type:** String
- **Pluggable:** true


```yaml
sudo-password: p@$$w0rd!
```

### `tmpdir`

The directory to upload and execute temporary files on the target.

- **Type:** String
- **Pluggable:** true


```yaml
tmpdir: "/tmp/bolt"
```

### `tty`

Whether to enable tty on exec commands.

- **Type:** Boolean
- **Pluggable:** true


```yaml
tty: true
```

### `user`

The user name to login as.

- **Type:** String
- **Pluggable:** true


```yaml
user: bolt
```



## OpenSSH Config

Bolt's SSH transport uses the Ruby library `net-ssh`, which is a pure Ruby
implementation of the SSH2 client protocol. The library reads and uses some,
but not all, settings from the user's OpenSSH configuration file (typically
`~/.ssh/config`). OpenSSH configuration takes the [lowest
precedence](configuring_bolt.md#configuration-precedence), and any configurable
settings that you've set through Bolt, such as `port`, override the OpenSSH
settings. Bolt uses the following OpenSSH configuration options when using the
SSH transport:

### `Ciphers`

Ciphers allowed in order of preference. Multiple ciphers must be comma-separated.

### `Compression`

Whether to use compression.

### `CompressionLevel`

Compression level to use if compression is enabled.

### `GlobalKnownHostsFile`

Path to global host key database.

### `HostKeyAlgorithms`

Host key algorithms that the client wants to use in order of preference.

### `HostKeyAlias`

Use alias instead of real hostname when looking up or saving the host key in the host key database file.

### `HostName`

Host name to log.

### `IdentityFile`

File in which user's identity key is stored.

### `Port`

SSH port.

### `User`

Login user.

### `UserKnownHostsFile`

Path to local user's host key database.

## Native `ssh`

Bolt's SSH transport uses the Ruby library `net-ssh`, which is a pure Ruby
implementation of the SSH2 client protocol. While robust, the library lacks
support for some features and algorithms that are available in native SSH.
When you use the native SSH transport, Bolt uses the SSH executable you've
specified instead of using `net-ssh`.

Set the `native-ssh` config option or pass `--native-ssh` on the command line
to enable native SSH. When using the native SSH transport, a more limited set
of configuration options is available.

```yaml
ssh:
  native-ssh: true
```

> 🧪 The native SSH transport is experimental and is subject to
> breaking changes. To read more about the native SSH transport, see
> [Native SSH transport](experimental_features.md#native-ssh-transport).

### `batch-mode`

Whether to disable password querying. When set to `false`, SSH will fall back to prompting for a password if key authentication fails. This might cause Bolt to hang. To prevent Bolt from hanging, you can configure `ssh-command` to use an SSH utility such as sshpass that supports providing a password non-interactively. For more information, see [Providing a password non-interactively using `native-ssh`](troubleshooting.md#providing-a-password-non-interactively-using-native-ssh).

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true

```yaml
batch-mode: false
```

### `cleanup`

Whether to clean up temporary files created on targets. When running commands on a target, Bolt might create temporary files. After completing the command, these files are automatically deleted. This value can be set to 'false' if you wish to leave these temporary files on the target.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true

```yaml
cleanup: false
```

### `copy-command`

The command to use when copying files using native SSH. Bolt runs `<copy-command> <src> <dest>`. This option is used when you need support for features or algorithms that are not supported by the net-ssh Ruby library. **This option is experimental.** You can read more about this option in [Native SSH transport](experimental_features.md#native-ssh-transport).

- **Type:** Array, String
- **Default:** `["scp", "-r"]`
- **Pluggable:** true

```yaml
copy-command:
- scp
- "-r"
- "-F"
- "~/ssh-config/myconf"
```

### `host`

The target's hostname.

- **Type:** String
- **Pluggable:** true

```yaml
host: docker_host_production
```

### `host-key-check`

Whether to perform host key validation when connecting.

- **Type:** Boolean
- **Pluggable:** true

```yaml
host-key-check: false
```

### `interpreters`

A map of an extension name to the absolute path of an executable,  enabling you to override the shebang defined in a task executable. The extension can optionally be specified with the `.` character (`.py` and `py` both map to a task executable `task.py`) and the extension is case sensitive. When a target's name is `localhost`, Ruby tasks run with the Bolt Ruby interpreter by default.

- **Type:** Hash
- **Pluggable:** true

```yaml
interpreters:
  rb:
  - "/usr/bin/ruby"
  - "-r"
  - puppet
  ".py": "/usr/bin/python3"
```

### `native-ssh`

This enables the native SSH transport, which shells out to SSH instead of using the net-ssh Ruby library

- **Type:** Boolean
- **Default:** `false`

```yaml
native-ssh: true
```

### `port`

The port to use when connecting to the target.

- **Type:** Integer
- **Pluggable:** true

```yaml
port: 22
```

### `private-key`

Either the path to the private key file to use for authentication, or a hash with the key `key-data` and the contents of the private key. Note that the key cannot be encrypted if using the `key-data` hash.

- **Type:** Hash, String
- **Pluggable:** true

```yaml
private-key: "~/.ssh/id_rsa"
```

### `run-as`

The user to run commands as after login. The run-as user must be different than the login user.

- **Type:** String
- **Pluggable:** true

```yaml
run-as: root
```

### `run-as-command`

The command to elevate permissions. Bolt appends the user and command strings to the configured `run-as-command` before running it on the target. This command must not require  aninteractive password prompt, and the `sudo-password` option is ignored when `run-as-command` is specified. The `run-as-command` must be specified as an array.

- **Type:** Array
- **Pluggable:** true

```yaml
run-as-command:
- sudo
- "-nkSEu"
```

### `script-dir`

The subdirectory of the tmpdir to use in place of a randomized subdirectory for uploading and executing temporary files on the target. It's expected that this directory already exists as a subdir of tmpdir, which is either configured or defaults to `/tmp`.

- **Type:** String
- **Pluggable:** true

```yaml
script-dir: bolt_scripts
```

### `ssh-command`

The command and options to use when SSHing. This option is used when you need support for features or algorithms that are not supported by the net-ssh Ruby library. **This option is experimental.** You can read more about this  option in [Native SSH transport](experimental_features.md#native-ssh-transport).

- **Type:** Array, String
- **Default:** `ssh`
- **Pluggable:** true

```yaml
ssh-command:
- ssh
- "-o"
- Ciphers=chacha20-poly1305@openssh.com
```

### `sudo-executable`

The executable to use when escalating to the configured `run-as` user. This is useful when you want to escalate using the configured `sudo-password`, since `run-as-command` does not use `sudo-password` or support prompting. The command executed on the target is `<sudo-executable> -S -u <user> -p custom_bolt_prompt <command>`. **This option is experimental.**

- **Type:** String
- **Pluggable:** true

```yaml
sudo-executable: dzdo
```

### `sudo-password`

The password to use when changing users via `run-as`.

- **Type:** String
- **Pluggable:** true

```yaml
sudo-password: p@$$w0rd!
```

### `tmpdir`

The directory to upload and execute temporary files on the target.

- **Type:** String
- **Pluggable:** true

```yaml
tmpdir: "/tmp/bolt"
```

### `user`

The user name to login as.

- **Type:** String
- **Pluggable:** true

```yaml
user: bolt
```




## `winrm`

A map of configuration options for the winrm transport.



### `basic-auth-only`

Whether to force basic authentication. This option is only available when using SSL.

- **Type:** Boolean
- **Default:** `false`
- **Pluggable:** true


```yaml
basic-auth-only: true
```

### `cacert`

The path to the CA certificate.

- **Type:** String
- **Pluggable:** true


```yaml
cacert: "~/.puppetlabs/puppet/cert.pem"
```

### `cleanup`

Whether to clean up temporary files created on targets. When running commands on a target, Bolt might create temporary files. After completing the command, these files are automatically deleted. This value can be set to 'false' if you wish to leave these temporary files on the target.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
cleanup: false
```

### `connect-timeout`

How long to wait in seconds when establishing connections. Set this value higher if you frequently encounter connection timeout errors when running Bolt.

- **Type:** Integer
- **Default:** `10`
- **Pluggable:** true


```yaml
connect-timeout: 15
```

### `extensions`

A list of file extensions that are accepted for scripts or tasks on Windows. Scripts with these file extensions rely on the target's file type association to run. For example, if Python is installed on the system, a `.py` script runs with `python.exe`. The extensions `.ps1`, `.rb`, and `.pp` are always allowed and run via hard-coded executables.

- **Type:** Array
- **Pluggable:** true


```yaml
extensions:
- ".sh"
```

### `file-protocol`

Which file transfer protocol to use. Either `winrm` or `smb`. Using `smb` is recommended for large file transfers.

- **Type:** String
- **Available values:** `smb`, `winrm`
- **Default:** `winrm`
- **Pluggable:** true


```yaml
file-protocol: smb
```

### `host`

The target's hostname.

- **Type:** String
- **Pluggable:** true


```yaml
host: docker_host_production
```

### `interpreters`

A map of an extension name to the absolute path of an executable,  enabling you to override the shebang defined in a task executable. The extension can optionally be specified with the `.` character (`.py` and `py` both map to a task executable `task.py`) and the extension is case sensitive. When a target's name is `localhost`, Ruby tasks run with the Bolt Ruby interpreter by default.

- **Type:** Hash
- **Pluggable:** true


```yaml
interpreters:
  rb:
  - "/usr/bin/ruby"
  - "-r"
  - puppet
  ".py": "/usr/bin/python3"
```

### `password`

The password to use to login.

- **Type:** String
- **Pluggable:** true


```yaml
password: hunter2!
```

### `port`

The port to use when connecting to the target.

- **Type:** Integer
- **Pluggable:** true


```yaml
port: 22
```

### `realm`

The Kerberos realm (Active Directory domain) to authenticate against.

- **Type:** String
- **Pluggable:** true


```yaml
realm: BOLT.PRODUCTION
```

### `smb-port`

The port to use when connecting to the target when file-protocol is set to 'smb'.

- **Type:** Integer
- **Pluggable:** true


```yaml
smb-port: 445
```

### `ssl`

Whether to use secure https connections for WinRM.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
ssl: false
```

### `ssl-verify`

Whether to verify that the target's certificate matches the cacert.

- **Type:** Boolean
- **Default:** `true`
- **Pluggable:** true


```yaml
ssl-verify: false
```

### `tmpdir`

The directory to upload and execute temporary files on the target.

- **Type:** String
- **Pluggable:** true


```yaml
tmpdir: "/tmp/bolt"
```

### `user`

The user name to login as.

- **Type:** String
- **Pluggable:** true


```yaml
user: bolt
```







## Example files

### `bolt-defaults.yaml`

```yaml
# bolt-defaults.yaml
inventory-config:
  transport: winrm
  docker:
    cleanup: false
    host: docker_host_production
    interpreters: &1
      rb:
      - "/usr/bin/ruby"
      - "-r"
      - puppet
      ".py": "/usr/bin/python3"
    run-as: root
    run-as-command: &2
    - sudo
    - "-nkSEu"
    service-url: https://api.example.com:8143
    shell-command: bash -lc
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    tty: true
  jail:
    cleanup: false
    host: docker_host_production
    interpreters: *1
    run-as: root
    run-as-command: *2
    shell-command: bash -lc
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    user: bolt
  local:
    bundled-ruby: true
    cleanup: false
    extensions: &3
    - ".sh"
    interpreters: *1
    run-as: root
    run-as-command: *2
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
  lxd:
    cleanup: false
    interpreters: *1
    remote: myremote
    run-as: root
    run-as-command: *2
    shell-command: bash -lc
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    tty: true
  podman:
    cleanup: false
    host: docker_host_production
    interpreters: *1
    run-as: root
    run-as-command: *2
    shell-command: bash -lc
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    tty: true
  remote:
    run-on: proxy_target
  ssh:
    cleanup: false
    connect-timeout: 15
    disconnect-timeout: 10
    encryption-algorithms:
    - defaults
    - idea-cbc
    extensions: *3
    host: docker_host_production
    host-key-algorithms:
    - defaults
    - ssh-dss
    host-key-check: false
    interpreters: *1
    kex-algorithms:
    - defaults
    - diffie-hellman-group1-sha1
    load-config: false
    login-shell: powershell
    mac-algorithms:
    - defaults
    - hmac-md5
    password: hunter2!
    port: 22
    private-key: "~/.ssh/id_rsa"
    proxyjump: jump.example.com
    run-as: root
    run-as-command: *2
    script-dir: bolt_scripts
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    tty: true
    user: bolt
  winrm:
    basic-auth-only: true
    cacert: "~/.puppetlabs/puppet/cert.pem"
    cleanup: false
    connect-timeout: 15
    extensions: *3
    file-protocol: smb
    host: docker_host_production
    interpreters: *1
    password: hunter2!
    port: 22
    realm: BOLT.PRODUCTION
    smb-port: 445
    ssl: false
    ssl-verify: false
    tmpdir: "/tmp/bolt"
    user: bolt
```

### `inventory.yaml`

```yaml
# inventory.yaml
config:
  transport: winrm
  docker:
    cleanup: false
    host: docker_host_production
    interpreters: &1
      rb:
      - "/usr/bin/ruby"
      - "-r"
      - puppet
      ".py": "/usr/bin/python3"
    run-as: root
    run-as-command: &2
    - sudo
    - "-nkSEu"
    service-url: https://api.example.com:8143
    shell-command: bash -lc
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    tty: true
  jail:
    cleanup: false
    host: docker_host_production
    interpreters: *1
    run-as: root
    run-as-command: *2
    shell-command: bash -lc
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    user: bolt
  local:
    bundled-ruby: true
    cleanup: false
    extensions: &3
    - ".sh"
    interpreters: *1
    run-as: root
    run-as-command: *2
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
  lxd:
    cleanup: false
    interpreters: *1
    remote: myremote
    run-as: root
    run-as-command: *2
    shell-command: bash -lc
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    tty: true
  podman:
    cleanup: false
    host: docker_host_production
    interpreters: *1
    run-as: root
    run-as-command: *2
    shell-command: bash -lc
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    tty: true
  remote:
    run-on: proxy_target
  ssh:
    cleanup: false
    connect-timeout: 15
    disconnect-timeout: 10
    encryption-algorithms:
    - defaults
    - idea-cbc
    extensions: *3
    host: docker_host_production
    host-key-algorithms:
    - defaults
    - ssh-dss
    host-key-check: false
    interpreters: *1
    kex-algorithms:
    - defaults
    - diffie-hellman-group1-sha1
    load-config: false
    login-shell: powershell
    mac-algorithms:
    - defaults
    - hmac-md5
    password: hunter2!
    port: 22
    private-key: "~/.ssh/id_rsa"
    proxyjump: jump.example.com
    run-as: root
    run-as-command: *2
    script-dir: bolt_scripts
    sudo-executable: dzdo
    sudo-password: p@$$w0rd!
    tmpdir: "/tmp/bolt"
    tty: true
    user: bolt
  winrm:
    basic-auth-only: true
    cacert: "~/.puppetlabs/puppet/cert.pem"
    cleanup: false
    connect-timeout: 15
    extensions: *3
    file-protocol: smb
    host: docker_host_production
    interpreters: *1
    password: hunter2!
    port: 22
    realm: BOLT.PRODUCTION
    smb-port: 445
    ssl: false
    ssl-verify: false
    tmpdir: "/tmp/bolt"
    user: bolt
```

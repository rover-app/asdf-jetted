<div align="center">

# asdf-jetted [![Build](https://github.com/DocumaticAI/asdf-jetted/actions/workflows/build.yml/badge.svg)](https://github.com/DocumaticAI/asdf-jetted/actions/workflows/build.yml) [![Lint](https://github.com/DocumaticAI/asdf-jetted/actions/workflows/lint.yml/badge.svg)](https://github.com/DocumaticAI/asdf-jetted/actions/workflows/lint.yml)

[jetted](https://github.com/DocumaticAI/jetted) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add jetted
# or
asdf plugin add jetted https://github.com/DocumaticAI/asdf-jetted.git
```

jetted:

```shell
# Show all installable versions
asdf list-all jetted

# Install specific version
asdf install jetted latest

# Set a version globally (on your ~/.tool-versions file)
asdf global jetted latest

# Now jetted commands are available
jetted --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/DocumaticAI/asdf-jetted/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Isaac Harris-Holt](https://github.com/DocumaticAI/)

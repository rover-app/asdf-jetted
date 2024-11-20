<div align="center">

# asdf-jtd-codegen [![Build](https://github.com/DocumaticAI/asdf-jtd-codegen/actions/workflows/build.yml/badge.svg)](https://github.com/DocumaticAI/asdf-jtd-codegen/actions/workflows/build.yml) [![Lint](https://github.com/DocumaticAI/asdf-jtd-codegen/actions/workflows/lint.yml/badge.svg)](https://github.com/DocumaticAI/asdf-jtd-codegen/actions/workflows/lint.yml)

[jtd-codegen](https://github.com/DocumaticAI/json-typedef-codegen) plugin for the [asdf version manager](https://asdf-vm.com).

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
asdf plugin add jtd-codegen
# or
asdf plugin add jtd-codegen https://github.com/DocumaticAI/asdf-jtd-codegen.git
```

jtd-codegen:

```shell
# Show all installable versions
asdf list-all jtd-codegen

# Install specific version
asdf install jtd-codegen latest

# Set a version globally (on your ~/.tool-versions file)
asdf global jtd-codegen latest

# Now jtd-codegen commands are available
jtd-codegen --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/DocumaticAI/asdf-jtd-codegen/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Isaac Harris-Holt](https://github.com/DocumaticAI/)

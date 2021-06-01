# shell-password-generator

Studying shell scripting by attempting to write simple yet practical shell script for generating robust passwords of a given length.

### Straight from the head idea (or just bad google search)

Use `openssl`

```bash
$ openssl rand -base64 10
4zJUtPlFYgIuEA==
```

Problems:

* depends on `openssl`

* number of bytes should be divisible by 3 or else encoded string will be padded with `=` sign:
    ```bash
    $ openssl rand -base64 10
    oQe0bVNo8FUoNg==
    $ openssl rand -base64 11
    T5r1cG/Sm4+JFZk=
    $ openssl rand -base64 12
    9jA9wgPkcYfWwb4j
    ```

Closed that idea after `34e7f74` commit. Fully removed original script after `e822d2d` commit.

### More thought out aproach (or just good google search)

Use `/dev/urandom` with `tr`

Obvious pros:

* `/dev/urandom` is on every system

* `tr` is in GNU Core Utilities, so is also almost everywhere

* complexity of a password can be tweaked by including of excluding characters of `/dev/urandom` output with `tr` flags

### Continue to expand on a password character set

 To make passwords more secure descided to add [OWASP Password Special Characters](https://owasp.org/www-community/password-special-characters)

 After some time managed to escape all needed charactes is string

 ```
ALNUM_PLUS_OWASP_CHARSET="A-Za-z0-9\!\"\#\$\&\'\(\)\*\+\,\-\.\/\:\\\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~"
 ```
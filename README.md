# shell-password-generator

Studying shell scripting by attempting to write simple yet practical shell script for generating robust passwords of a given length.

### Straight from the head idea (or just bad google search)

Use `openssl`

```bash
$ openssl rand -base64 10
4zJUtPlFYgIuEA==
```

Problems:

* `openssl` needs to be installed on a system
* is pseudo-random according to `man` page:
    >>>
        NAME
        openssl-rand, rand - generate pseudo-random bytes

        SYNOPSIS
        openssl rand [-help] [-out file] [-rand file...]  [-writerand file] [-base64] [-hex] num

        DESCRIPTION
        This command generates num random bytes using a cryptographically secure pseudo random number generator (CSPRNG).
    >>>

* number of bytes should be divisible by 3 or else encoded string will be padded with `=` sign:
    ```bash
    $ openssl rand -base64 10
    oQe0bVNo8FUoNg==
    $ openssl rand -base64 11
    T5r1cG/Sm4+JFZk=
    $ openssl rand -base64 12
    9jA9wgPkcYfWwb4j
    ```


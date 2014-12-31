# hxenv - manage Haxe environment

Hxenv is Haxe environment managing tool inspired by rbenv and plenv.

## INSTALLATION

### Basic GitHub Checkout

This will get you going with the latest version of hxenv and make it
easy to fork and contribute any changes back upstream.

1. Check out hxenv into `~/.hxenv`.

    ~~~ sh
    $ git clone https://github.com/MisumiRize/hxenv.git ~/.hxenv
    ~~~

2. Add `~/.hxenv/bin` to your `$PATH` for access to the `hxenv`
  command-line utility.

    ~~~ sh
    $ echo 'export PATH="$HOME/.hxenv/bin:$PATH"' >> ~/.bash_profile
    ~~~

    **Ubuntu Desktop note**: Modify your `~/.bashrc` instead of `~/.bash_profile`.

    **Zsh note**: Modify your `~/.zshrc` file instead of `~/.bash_profile`.

3. Add `hxenv init` to your shell to enable shims and autocompletion.

    ~~~ sh
    $ echo 'eval "$(hxenv init -)"' >> ~/.bash_profile
    ~~~

    _Same as in previous step, use `~/.bashrc` on Ubuntu, or `~/.zshrc` for Zsh._

4. Restart your shell so that PATH changes take effect. (Opening a new
  terminal tab will usually do it.) Now check if hxenv was set up:

    ~~~ sh
    $ type hxenv
    #=> "hxenv is a function"
    ~~~

#### Upgrading

If you've installed hxenv manually using git, you can upgrade your
installation to the cutting-edge version at any time.

~~~ sh
$ cd ~/.hxenv
$ git pull
~~~

To use a specific release of hxenv, check out the corresponding tag:

~~~ sh
$ cd ~/.hxenv
$ git fetch
$ git checkout 2.0.0
~~~

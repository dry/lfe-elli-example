# LFE / Elli Example Application

This is a very simple application demonstrating the use of the [Elli](https://github.com/knutin/elli) webserver and Lisp Flavored Erlang. This example was created with LFE v0.8.

## Running It

The skeleton and supporting files for this application were generated with [lfetool](https://github.com/lfe/lfetool) so make sure that's installed. The Makefile has a shell target so all you have to do is:

```shell
    $ make shell
```

This will fetch the dependencies, compile and start the LFE shell, which should look something like this:

```shell
    Erlang R16B03-1 (erts-5.10.4) [source] [64-bit] [smp:8:8] ...

    LFE Shell V5.10.4 (abort with ^G)
    >
```

You can then start the application is the same way that you would an Erlang one:

```shell
     Erlang R16B03-1 (erts-5.10.4) [source] [64-bit] [smp:8:8] ...

    LFE Shell V5.10.4 (abort with ^G)
    > (application:start 'lfe-elli-example)
    ok
```

Then go to [http://localhost:3000](http://localhost:3000).

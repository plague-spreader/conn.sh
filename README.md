# conn.sh
Bare-bones connection manager

# Prerequisites

* Install `fzf` [fuzzy finder](https://github.com/junegunn/fzf)
* Create `${XDG_CONFIG_HOME}/connections_file`; check the next subsection

## `connections_file`

It consists of lines in the form of `<url> <description>`. Here's an example:

```
ssh://some-server.domain.com url description of my beautiful server
telnet://localhost:1234 mammata
some-obscure-protocol://somewhere suarta
```

Then the URL is handled by xdg-open so you need to set-up your own URL-handling
script (or use the default ones if available).

## How to set-up a URL-handler script

* Create your `.desktop` entry, more info [here](wiki.archlinux.org/title/Desktop_entries)
* Associate your scheme handler with `xdg-settings`

Some scheme handlers are provided in the `scheme-handlers` folder; for using
them you need to do the following:

* Put the .desktop file in `${XDG_DATA_HOME}`
* Put the .sh file in `${PATH}`
* `xdg-settings set default-url-scheme-handler <scheme> <.desktop file>`

Of course create your own handlers for your own purposes, I cannot do them all
and you might have different needs from my own.

# Usage
After following the prerequisites steps you only need to launch

`conn.sh`

and use `fzf` for selecting the connection you want to use.

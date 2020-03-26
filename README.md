# link-parser-js
[Emscripten](https://github.com/emscripten-core/emscripten) port of link-parser, the CLI for [the CMU Link Grammar natural language parser](https://github.com/opencog/link-grammar)

## Motivation

I wanted a version [of link-parser] that is more portable, so it can be easily installed and run in any environment with node.js, including node.js cloud hosting platforms and a variety of Unix/Windows developer machines.

## Usage

Same as the original `link-parser` program. For details, run `link-parser-js --help` and or see [the official documentation](https://github.com/opencog/link-grammar/#running-the-program).

*Note that loading custom dictionaries or input files from the filesystem is not currently supported. Pull Requests welcome.*

Example:

```
> echo This is a sentence. | link-parser-js en -constituents=1
constituents set to 1
link-grammar: Info: Dictionary found at ./data/en/4.0.dict
Debug: Dictionary "en/4.0.dict": Locale "en_US.UTF-8" unknown
link-grammar: Info: Dictionary 'en/4.0.dict': No locale definition - "C.UTF-8" will be used.
link-grammar: Info: Dictionary version 5.8.0, locale C.UTF-8
link-grammar: Info: Library version link-grammar-5.8.0. Enter "!help" for help.
linkparser> Found 4 linkages (4 had no P.P. violations)
        Linkage 1, cost vector = (UNUSED=0 DIS= 0.00 LEN=6)

    +--------------Xp--------------+
    +----->WV----->+---Ost---+     |
    +-->Wd---+-Ss*b+  +-Ds**c+     |
    |        |     |  |      |     |
LEFT-WALL this.p is.v a sentence.n .

(S (NP this.p)
   (VP is.v
       (NP a sentence.n))
   .)

Press RETURN for the next linkage.
linkparser> Bye.

```

In addition to being used in the console (as in the above example), this program is intended to be used programatically with [node.js's child_process module](https://nodejs.org/api/child_process.html).

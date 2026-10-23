# vonBraun

The vonBraun connector (`vonbraun` CLI). It connects out to the relay, pushes
[Granada](https://github.com/daskinnyman/granada-release) pages and appends
review comments to `review-inbox.jsonl`.

This repository holds only the public install artifacts (the Homebrew formula,
the curl installer and the release tarballs). The source repository is private.

## Install

Needs Node.js 22.4+ and a machine that runs Granada.

### Homebrew

```bash
brew tap daskinnyman/vonbraun https://github.com/daskinnyman/vonbraun-release && brew install vonbraun
```

Update with `brew upgrade vonbraun`.

### curl

```bash
curl -fsSL https://github.com/daskinnyman/vonbraun-release/releases/latest/download/install.sh | sh
```

The script checks Node, downloads the latest tarball and runs `npm i -g` with the
npm prefix you already use.

## Next step

```bash
vonbraun --version
vonbraun init
```

## Links

- [Releases](https://github.com/daskinnyman/vonbraun-release/releases)

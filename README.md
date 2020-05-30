# pdf-archiver.io Website Repository

Files that are used to build the [PDF Archiver's](https://pdf-archiver.github.io) website using [Jekyll](https://jekyllrb.com).

## Requirements and dev environment

Docker:
```bash
export JEKYLL_VERSION=3.8
docker run --rm \
  -p 4000:4000 --volume="$PWD:/srv/jekyll" \
  --volume="$PWD/vendor/bundle:/usr/local/bundle" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve --incremental
```

As per Jekyll's Quick-start instructions, a functioning build-environment can be set up the following way. This implies a working Ruby environment (already present on a Mac).

```
git clone https://github.com/PDF-Archiver/pdf-archiver.github.io.git
cd pdf-archiver.github.io
bundle install
```

Bundler will install all dependencies of Jekyll and required Ruby modules. To run a development version of the site on `http://127.0.0.1:4000` (unless you change the defaults), simply run

```
bundle exec jekyll serve
```

from the toplevel directory of the website repository. `jekyll serve` should suffice when your Ruby environment is in your `PATH`.


## Automatic Deployment

Changes will be pushed automatically by GitHub Actions.

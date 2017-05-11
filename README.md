# Danger

[Danger](http://danger.systems) runs during our CI process, and lets us
ensure our commits, pull requests, and more meet a minimum level
of quality.

## Setup

Enable Danger for a project within the [ministryofjustice
organization](https://github.com/ministryofjustice).

### Configure Danger to use this repo's Dangerfile

Commit a `Dangerfile` containing linking to this repo:

```ruby
danger.import_dangerfile(github: 'ministryofjustice/danger')
```

### If you're running Ruby

Add `danger` to your `Gemfile`.

```ruby
gem 'danger'
```

#### Run Danger in CI

Add Danger to `.travis.yml`:

```yaml
before_script:
  - bundle exec danger
```

… or add it to your build matrix:

```yaml
matrix:
  include:
    - rvm: 2.3.1
      script:
        - bundle exec danger
```

### If you're not running Ruby

If Danger is your only Ruby dependency, you probably don't want to have
a Gemfile cluttering up your repo. In that case, you can (probably) use
this command in the Travis config above:

```bash
rbenv global 2.3.1 && gem install danger --version '~> 5.0' && danger
```

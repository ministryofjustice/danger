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

Add `ministryofjustice-danger` to your `Gemfile`.

```ruby
gem 'ministryofjustice-danger'
```

#### Run Danger in Travis

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

And add the `DANGER_GITHUB_API_TOKEN` as an environment variable in
Travis's repo settings, which are at a URL like
`https://travis-ci.org/ministryofjustice/[repo]/settings`. The API token
itself is in Rattic (search for `Danger`).

#### Run Danger in CircleCI

Just add `bundle exec danger` to your `circle.yml`, either as an extra
step in your `test` overrides, or in a new `pre` section. You'll need
to add the `DANGER_GITHUB_API_TOKEN` to the environment variables like
with Travis, and [Danger
recommend](http://danger.systems/guides/getting_started.html#setting-up-danger-to-run-on-your-ci)
setting “only build pull requests” in the advanced settings.

### If you're not running Ruby

If Danger is your only Ruby dependency, you probably don't want to have
a Gemfile cluttering up your repo. In that case, you can (probably) use
this command in the Travis config above:

```bash
rbenv global 2.3.1 && gem install ministryofjustice-danger --version '~> 0.1' && danger
```

## Updating the gem

e.g. to add new runtime dependencies

1. Make your changes to `ministryofjustice-danger.gemspec`

2. Update the version in  `ministryofjustice-danger.gemspec`

3. Build the gem
```
gem build ministryofjustice-danger.gemspec
```

4. Publish to [Rubygems](https://rubygems.org)
```
gem push ministryofjustice-danger-[VERSION].gem
```

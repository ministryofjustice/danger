# Danger

[Danger](http://danger.systems) runs during our CI process, and lets us
ensure our commits, pull requests, and more meet a minimum level
of quality.

[![Gem Version](https://badge.fury.io/rb/ministryofjustice-danger.svg)](https://badge.fury.io/rb/ministryofjustice-danger)

# Setup

## Add Danger to your [Ministry of Justice](https://github.com/ministryofjustice) Ruby project

1. Add the following to your Gemfile;

```
group :development do
  gem 'ministryofjustice-danger'
end
```

2. `bundle install`

3. Create a Dangerfile that imports the central MoJ Dangerfile

```bash
echo "danger.import_dangerfile(github: 'ministryofjustice/danger')" > Dangerfile
```

Commit and push your changes.

## Run Danger via [Travis CI](https://travis-ci.org)

1. Add Danger to your `.travis.yml` (use whatever ruby version (>= 2.3.0) is appropriate)

```yaml
rvm: 2.3.3

script:
  - bundle exec danger
```

… or add it to your build matrix:

```yaml
matrix:
  include:
    - rvm: 2.3.3
      script:
        - bundle exec danger
```

Commit and push the changes.

2. Add the MoJ Dangerbot API token to Travis;

This assumes your project has already been added to Travis.

    https://travis-ci.org/ministryofjustice/[your project]/settings

[Add the environment variable](https://docs.travis-ci.com/user/environment-variables/#Defining-Variables-in-Repository-Settings)
`DANGER_GITHUB_API_TOKEN`, with the value
from the password field of the `MOJ Danger bot Github API token` entry
in Rattic.

Danger will now run against every PR which is raised, and will create comments
about any errors that it finds (the comments will be removed once the issues
are fixed).

## Run Danger via [CircleCI](https://circleci.com)

Just add `bundle exec danger` to your `circle.yml`, either as an extra
step in your `test` overrides, or in a new `pre` section. You'll need
to add the `DANGER_GITHUB_API_TOKEN` to the environment variables,
like with Travis, and
[Danger recommend](http://danger.systems/guides/getting_started.html#setting-up-danger-to-run-on-your-ci)
setting “only build pull requests” in the advanced settings.

## If you're not running Ruby

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

## Fixing your commits

To keep Danger happy, you will need to amend commits that you have already pushed.

This [Github article](https://help.github.com/articles/changing-a-commit-message/)
describes a process for doing this. But, please use [--force-with-lease](https://developer.atlassian.com/blog/2015/04/force-with-lease/)
instead of `--force` when pushing your amendments.

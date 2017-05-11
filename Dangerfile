commit_lint.check

if status_report.values.flatten.any?
  markdown <<~DANGER_EXPLANATION
  At the Ministry of Justice, we use \
  [Danger](https://github.com/ministryofjustice/danger) to ensure our \
  commits and pull requests follow [our style \
  rules](https://github.com/ministryofjustice/danger/blob/master/Dangerfile).

  If you think one of the points here has been raised in error (or \
  shouldn't be in our style guide), open an issue or pull request on [our \
  Danger config](https://github.com/ministryofjustice/danger).
  DANGER_EXPLANATION
end

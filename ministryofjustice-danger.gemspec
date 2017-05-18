# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'ministryofjustice-danger'
  s.version = '0.1.2'
  s.authors = ['Ministry of Justice']
  s.email = ['tools+danger@digital.justice.gov.uk']
  s.license = 'MIT'
  s.date = '2017-05-18'

  s.required_ruby_version = '>= 2.3.0'

  s.summary = 'Add Danger and linter gems'
  s.homepage = 'https://github.com/ministryofjustice/danger'

  s.files = %w(README.md LICENSE)
  s.extra_rdoc_files = ['README.md']
  s.rdoc_options = ['--main', 'README.md']

  s.add_runtime_dependency 'danger', '~> 5'
  s.add_runtime_dependency 'danger-commit_lint', '~> 0'
end

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'onlyoffice_webdriver_wrapper/version'
Gem::Specification.new do |s|
  s.name = 'onlyoffice_webdriver_wrapper'
  s.version = OnlyofficeWebdriverWrapper::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9'
  s.authors = ['Pavel Lobashov', 'Olge Nazarov']
  s.summary = 'ONLYOFFICE Webdriver Wrapper Gem'
  s.description = 'onlyoffice_webdriver_wrapper'
  s.email = ['shockwavenn@gmail.com', 'dafttrick@gmail.com']
  s.files = `git ls-files lib LICENSE.txt README.md`.split($RS)
  s.homepage = 'https://github.com/onlyoffice-testing-robot/onlyoffice_webdriver_wrapper'
  s.add_runtime_dependency('aws-sdk', '~> 2')
  s.add_runtime_dependency('headless', '~> 2')
  s.add_runtime_dependency('onlyoffice_logger_helper', '~> 1')
  # since v2.1 page-object remove capability with Selenium Platform
  s.add_runtime_dependency('page-object', '~> 2.0.0')
  s.add_runtime_dependency('selenium-webdriver', '3.5.2')
  # Since `watir` 6.8 -  `cannot load such file -- watir/extensions/select_text`
  # See: https://github.com/watir/watir/issues/635
  s.add_runtime_dependency('watir', '~> 6.7.0')
  s.license = 'AGPL-3.0'
end

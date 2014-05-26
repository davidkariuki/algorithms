# A sample Guardfile
# More info at https://github.com/guard/guard#readme

notification :tmux,
  display_message: true,
  timeout: 5,
  default_message_format: '%s >> %s',
  line_separator: ' > ',
  color_location: 'status-left-bg'

guard :rspec, cmd: 'CODECLIMATE_REPO_TOKEN=50519688b999b0be353fe4e18582c3abeec060ce42c13bf231947c540e61d0b7 bundle exec rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/algorithms_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end


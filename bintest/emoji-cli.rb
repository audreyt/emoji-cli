require 'open3'

BIN_PATH = File.join(File.dirname(__FILE__), "../mruby/bin/emoji-cli")

assert('poop') do
  output, status = Open3.capture2(BIN_PATH, "poop")

  assert_true status.success?, "Process did not exit cleanly"
  assert_include output.force_encoding("utf-8"), "Copied 💩 !"
end

assert('version') do
  output, status = Open3.capture2(BIN_PATH, "version")

  assert_true status.success?, "Process did not exit cleanly"
  assert_include output, "v0.0.3"
end

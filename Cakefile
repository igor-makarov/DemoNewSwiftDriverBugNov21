require 'yaml'

project.name = 'DemoNewSwiftDriverBug'

application_for :ios, '9.0' do |target|
  target.name = 'DemoNewSwiftDriverBug'
  target.all_configurations.each do |config|
    config.product_bundle_identifier = 'com.igor.demonewswiftdriverbug'
  end

  rswift_file = '$SRCROOT/DemoNewSwiftDriverBug/Resources/Generated/R.generated.swift'
  rswift_generate_script = <<-GENERATE
  "${PODS_ROOT}/R.swift/rswift" generate "#{rswift_file}"
  GENERATE
  target.pre_shell_script_build_phase('R.swift generate', rswift_generate_script) do |phase|
    phase.input_paths = ['$TEMP_DIR/rswift-lastrun']
    phase.output_paths = [rswift_file]
  end
end

project.after_save do
  system "rm -rf \"#{project.name}.xcodeproj/xcshareddata/xcschemes\""
end

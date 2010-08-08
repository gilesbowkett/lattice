task :default do
  %w{grid_test.rb
     array_test.rb
     horizontal_explosions_test.rb
     vertical_explosions_test.rb
     combined_explosions_test.rb
     question_balls_test.rb}.each do |test|
       sh "ruby #{File.join(File.dirname(__FILE__), "/test/", test)}"
     end
end

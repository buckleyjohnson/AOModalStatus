Pod::Spec.new do |s|
      #1.
      s.name               = "AOModalStatus"
      #2.
      s.version            = "1.0.0"
      #3.
      s.summary         = "Sort description of 'AOModalStatus' framework"
      #4.
      s.homepage        = "http://www.mindremind.com"
      #5.
      s.license              = "MIT"
      #6.
      s.author               = "AKanjariya"
      #7.
      s.platform            = :ios, "10.0"
      #8.
      s.source              = { :git => "URL", :tag => "1.0.0" }
      #9.
      s.source_files     = "AOModalStatus", "AOModalStatus/**/*.{h,m,swift}"
      s.resource_bundles = {
      'AOModalStatus' => ['AOModalStatus/**/*.xib']
      }
end

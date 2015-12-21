Pod::Spec.new do |s|
  s.name                = "UITableView+PullToZoomInTableHeaderView"
  s.version             = "1.0.0"
  s.summary             = "Pull to zoom in tableHeaderView"
  s.homepage            = "https://github.com/Tinghui/UITableView-PullToZoomInTableHeaderView"
  s.license             = { :type => "MIT", :file => "LICENSE.md" }
  s.author              = { 'Tinghui' => 'tinghui.zhang3@gmail.com' }
  s.platform            = :ios, '6.0'
  s.requires_arc        = true
  s.source_files        = "Source/*.{h,m}"
  s.source              = { :git => "https://github.com/Tinghui/UITableView-PullToZoomInTableHeaderView.git", :tag => s.version }
end

Pod::Spec.new do |s|
		s.name 				= "Font"
		s.version 			= "2.3.0"
		s.summary         	= "Sort description of 'Font' framework"
	    s.homepage        	= "https://github.com/amine2233/Font"
	    s.license           = { type: 'MIT', file: 'LICENSE' }
	    s.author            = { 'Amine Bensalah' => 'amine.bensalah@outlook.com' }
	    s.ios.deployment_target = '10.0'
	    s.osx.deployment_target = '10.12'
	    s.tvos.deployment_target = '10.0'
	    s.watchos.deployment_target = '3.0'
	    s.requires_arc = true
	    s.source            = { :git => "https://github.com/amine2233/Font.git", :tag => s.version.to_s }
	    s.resource			= "Sources/Resources/**/*.ttf","Sources/Resources/**/*.otf"
	    s.source_files      = "Sources/**/*.swift"
  		s.module_name = s.name
  		s.swift_version = "5.0"
  		s.pod_target_xcconfig = {
    		'SWIFT_VERSION' => s.swift_version.to_s
  		}
	end

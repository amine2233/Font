Pod::Spec.new do |s|
		s.name 				= "Font"
		s.version 			= "0.1.3"
		s.summary         	= "Sort description of 'Font' framework"
	    s.homepage        	= "http://www.welovemac.fr"
	    s.license           = "MIT"
	    s.author            = "Amine Bensalah"
	    s.platform          = :ios, "11.3"
	    s.source            = { :git => "https://github.com/amine2233/Font.git", :tag => "0.1.3" }
	    s.resource			= "Sources/Resources/**/*.ttf","Sources/Resources/**/*.otf"
	    s.source_files      = "Sources/Common/*.swift"
  		s.ios.source_files  = "Sources/UIKit/*.swift"
  		s.osx.source_files  = "Sources/AppKit/*.swift"
	    s.swift_version 	= "4.1"
	    s.module_name   	= "Font"
	end

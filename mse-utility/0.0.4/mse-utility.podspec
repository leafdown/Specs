#
#  Be sure to run `pod spec lint mse-utility.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "mse-utility"
  s.version      = "0.0.4"
  s.summary      = "Cross platform utility for Meeting ."
  s.module_name   = "MSEUtility"
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
  s.description  = <<-DESC
          Time, String, HTTP Download and some others"
                   DESC
  
  s.homepage     = "http://www.webex.com/"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "Copyright © 2012-2018 Webex"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "Palawan" => "palawan@cisco.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.ios.deployment_target = "11.0"
  #s.osx.deployment_target = "10.10"
  
  
  #  When using multiple platforms
  
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #
  
  s.source       = { :git => "ssh://git@bitbucket-eng-chn-sjc1.cisco.com:7999/cctgfork/webex-meetingservice-utility.git", :branch => "feature/f9190" }

  
  s.public_header_files = 'src/include/*.h','src/include/catch/*.hpp'
  s.source_files = 'src/include/*.h','src/include/catch/*.hpp'

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #
  
   
  s.subspec 'include' do |ss|
    ss.source_files = 'src/include/**/*.{hpp,h}' 
    ss.public_header_files = 'src/include/*.h','src/include/catch/*.hpp'
  end
  
  
  s.subspec 'common-function' do |ss|
    ss.source_files = 'src/common-function/**/*.{pch,h,m,mm,cpp}'
    ss.ios.exclude_files = "src/common-function/win","src/common-function/unittest","src/common-function/mac"
    
    ss.dependency 'mse-utility/include'
   # ss.osx.exclude_files = "src/common-function/win","src/common-function/unittest","src/common-function/ios"
  end
  
  s.subspec 'platform' do |ss|
    ss.source_files = 'src/platform/ios/**/*.{pch,h,m,mm,cpp}' 
    ss.ios.exclude_files = "src/platform/win","src/platform/mac","src/platform/ios/MSEUtility/frameworks","src/platform/ios/MSEUtilityTests"
   # ss.osx.exclude_files = "src/platform/win","src/platform/ios"
    ss.dependency 'mse-utility/include' 
  end
 

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  s.framework  = "Foundation"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.library = "c++"
  s.prefix_header_file = 'src/platform/ios/MSEUtility/MSEUtility_Prefix.pch'
  #s.prefix_header_contents = '#import "MSEUtility_Prefix.pch"' 
  s.xcconfig = {
  	   'OTHER_CPLUSPLUSFLAGS' => '-fno-aligned-allocation -fmodules -fcxx-modules ',
       'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
       'CLANG_CXX_LIBRARY' => 'libc++',
       'OTHER_LDFLAGS' => '-lObjC',
       'GCC_INPUT_FILETYPE' => 'sourcecode.cpp.objcpp',
       'HEADER_SEARCH_PATHS' => '"./", "src/", "src/include", "src/include/catch"'
  }
  s.dependency "AFNetworking", '~> 3.1'

end

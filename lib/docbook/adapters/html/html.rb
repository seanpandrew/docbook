module Docbook
  module Adapters
      
    module HTML
      def initialize(args ={})
         super
         @xsl_extension = "html"
         @xsl_stylesheet = "xsl/html.xsl"
       end

       def before_render
         xsl_path = @windows ? self.root : self.root.lchop

         fo_xml = %Q{<?xml version='1.0'?>

         <!-- DO NOT CHANGE THIS FILE. IT IS AUTOGENERATED BY THE SHORT-ATTENTION-SPAN-DOCBOOK CHAIN -->

         <xsl:stylesheet 
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
            xmlns:fo="http://www.w3.org/1999/XSL/Format"
            xmlns:xslthl="http://xslthl.sf.net"
            xmlns:d="http://docbook.org/ns/docbook"
            xmlns:saxon="http://icl.com/saxon"
            extension-element-prefixes="saxon"
         >
           <!-- Import the original FO stylesheet -->
           <xsl:import href="file:///#{xsl_path}/xsl/html/docbook.xsl"/>
           <xsl:import href="file:///#{xsl_path}/xsl/html/highlight.xsl"/>
         }


         fo_xml << "</xsl:stylesheet>"

         File.open("xsl/html_base.xml", "w") do |f|
           f << fo_xml
         end
       end

       def xml_parser_options
         opts = super
        # opts << " html.stylesheet=style.css"
         opts
       end

       def after_render
         puts "Collecting HTML and resources..."
         FileUtils.mkdir_p "html"
         FileUtils.cp "#{self.file}.html", "html/index.html", :verbose => true
         FileUtils.cp "xsl/html.css", "html/style.css", :verbose => true
         FileUtils.cp_r "images", "html/images"
       end
    end
  end
end
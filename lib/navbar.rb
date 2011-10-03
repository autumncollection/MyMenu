class Navbar
	attr_reader :name, :path
	
	def initialize(	name = nil, path = nil )
		@name, @path = name, path
		@children = []
	end
	
	def add_child(child)
		@children << child
	end

	def html_output
    output = ""
    output << "<li><a href=\"#{@path}\">#{@name}</a>" if @name
    unless @children.empty?
      output << "<ul>"
      @children.each do |child|
        output << child.html_output
      end
      output << "</ul>"
    end
    output << "</li>" if @name
    output
	end

	def xml_output
		output = ""
		output << unless @name
		 "<navbar>"
		else
			%{<item href="#{@path}" name="#{@name}"#{@children.empty? ? "/" : ""}>}
		end

		@children.each do |child|
			output << child.xml_output		
		end

		output << unless @name
		 "</navbar>"
		else
			@children.empty? ? "" : "</item>"
		end
	end

end

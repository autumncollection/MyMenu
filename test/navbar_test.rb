require 'test/unit'
require File.expand_path("../lib/navbar.rb", File.dirname(__FILE__))

class NavbarTest < Test::Unit::TestCase
    def setup
		  @navbar = Navbar.new
		  user = Navbar.new("User","/user")
		  @navbar.add_child(user)
		  user_show = Navbar.new("Show","/user")
		  user.add_child(user_show)
		  user_edit = Navbar.new("Edit","/user/edit")
		  user.add_child(user_edit)
		end
		
		def test_html_output
		assert_equal_ignore_space(<<EOS, @navbar.html_output
<ul>
	<li><a href="/user">User</a>
		<ul>
			<li><a href="/user">Show</a></li>
			<li><a href="/user/edit">Edit</a></li>
		</ul>
	</li>
</ul>
EOS
)
		end
	
	def test_xml_output
		assert_equal_ignore_space(<<EOS, @navbar.xml_output
<navbar>
	<item href="/user" name="User">
			<item href="/user" name="Show"/>
			<item href="/user/edit" name="Edit"/>
	</item>
</navbar>
EOS
)
	end

	def assert_equal_ignore_space(expected, current)
		assert_equal(expected.gsub(/\s/, ""), current.gsub(/\s/, ""))
	end
end

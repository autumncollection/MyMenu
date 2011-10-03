require 'test/unit'
require File.expand_path("../lib/navbar.rb", File.dirname(__FILE__))

class NavbarTest < Test::Unit::TestCase
    def setup
			@navbar = Navbar.new
			user		= Navbar.new("User", "/user")
			@navbar.add_child(user)
			user_show = Navbar.new("Show", "/user")
			user_edit = Navbar.new("Edit", "/user/edit")
			@navbar.add_child(user_show)
			@navbar.add_child(user_edit)
		end
		
		def test_html_output
		assert_equal_ignore_space(<<EOS, @navbar.html_output
<ul>
	<li><a href="/user">User</a></li>
		<ul>
			<li><a href="/user">Show</a></li>
			<li><a href="/user/edit">Edit</a></li>
		</ul>
	</li>
</ul>
EOS
)
		end
	
	def assert_equal_ignore_space(expected, current)
		assert_equal(expected.gsub(/\s/, ""), current.gsub(/\s/, ""))
	end
end

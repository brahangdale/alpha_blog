require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest

	def setup
   @category = Category.create(name: "sports")
   @category = Category.create(name: "programming")
	end

	test "should show category listing" do
		get categories_path
		assert_template 'categories/index'
		assert_select ""
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def new_product(image_url)
    Product.new(title: "My Book Title",
                description: "yyy",
                price: 1,
                image_url: image_url)
  end

  test "product attributes must not be empty" do
  product = Product.new
  assert product.invalid?
  assert product.errors[:title].any?
  assert product.errors[:description].any?
  assert product.errors[:price].any?
  assert product.errors[:image_url].any?
  end
  test "product price must be positive" do
    product=Product.new(title: "My Book Title",
                        description: "yyy",
                        image_url: "zzz.jpg")
  end
  test "image url" do
    ok=%w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
           http://a.b.c/x/y/z/fred.gif err.dd }
    bad=%w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be balid"
    end
    bad.each do |name|
      assert new_product(name).invalid?,"#{name} shouldn't be valid"
    end
  end
end

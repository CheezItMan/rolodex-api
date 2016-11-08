require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def setup
    @contact = Contact.new(name: "Tyrion Lannister", tel: "333-333-3333", email: "Tyrion@donttellmysister.com", avatar: "http://placecage.com/300/300")
    @contact.save
  end

  test "The name attribute is required." do
    @contact.name = nil
    refute @contact.valid?
    refute @contact.save
    assert @contact.errors.messages.include? :name
    assert @contact.errors.messages[:name].include? "can't be blank"
  end

  test "The email attribute is required." do
    @contact.email = nil
    refute @contact.valid?
    refute @contact.save
    assert @contact.errors.messages.include? :email
    assert @contact.errors.messages[:email].include? "can't be blank"
  end

  test "Required Attributes are genuinely required" do
    assert_validations Contact.new, %w(name email tel), "can't be blank"
  end

  test "Unique Attributes must be unique" do
    assert_validations Contact.new(name: @contact.name, email: @contact.email, tel: @contact.tel), %w(email tel), "has already been taken"
  end

  private

  def assert_validations (model, fields, message)

    refute model.valid?
    refute model.save
    fields.each do |field|
      assert model.errors.messages.include?(field.to_sym), "field: #{field} - Message: #{message }"
      assert model.errors.messages[field.to_sym].include?(message), "field: #{field} - Message: #{message }"
    end
  end

end

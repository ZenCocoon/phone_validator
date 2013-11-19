require 'spec_helper'

class TestUser < TestModel
  validates :phone, :phone => true
end

class TestUserAllowsNil < TestModel
  validates :phone, :phone => {:allow_nil => true}
end

class TestUserAllowsNilFalse < TestModel
  validates :phone, :phone => {:allow_nil => false}
end

class TestUserWithMessage < TestModel
  validates :mobile, :phone => {:message => 'is not looking very good!'}
end

describe PhoneValidator do

  describe "validation" do
    context "given the valid phones" do
      [
        "+1-312-555-1212",
        "(312) 555-1212",
        "+13125551212",
        "+442070313000",
        "+33 (0)6 12 34 56 78"
      ].each do |phone|

        it "#{phone.inspect} should be valid" do
          TestUser.new(:phone => phone).should be_valid
        end

      end

    end

    context "given the invalid phones" do
      [
        "",
        " ",
        "123",
        "+1\#312-555-1212",
        "+1 312-555-1212\n<script>alert('hello')</script>"
      ].each do |phone|

        it "#{phone.inspect} should not be valid" do
          TestUser.new(:phone => phone).should_not be_valid
        end

      end
    end
  end

  describe "error messages" do
    context "when the message is not defined" do
      subject { TestUser.new :phone => 'invalidphone' }
      before { subject.valid? }

      it "should add the default message" do
        subject.errors[:phone].should include "is invalid"
      end
    end

    context "when the message is defined" do
      subject { TestUserWithMessage.new :mobile => 'invalidphone' }
      before { subject.valid? }

      it "should add the customized message" do
        subject.errors[:mobile].should include "is not looking very good!"
      end
    end
  end

  describe "nil phone" do
    it "should not be valid when :allow_nil option is missing" do
      TestUser.new(:phone => nil).should_not be_valid
    end

    it "should be valid when :allow_nil options is set to true" do
      TestUserAllowsNil.new(:phone => nil).should be_valid
    end

    it "should not be valid when :allow_nil option is set to false" do
      TestUserAllowsNilFalse.new(:phone => nil).should_not be_valid
    end
  end
end
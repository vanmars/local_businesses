require 'rails_helper'

describe Restaurant do 
  it { should validate_presence_of :name }
  it { should validate_presence_of :kind }
  it { should validate_presence_of :description }
  it { should validate_presence_of :review }
end
require 'rails_helper'

describe Shop do 
  it { should validate_presence_of :name }
  it { should validate_presence_of :industry }
  it { should validate_presence_of :logo_url }
  it { should validate_presence_of :slogan }
end
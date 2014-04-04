require 'spec_helper'

describe 'redash::config' do
  it { should contain_class('redash::config') }
end

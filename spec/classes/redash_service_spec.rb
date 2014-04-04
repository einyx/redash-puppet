require 'spec_helper'

describe 'redash::service' do
  it { should contain_class('redash::service') }
end

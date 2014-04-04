require 'spec_helper'

describe 'redash::package' do
  context 'Ubuntu 12.04 LTS' do
    let(:facts) { FACTS_UBUNTU_PRECISE }

    it { should contain_class('redash::package') }

  end

end

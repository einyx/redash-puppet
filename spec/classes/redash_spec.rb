require 'spec_helper'

describe 'redash' do
  context 'Ubuntu 12.04 LTS' do
    let(:facts) { FACTS_UBUNTU_PRECISE }

    it { should contain_class('redash') }

    it { should contain_class('redash::package') }
    it { should contain_class('redash::config') }
    it { should contain_class('redash::service') }
  end
end

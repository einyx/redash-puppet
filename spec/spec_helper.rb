require 'puppetlabs_spec_helper/module_spec_helper'

ENV['AWS_STUB'] = 'true'

RSpec.configure do |c|

   fixture_path = File.expand_path("../../../../spec",__FILE__)
   puts fixture_path
   c.hiera_config = File.join(fixture_path,'hiera.yaml')

   c.before(:all) do
     data = YAML.load_file(c.hiera_config)
     data[:yaml][:datadir] =  File.join(fixture_path,'hieradata')
     File.open(c.hiera_config, 'w') do |f|
       f.write data.to_yaml
     end
   end
end

FACTS_EC2 = {
  :ec2_instance_id                 => 'i-00000000',
  :ec2_placement_availability_zone => 'eu-west-1a',
  :ec2_region                      => 'eu-west-1',
  :is_virtual                      => 'true',
  :virtual                         => 'xenu',
}
FACTS_EC2_VPC = FACTS_EC2.merge({
  :ec2_subnet_id => 'subnet-00000000',
  :ec2_vpc_id    => 'vpc-00000000',
})

FACTS_LINUX = {
  :architecture   => 'amd64',
  :concat_basedir => '/tmp',
  :kernel         => 'Linux',
}

FACTS_UBUNTU = FACTS_LINUX.merge({
  :lsbdistid       => 'Ubuntu',
  :operatingsystem => 'Ubuntu',
  :osfamily        => 'Debian',
})
FACTS_UBUNTU_ONEIRIC = FACTS_UBUNTU.merge({
  :lsbdistcodename        => 'oneiric',
  :lsbdistdescription     => 'Ubuntu 11.10',
  :lsbdistrelease         => '11.10',
  :lsbmajdistrelease      => '11',
  :operatingsystemrelease => '11.10',
})
FACTS_UBUNTU_PRECISE = FACTS_UBUNTU.merge({
  :lsbdistcodename        => 'precise',
  :lsbdistdescription     => 'Ubuntu 12.04.2 LTS',
  :lsbdistrelease         => '12.04',
  :lsbmajdistrelease      => '12',
  :operatingsystemrelease => '12.04',
})

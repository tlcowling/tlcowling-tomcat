require 'spec_helper'

describe 'tomcat' do
  context 'supported operating systems' do
    ['Debian', 'RedHat', 'Ubuntu'].each do |osfamily|
      describe "tomcat class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('tomcat::params') }
        it { should contain_class('tomcat::install').that_comes_before('tomcat::config') }
        it { should contain_class('tomcat::config') }
        it { should contain_class('tomcat::service').that_subscribes_to('tomcat::config') }

        it { should contain_service('tomcat6') }
        it { should contain_package('tomcat6').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'tomcat class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('tomcat') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end

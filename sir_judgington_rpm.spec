%global bundler bundler-1.13.6
%global bundler_url https://rubygems.org/downloads/%{bundler}.gem

Name:           sir_judgington
Version:        %{_version}
Release:        1%{?dist}
Summary:        Example spec file for deploying RoR apps via RPM
BuildArch:      x86_64
Group:          Application/Internet
License:        GPL
URL:            https://github.com/erumble/sir_judgington.git
Source:         %{_source}.tar.gz
BuildRoot:      %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXX)

# Required Packages to build this RPM
BuildRequires: mysql-devel
BuildRequires: ruby >= 2.1
BuildRequires: rubygems
BuildRequires: rubygems-devel

# Packages required to install the RPM
Requires: glibc

# DIRS - Trying to follow Linux file system hierarchy
%define appdir /home/rails/%{name}
%define logdir /var/log/railsapps/%{name}
%define cachedir /var/cache/railsapps/%{name}

%description
Some description of the application

%prep
%setup -n %{_repo}-%{_version}

%build
# Install bundler, so we can use it to bundle install the things
curl -lO %{bundler_url}
%gem_install -n %{bundler}.gem

export PATH=$PATH:./usr/bin
export GEM_PATH=./usr/lib/ruby/gems/1.8/
export GEM_HOME=$GEM_PATH

# Install all required gems into ./vendor/bundle using the handy bundle commmand
bundle install --deployment

# Compile assets, this only has to be done once AFAIK, so in the RPM is fine
rm -rf ./public/assets/*
bundle exec rake assets:precompile

# Some of the files in here have '/usr/local/bin/ruby' set as the shebang
# or '/this/will/be/overwritten/or/wrapped/anyways/do/not/worry/ruby'
# replace those with '/usr/bin/env ruby' to remove the dependencies
for f in `grep -ril "\/usr\/local\/bin\/ruby" ./vendor`; do
  sed -i "s|/usr/local/bin/ruby|/usr/bin/env ruby|g" $f
  head -1 $f
done
for f in `grep -ril "\/this\/will\/be\/overwritten\/or\/wrapped\/anyways\/do\/not\/worry\/ruby" ./vendor`; do
  sed -i "s|/this/will/be/overwritten/or/wrapped/anyways/do/not/worry/ruby|/usr/bin/env ruby|g" $f
  head -1 $f
done


%install
# Create all the defined directories
rm -rf %{buildroot}
mkdir -p %{buildroot}/%{appdir}
mkdir -p %{buildroot}/%{logdir}
mkdir -p %{buildroot}/%{cachedir}

# Start moving files into the proper place in the build root
pushd %{name}
  # tmp/cache
  mv ./tmp %{buildroot}/%{cachedir}
  ln -s %{cachedir}/tmp ./tmp

  # log
  rm -rf ./log
  ln -s %{logdir} ./log

  # Everything left goes in appdir
  mv ./* %{buildroot}/%{appdir}
popd

pushd %{buildroot}/%{appdir}
  # run the bundle install --deployment to register the gems in .vendor/bundle
  bundle install --deployment
popd

%clean
rm -rf %{buildroot}

%files
%defattr(770,apache,apache)
%{appdir}
%{logdir}
%{cachedir}


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
BuildRequires: postgresql-devel
BuildRequires: gcc
BuildRequires: gcc-c++
BuildRequires: ruby = 2.1.10
BuildRequires: rubygems-devel
BuildRequires: zlib-devel

# Packages required to install the RPM
Requires: glibc
Requires: ruby = 2.1.10

Provides: sir_judgington

# DIRS - Trying to follow Linux file system hierarchy
%define appdir /var/www/%{name}
%define logdir /var/log/railsapps/%{name}
%define cachedir /var/cache/railsapps/%{name}

%description
Some description of the application

%prep
%setup -n %{_repo}-%{_version}

%build
# Install bundler, so we can use it to bundle install the things
curl -LO %{bundler_url}
%gem_install -n %{bundler}.gem

export PATH=$PATH:./usr/bin
export GEM_PATH=./usr/lib/ruby/gems/1.8/
export GEM_HOME=$GEM_PATH

# Install all required gems into ./vendor/bundle using the handy bundle commmand
bundle install --deployment --clean --no-cache --retry=3 --jobs=3 \
               --without development test

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
mkdir -p %{buildroot}/%{appdir}
mkdir -p %{buildroot}/%{logdir}
mkdir -p %{buildroot}/%{cachedir}

# Start moving files into the proper place in the build root
# tmp/cache
mv ./tmp %{buildroot}/%{cachedir}
ln -s %{cachedir}/tmp ./tmp

# log
rm -rf ./log
ln -s %{logdir} ./log

# Everything left goes in appdir
mv ./* %{buildroot}/%{appdir}

pushd %{buildroot}/%{appdir}
  export PATH=$PATH:./usr/bin
  export GEM_PATH=./usr/lib/ruby/gems/1.8/
  export GEM_HOME=$GEM_PATH

  # run the bundle install --deployment to register the gems in .vendor/bundle
  bundle install --deployment --clean --no-cache --retry=3 --jobs=3 \
                 --without development test
popd

%clean
rm -rf %{buildroot}

%files
%defattr(640,apache,apache,750)
%exclude %{appdir}/%{bundler}.gem
%{appdir}
%{logdir}
%{cachedir}

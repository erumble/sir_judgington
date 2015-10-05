Name:           sir_judgington
Version:        1.0.1
Release:        1%{?dist}
Summary:        Example spec file for deploying RoR apps via RPM 
BuildArch:      x86_64
Group:          Application/Internet
License:        GPL
URL:            https://github.com/erumble/sir_judgington.git
BuildRoot:      %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXX)

# Required Packages to build this RPM
BuildRequires: mysql-devel
BuildRequires: rubygems
#BuildRequires: rubygems(bundler)

# Packages required to install the RPM
Requires: glibc
Requires: rubygems

# What repository to pull the actual code from
%define git_repo https://github.com/erumble/%{name}.git

# DIRS - Trying to follow Linux file system hierarchy
%define appdir /home/rails/%{name}
%define logdir /var/log/railsapps/%{name}
%define cachedir /var/cache/railsapps/%{name}

%description
Some description of the application

%prep
rm -rf ./%{name}
git clone %{git_repo} -b v%{version}

%build
pushd %{name}
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
popd


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


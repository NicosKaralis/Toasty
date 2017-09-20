#! /bin/sh

# Check requirements

check_required_bin() {
  if ! hash $1 2>/dev/null; then
    echo "$1 not found."
    exit 1
  fi
}

check_requirements() {
  check_required_bin rbenv
  check_required_bin ruby-build
  check_required_bin xcodebuild
}

printf "Checking requirements... "
check_requirements
echo "done."

# Initialize project

cd "$(dirname "$0")/.."

RUBY_VERSION=`cat .ruby-version`
rbenv install -s $RUBY_VERSION

gem install bundler
rbenv rehash

bundle install --path vendor/bundle

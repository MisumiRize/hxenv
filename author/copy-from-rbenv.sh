#!/bin/bash
mkdir -p libexec completions
rm -f completions/*
rm -f \
       libexec/hxenv \
       libexec/hxenv---version \
       libexec/hxenv-commands \
       libexec/hxenv-completions \
       libexec/hxenv-exec \
       libexec/hxenv-global \
       libexec/hxenv-help \
       libexec/hxenv-hooks \
       libexec/hxenv-init \
       libexec/hxenv-local \
       libexec/hxenv-prefix \
       libexec/hxenv-rehash \
       libexec/hxenv-root \
       libexec/hxenv-sh-rehash \
       libexec/hxenv-sh-shell \
       libexec/hxenv-shims \
       libexec/hxenv-version \
       libexec/hxenv-version-file \
       libexec/hxenv-version-file-read \
       libexec/hxenv-version-file-write \
       libexec/hxenv-version-name \
       libexec/hxenv-version-origin \
       libexec/hxenv-versions \
       libexec/hxenv-whence \
       libexec/hxenv-which
cp $(ghq root)/github.com/sstephenson/rbenv/libexec/* libexec/
cp $(ghq root)/github.com/sstephenson/rbenv/completions/* completions/

rename 's/rbenv/hxenv/' libexec/* completions/*
/usr/bin/perl -i -pe 's!github.com/sstephenson/rbenv!github.com/MisumiRize/hxenv!g; s/RUBY/HAXE/g; s/rbenv/hxenv/g;s/RBENV/HXENV/g;s/Ruby/Haxe/g;s/ruby/haxe/g; s/1.9.3-p327/3.1.3/g; s/bundle install/charlotte install/g' libexec/* completions/*
chmod +x libexec/*
grep sstephenson libexec/* plugins/*/* completions/*

# enable --no-rehash by default
perl -i -pe 's/no_rehash=""/no_rehash=1/' libexec/hxenv-init

#git_revision="$(git describe --tags HEAD | sed -e 's/-.*//' 2>/dev/null || true)"
#export GIT_REVISION=$git_revision
perl -i -pe 's/version="[0-9.]+"/version="$ENV{GIT_REVISION}"/' libexec/hxenv---version
perl -i -pe 's!print_summaries commands local global shell install uninstall rehash version versions which whence!print_summaries commands local global shell install uninstall rehash version versions which whence list-modules migrate-modules install-cpanm!; s!%-9s!%-17s!' libexec/hxenv-help

patches="$(find ./ -name *.patch | sort)"
for file in $patches; do
  patch -u -p1 -d libexec < $file
done

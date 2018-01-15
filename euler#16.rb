#!/usr/bin/env ruby
#
# euler16.rb
# Copyright (C) 2017 derrick cope <derrick(at)thecopes.me>
#
# Distributed under terms of the MIT license.
#


puts ary = (2 ** 1000).to_s.split(//).map!(&:to_i ).sum
#puts ary.sum

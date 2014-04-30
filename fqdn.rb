#!/usr/bin/env ruby
File.open("test-fqdn.txt","r") do |f|
        f.each do |line|
                arr = line.split(".")
                if arr.count < 2
                        puts "#{line.gsub("\n","")} is not an FQDN."
                elsif arr.count == 2
                        if line =~ /^.*\.(com|org|net)$/
                                puts "#{line.gsub("\n","")} is an FQDN not ending in a dot."
                        elsif line =~ /^.*\.(com|org|net)\.$/
                                puts "#{line.gsub("\n","")} is an FQDN ending in a dot."
                        else
                                puts "#{line.gsub("\n","")} is not an FQDN."
                        end
                elsif arr.count > 2
                        if arr[-1] =~ /(^com|org|net)$/
                                if line =~ /^.*\.(com|org|net)$/
                                         puts "#{line.gsub("\n","")} is an FQDN not ending in a dot."
                                end
                        elsif arr[-1] =~ /^(uk|cc)$/
                                if line =~ /^.*\.(co\.uk|co\.cc)$/
                                        puts "#{line.gsub("\n","")} is an FQDN not ending in a dot."
                                end
                        elsif line =~ /^.*\.(com|org|net)\.$/
                                puts "#{line.gsub("\n","")} is an FQDN ending in a dot."
                        elsif line =~ /^.*\.(co\.uk|co\.cc)\.$/
                                puts "#{line.gsub("\n","")} is an FQDN ending in a dot."
                        else
                                puts "#{line.gsub("\n","")} is not an FQDN."
                        end

                end
        end
end

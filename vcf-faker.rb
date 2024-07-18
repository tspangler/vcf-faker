#!/usr/bin/env ruby

require 'vcard'
require 'faker'
require 'colorize'

def msg(msg, color = :blue)
  puts "#{'[vcf-faker]'.colorize(color: color, mode: :bold)} #{msg}"
end

abort "usage: vcf-faker $RECORD_COUNT $OUTPUT_FILE" unless ARGV[0] && ARGV[1]

DOMAINS = ['hey.com', 'gmail.com', 'yahoo.com', 'aol.com', 'compuserve.com']
count, output_file = ARGV[0], ARGV[1]
contacts = []

msg "generating vcf file with #{count} fake records!"

1.upto(count.to_i) do |c|
  first_name, last_name = Faker::Name.first_name, Faker::Name.last_name
  contacts << { first_name: first_name,
    last_name: last_name,
    email: Faker::Internet.unique.email(name: "#{first_name} #{last_name}", domain: DOMAINS.sample) }
end

File.open(output_file, 'w') do |f|
  contacts.each do |contact|
    msg("writing card for #{contact[:first_name]} #{contact[:last_name]} (#{contact[:email]})", :magenta)

    card = Vcard::Vcard::Maker.make2 do |maker|
      maker.add_name do |name|
        name.given = contact[:first_name]
        name.family = contact[:last_name]
      end

      maker.add_email(contact[:email]) { |e| e.preferred = 'yes' }
    end

    f.puts card
  end
end

msg("done!", :green)




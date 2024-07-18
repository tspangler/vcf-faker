# vcf-faker

a quick utility for generating vcard files full of enormous numbers of fake contacts.

created for **REDACTED** (iykyk*)

(if you know and you use this, good luck and you're welcome. star the repo so i know who i'm up against.)

## dependencies
no bundling or anything fancy. just `gem install colorize faker vcard` and go.

## usage
`./vcf-faker.rb $RECORD_COUNT $OUTPUT_FILE`

so `./vcf-faker.rb 1337 lotsa_fakes.vcf` will output 1337 fake first/lastname pairs and emails to `lotsa_fakes.vcf`.

## security
i made this for myself and made absolutely no efforts to implement any kind of guard rails (lol get it?!)
if you're silly enough to run it as root it will happily overwrite your `/etc/shadow` file if you tell it to.

_`.downcase` the planet_





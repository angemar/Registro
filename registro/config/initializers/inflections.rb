# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections(:en) do |inflect|
   #inflect.plural /^(ox)$/i, '\1en'
   #inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'alunno', 'alunni'
   inflect.irregular 'amministrazione', 'amministrazioni'
   inflect.irregular 'assenza', 'assenze'
   inflect.irregular 'attivitaextra', 'attivitaextras'
   inflect.irregular 'circolare', 'circolari'
   inflect.irregular 'compito', 'compiti'
   inflect.irregular 'docenza', 'docenze'
   inflect.irregular 'materia', 'materie'
   inflect.irregular 'notadisciplinare', 'notedisciplinari'
   inflect.irregular 'sezione', 'sezioni'
   inflect.irregular 'voto', 'voti'
   #inflect.uncountable %w( fish sheep )
end


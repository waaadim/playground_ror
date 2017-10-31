class LanguagesTranslator < ActiveRecord::Base
  belongs_to :language
  belongs_to :translator
end

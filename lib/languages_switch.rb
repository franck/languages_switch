module LanguagesSwitch
  
  LOCALE_IDENTIFIER = :locale
  
  module Controller
    def self.included(base)
      base.class_eval do
        prepend_before_filter :set_locale        
      end
    end
  
    protected
    
    def set_locale
      # preferred_language_from method come from this plugin : git://github.com/franck/languages_switch.git
      I18n.locale = params[:locale] || request.preferred_language_from(available_locales, true) || I18n.default_locale
    end
    
    def available_locales
      I18n.backend.available_locales
    end
    
  end
  
  module Helper
    def locale_identifier
      LOCALE_IDENTIFIER
    end
    
    def available_locales
      I18n.backend.available_locales
    end
  end
  
end
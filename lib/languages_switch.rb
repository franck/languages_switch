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
      locale = params[LOCALE_IDENTIFIER] || session[LOCALE_IDENTIFIER] || (current_user.send(LOCALE_IDENTIFIER) if logged_in?) || I18n.default_locale
      session[LOCALE_IDENTIFIER] = I18n.locale = locale
    end
    
    def available_locales
      I18n.load_path.locales
    end
  end
  
  module Helper
    def locale_identifier
      LOCALE_IDENTIFIER
    end
    
    def available_locales
      I18n.load_path.locales
    end
  end
  
end
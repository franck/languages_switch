require 'languages_switch'

ActionController::Base.send :include, LanguagesSwitch::Controller
ActionView::Base.send :include, LanguagesSwitch::Helper
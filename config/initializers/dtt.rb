
DTT_FORCE_LOCALE = nil #:en # ou nil pour détection automatique de la langue du navigateur

COLOR_LEVELS = [0xAF180A, 0xFF6607, 0x108E24, 0x000000]

GRAPH_LABELS_LENGTH = 32

=begin
# rails monkey patch

module ActionView
  module Helpers
    module TranslationHelper
      alias_method :translate_original_method, :translate
      def translate(key, options = {})
        (translate_original_method(key, options = {})+" <span onclick='alert(\"key: #{key}\")'>(#{key})</span>").html_safe
      end
      alias :t :translate
    end
  end
end

=end

class String
  def ellips
    if self.length <= GRAPH_LABELS_LENGTH
      self
    else
      self[0..GRAPH_LABELS_LENGTH-1] + "..."
    end
  end
end
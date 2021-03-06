# frozen_string_literal: true

module OnlyofficeWebdriverWrapper
  # Webdriver style helper
  module WebdriverStyleHelper
    def get_style_parameter(xpath, parameter_name)
      get_attribute(xpath, 'style').split(';').each do |current_param|
        return /:\s(.*);?$/.match(current_param)[1] if current_param.include?(parameter_name)
      end
      nil
    end

    def set_style_parameter(xpath, attribute, attribute_value)
      execute_javascript("document.evaluate(\"#{xpath.tr('"', "'")}\",document, null, XPathResult.ANY_TYPE, null ).iterateNext()." \
                             "style.#{attribute}=\"#{attribute_value}\"")
    end

    def set_style_attribute(xpath, attribute, attribute_value)
      execute_javascript("document.evaluate('#{xpath}',document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null)." \
                             "singleNodeValue.style.#{attribute}=\"#{attribute_value}\"")
    end

    def set_style_show_by_xpath(xpath, move_to_center = false)
      xpath = xpath.tr("'", '"')
      execute_javascript('document.evaluate( \'' + xpath.to_s +
                             '\' ,document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null ).singleNodeValue.style.display = "block";')
      return unless move_to_center

      execute_javascript('document.evaluate( \'' + xpath.to_s +
                             '\' ,document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null ).singleNodeValue.style.left = "410px";')
      execute_javascript('document.evaluate( \'' + xpath.to_s +
                             '\' ,document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null ).singleNodeValue.style.top = "260px";')
    end
  end
end

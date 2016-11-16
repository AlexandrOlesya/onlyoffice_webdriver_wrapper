module OnlyofficeWebdriverWrapper
  module RealDisplayTools
    def xrandr_result
      begin
        result = `xrandr`
      rescue Exception
        result = 'xrandr throw an exception'
      end
      OnlyofficeLoggerHelper.log("xrandr answer: #{result}".delete("\n"))
      result
    end

    def real_display_connected?
      result = xrandr_result
      exists = result.include?(' connected') # sometimes there is 'disconnected' so need a space before 'connected'
      OnlyofficeLoggerHelper.log("Real Display Exists: #{exists}")
      exists
    end

    def real_display_resolution_low?
      low_resolution = '1024x768'
      result = xrandr_result
      exists = result.include?("primary #{low_resolution}") # check only for primary display
      OnlyofficeLoggerHelper.log("Real display resolution too low: #{exists}")
      exists
    end
  end
end

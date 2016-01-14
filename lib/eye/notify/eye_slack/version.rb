module Eye
  class Notify
    # to satisfy gem packaking
    class Eye::Notify::Custom < Eye::Notify; end

    class EyeSlack < Eye::Notify::Custom
      VERSION = "0.0.3"
    end
  end
end

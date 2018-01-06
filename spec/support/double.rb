module Support
  module Double
    def double_mail
      double('mail', deliver_now: 'deliver_now')
    end

    def double_success
      double('success', 'success?' => true, 'failure?' => false)
    end
  end
end

module VoipApi

  # A DIDParam defines values for modifying a DID
  # Methods using DIDParam object(s): assignDID, configDID, releaseDID, reserveDID
  class DIDParam
    attr_accessor :tn, :epg, :cnam, :ref_id
    
    def initialize(hashie_params={})
      # Setup all our attributes if we respond to it.
      hashie_params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def to_hash
      result = {}
      [[:tn, :tn], [:epg, :epg], [:cnam, :cnam], [:refId, :ref_id]].each do |garbage, pretty|
        # Make sure that this thing ain't nil
        if self.send(pretty)
          result[garbage] = self.send(pretty)
        end
      end
      result
    end

    def self.description(attribute)
      case attribute
      when :tn
        "Telephone number of the DID to be modified"
      when :epg
        "Endpoint Group ID"
      when :cnam
        "This is the bit value 0 or 1 for setting inbound CNam dips inactive (0) or active (1)"
      when :ref_id
        "This is the customer-defined reference ID associated with this request. This field is purely for the benefit of the API user and could potentially be used to associate a customer ID, order ID, or any other reference ID to an API request."
      end
    end
      
  end

end

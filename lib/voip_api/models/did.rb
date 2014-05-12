module VoipApi

  # A DID is 'Direct Inward Dial' and is a telephone number
  # Methods using DID object(s): auditDIDs, queryDID, assignDID, configDID, releaseDID, reserveDID
  class DID
    include Comparable

    attr_accessor :tn, :availability, :rewrite, :status, :status_code, :tier, :ref_id, 
      :cnam_name, :state, :rate_center, :did_group_id, :network, :endpoint_id, :has_411, 
      :has_911, :cnam, :cnam_storage_active, :cnam_storage_availability, :t_38, :failover, :forward

    def initialize(hashie_params={})
      # Setup all our attributes if we respond to it.
      hashie_params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def <=>(other)
      @tn <=> other.tn
    end

    def self.description(attribute)
      case attribute
      when :tn
        "Telephone number"
      when :availability
        "Defines the status of the returned TN"
      when :rewrite
        "Used in rewriting the DNIS for the TN if assigned to you or reserved by you"
      when :status
        "This is the status of a request, for example 'Success'"
      when :status_code
        "Each status has a matching numerical value, for example, a 'Success' status has a '100' statusCode"
      when :tier
        "Pricing tier on which the number resides"
      when :ref_id
        "This is the customer-defined Reference ID that is associated with this request. This field is purely for the benefit of the API user, and could potentially be used to associate a Customer ID, Order ID, or any other Reference ID to an API request."
      when :cnam_name
        "CNAM Storage Display Name"
      when :state
        "The two letter abbreviation for the state in which the TN resides"
      when :rate_center
        "Rate Center that services DID"
      when :did_group_id
        "ID number of the DID Group"
      when :network
        "The network on which the DID resides"
      when :endpoint_id
        "This will return an integer that defines which endpoint group ID this TN will route to if the TN is assigned to you or reserved by you. This can be changed by performing a configDID request."
      when :has_411
        "Indicates if the DID currently has a 411 registered address"
      when :has_911
        "Indicates if the DID currently has an e911 registered address"
      when :cnam
        "Denotes whether or not inbound cnam dip is active for the DID"
      when :cnam_storage_active
        "Denotes whether or not a Cnam Storage record is on file in our database for the DID"
      when :cnam_storage_availability
        "Denotes whether or not DID supports Cnam Storage capability"
      when :t_38
        "Denotes whether or not DID is T38 capable"
      when :failover
        "Failover number (if set) on the DID. This field is only included with the GetDIDFailover method."
      when :forward
        "Forward number (if set) on the DID. This field is only included with the GetDIDForward method."
      end
    end

  end
end



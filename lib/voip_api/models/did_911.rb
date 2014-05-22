module VoipApi
  module Models
    # DID911 defines data stored in our database pertaining to a 911 registration for a DID.
    # @attr [String] location_id ID generated by our 911 provider associated with the location
    # @attr [String] tn Telephone number
    # @attr [String] caller_name Name on file
    # @attr [String] address1 Street and house number
    # @attr [String] address2 Any additional information such as 'Apartment 1' or 'Suite 100' etc.
    # @attr [String] city City
    # @attr [String] state State
    # @attr [String] zip_code ZIP Code
    # @attr [String] latitude Latitude coordinate of the address on file
    # @attr [String] longitude longitude coordinate of the address on file
    # @attr [String] status_code GEOCODED or PROVISIONED (Older entries my be VERIFIED or UNVERIFIED)
    # @attr [String] status_description Describes the status code
    # @attr [String] activated_time Date/Time when the location was provisioned
    # @attr [String] date_added Date/Time the location was registered
    # @see VoipApi::API::X911Request#audit_911
    # @see VoipApi::API::X911Request#query_911
    class DID911
      include Comparable

      attr_accessor :location_id, :tn, :caller_name, :address1, :address2, :city, :state, :zip_code, :latitude, 
        :longitude, :status_code, :status_description, :activated_time, :date_added

      # @!visibility private
      def initialize(hashie_params={})
        # Setup all our attributes if we respond to it.
        hashie_params.each do |k, v|
          instance_variable_set("@#{k}", v) unless v.nil?
        end
      end

      # @!visibility private
      def <=>(other)
        @tn <=> other.tn
      end

      # Describes the attribute passed in
      # @param attribute [Symbol] A symbol representing the attribute for which you desire a description of
      def self.description(attribute)
        case attribute
        when :location_id
          "ID generated by our 911 provider associated with the location"
        when :tn
          "Telephone number"
        when :caller_name
          "Name on file"
        when :address1
          "Street and house number"
        when :address2
          "Any additional information such as 'Apartment 1' or 'Suite 100' etc."
        when :city
          "City"
        when :state
          "State"
        when :zip_code
          "ZIP Code"
        when :latitude
          "Latitude coordinate of the address on file"
        when :longitude
          "longitude coordinate of the address on file"
        when :status_code
          "GEOCODED or PROVISIONED (Older entries my be VERIFIED or UNVERIFIED)"
        when :status_description
          "Describes the status code"
        when :activated_time
          "Date/Time when the location was provisioned"
        when :date_added
          "Date/Time the location was registered"
        end
      end
    end
  end
end

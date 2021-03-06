module VoipApi
  module Models
    # A PortDetail gives information about a given port
    # @attr [String] id The port identification number
    # @attr [String] status The current status of this port
    # @attr [String] end_user The end user associated with the port
    # @attr [String] billing_tn The BTN associated with this port
    # @attr [String] porting_from The losing carrier or network
    # @attr [String] sales_rep The porting representative assigned to this portId
    # @attr [String] submitted_date The date and time that the port was submitted
    # @attr [String] foc_date The date currently set for this port to FOC
    # @attr [String] requested_foc_date The requested FOC date for this port
    # @attr [String] default_endpooint_group The endpoint group to which the DIDs in this port will be assigned to upon completion
    # @attr [String] port_dids Returns a collection of PortDIDs, one for each DID in the port
    # @see VoipApi::API::PortRequest#get_port_details
    # @see VoipApi::API::PortRequest#is_portable
    class PortDetail
      attr_accessor :id, :status, :end_user, :billing_tn, :porting_from, :sales_rep, 
        :submitted_date, :foc_date, :requested_foc_date, :default_endpooint_group, :port_dids

      # @!visibility private
      def initialize(hashie_params={})
        # Setup all our attributes if we respond to it.
        hashie_params.each do |k, v|
          instance_variable_set("@#{k}", v) unless v.nil?
        end
        # TODO: let them pass in the PortDIDs list
        @port_dids = Models::DIDList.new
      end

      # Describes the attribute passed in
      # @param attribute [Symbol] A symbol representing the attribute for which you desire a description of
      def self.description(attribute)
        case attribute
        when :id
          "The port identification number"
        when :status
          "The current status of this port"
        when :end_user
          "The end user associated with the port"
        when :billing_tn
          "The BTN associated with this port"
        when :porting_from
          "The losing carrier or network"
        when :sales_rep
          "The porting representative assigned to this portId"
        when :submitted_date
          "The date and time that the port was submitted"
        when :foc_date
          "The date currently set for this port to FOC"
        when :requested_foc_date
          "The requested FOC date for this port"
        when :default_endpooint_group
          "The endpoint group to which the DIDs in this port will be assigned to upon completion"
        when :port_dids
          "Returns a collection of PortDIDs, one for each DID in the port"
        end
      end
    end
  end
end

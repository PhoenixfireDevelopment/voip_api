require 'savon'

module VoipApi

  module Request

    # Sandbox Ops:
    # [:add_location, :assign_did, :assign_intl_did, :audit911, :audit_di_ds, :config_did, :get_cnam_display, :get_countries, :get_di_ds, :get_did_count, :get_fax_to_email, :get_locations, :get_port_details, :get_provisioning_history, :insert911, :is_portable, :provision_location, :query911, :query_did, :release_did, :release_intl_did, :remove911, :remove_cnam, :remove_fax_to_email, :remove_location, :reserve_did, :set_fax_to_email, :update911, :update_cnam_display, :validate911]

    def setup_savon_client
      client = Savon.client do |globals|
        globals.wsdl @wsdl
        globals.namespace @namespace
        globals.filters @filters
        globals.pretty_print_xml true
        globals.namespace_identifier :tns
        globals.strip_namespaces true
      end
      client
    end

    def operations
      setup_savon_client.operations.sort
    end

    def request(api_method, response_klass, my_params={})
      savon_client = setup_savon_client

      params = my_params.merge(login: VoipApi.login, secret: VoipApi.secret)

      # Invoke the call to the API
      begin
        savon_response = savon_client.call(api_method, message: params)
      rescue Savon::Error => error
        Logger.log "Savon Error Encountered: #{error.http.code} #{error.message}"
      end

      if savon_response.success? && !savon_response.soap_fault? && !savon_response.http_error?
        # Have this get converted to the appropriate kind of savon_response
        if response_klass
          response_klass.new(savon_response)
        end
      end
    end

  end
  
end

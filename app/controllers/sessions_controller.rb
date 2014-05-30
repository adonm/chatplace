class SessionsController < Devise::SessionsController
    skip_before_filter :verify_authenticity_token

    def destroy
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
        yield resource if block_given?
        respond_to do |format|
          format.all { head :no_content }
        end
    end
end

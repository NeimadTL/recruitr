class CustomisedRegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  private

    def sign_up_params
      params.require(resource_name).permit(:firstname, :lastname, :city,
        :country, :email, :password, :password_confirmation, :skill_ids => [])
    end

end

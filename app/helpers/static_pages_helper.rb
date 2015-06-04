module StaticPagesHelper
  # code below emulate Devise resources
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    Struct.new(:omniauth_providers).new([:github,:facebook,:linked_in])
  end
end

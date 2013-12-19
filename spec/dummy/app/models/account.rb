class Account
  include ActiveModel::Validations
  include Simple::Validators

  attr_accessor :subdomain, :host

  validates :host, subdomain: true
  validates :subdomain, subdomain: { reserved: %w[www test] }
end

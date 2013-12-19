module Simple
  module Validators
    class SubdomainValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.blank?

        reserved_names = options.fetch(:reserved) { %w[www ftp mail pop smtp admin ssl sftp] }
        if reserved_names.include?(value)
          record.errors[attribute] << 'cannot be a reserved name'
        end

        record.errors[attribute] << 'must have between 1 and 63 letters' unless (1..63) === value.length
        record.errors[attribute] << 'cannot start or end with a hyphen' unless value =~ /^[^-].*[^-]$/i
        record.errors[attribute] << 'must be alphanumeric; A-Z, 0-9 or hyphen' unless value =~ /^[a-z0-9\-]*$/i
      end
    end
  end
end

require 'spec_helper'

describe Simple::Validators::SubdomainValidator do
  let(:account) { Account.new }

  context "valid subdomain" do
    it "marks the record as valid" do
      account.subdomain = "acme"
      expect(account).to be_valid
    end
  end

  context "invalid subdomain" do
    it "when reserved marks the record as invalid" do
      account.host = "www"
      expect(account).not_to be_valid
    end

    it "when reserved marks the record as invalid" do
      account.subdomain = "test"
      expect(account).not_to be_valid
    end

    it "when too long marks the record as invalid" do
      account.subdomain = "really-really-long-subdomain-that-exceeds-the-63-char-limit-keep-going-nearly-there"
      expect(account).not_to be_valid
    end

    it "when starts with a hypen marks the record as invalid" do
      account.subdomain = "-acme"
      expect(account).not_to be_valid
    end

    it "when ends with a hypen marks the record as invalid" do
      account.subdomain = "acme-"
      expect(account).not_to be_valid
    end

    it "when it contains invalid chars the record as invalid" do
      account.subdomain = "acme_test something"
      expect(account).not_to be_valid
    end
  end
end

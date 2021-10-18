# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.include Capybara::DSL
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

end

def senate_member_data 
  {:id=>"A000360",
    :title=>"Senator, 2nd Class",
    :short_title=>"Sen.",
    :api_uri=>"https://api.propublica.org/congress/v1/members/A000360.json",
    :first_name=>"Lamar",
    :middle_name=>nil,
    :last_name=>"Alexander",
    :suffix=>nil,
    :date_of_birth=>"1940-07-03",
    :gender=>"M",
    :party=>"R",
    :leadership_role=>nil,
    :twitter_account=>"SenAlexander",
    :facebook_account=>"senatorlamaralexander",
    :youtube_account=>"lamaralexander",
    :govtrack_id=>"300002",
    :cspan_id=>"5",
    :votesmart_id=>"15691",
    :icpsr_id=>"40304",
    :crp_id=>"N00009888",
    :google_entity_id=>"/m/01rbs3",
    :fec_candidate_id=>"S2TN00058",
    :url=>"https://www.alexander.senate.gov/public",
    :rss_url=>"https://www.alexander.senate.gov/public/?a=RSS.Feed",
    :contact_form=>"http://www.alexander.senate.gov/public/index.cfm?p=Email",
    :in_office=>false,
    :cook_pvi=>nil,
    :dw_nominate=>0.324,
    :ideal_point=>nil,
    :seniority=>"17",
    :next_election=>"2020",
    :total_votes=>717,
    :missed_votes=>133,
    :total_present=>0,
    :last_updated=>"2020-12-30 19:01:18 -0500",
    :ocd_id=>"ocd-division/country:us/state:tn",
    :office=>"455 Dirksen Senate Office Building",
    :phone=>"202-224-4944",
    :fax=>"202-228-3398",
    :state=>"TN",
    :senate_class=>"2",
    :state_rank=>"senior",
    :lis_id=>"S289",
    :missed_votes_pct=>18.55,
    :votes_with_party_pct=>96.55,
    :votes_against_party_pct=>3.45}
end 

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :address }
  it { is_expected.to validate_presence_of :mobile_no }
  it { is_expected.to validate_uniqueness_of :name  }
  it { is_expected.to validate_uniqueness_of :mobile_no  }
  it { is_expected.to validate_length_of :mobile_no  }
  it { is_expected.to validate_numericality_of :mobile_no }
  it { is_expected.to have_many :cuisines  }
  it { is_expected.to have_many :restaurants_cuisines  }
  it { is_expected.to have_many :restaurants_facilities }
  it { is_expected.to have_many :facilities  }
  it { is_expected.to have_many :unavailabities  }
  it { is_expected.to have_many :timings  }
  it { is_expected.to belong_to :user  }
  it { is_expected.to accept_nested_attributes_for :timings  }
  it { is_expected.to accept_nested_attributes_for :unavailabities  }
  it { is_expected.to accept_nested_attributes_for :restaurants_cuisines  }
  it { is_expected.to accept_nested_attributes_for :restaurants_facilities  }
end

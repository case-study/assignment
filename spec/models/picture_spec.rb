require 'spec_helper'

describe Picture do
  it { should belong_to(:monument) }
end

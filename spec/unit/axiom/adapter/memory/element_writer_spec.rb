# encoding: utf-8

require 'spec_helper'

describe Adapter::Memory, '#[]=' do
  subject { object[name] = relation }

  include_context 'relation'

  let!(:object) { described_class.new }

  it { should be(relation) }

  it 'wraps the relation in a gateway' do
    subject
    expect(object[name]).to eql(Relation::Variable.new(relation))
  end
end

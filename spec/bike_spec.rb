require './lib/bike.rb'

describe Bikes do
  it { is_expected.to respond_to :working? }

  describe 'Broken Bikes' do
    it 'Can be reported broken' do
      subject.report_broken
      expect(subject).to be_broken
    end

    it 'check bike status' do
      expect(subject).to respond_to :broken?
    end
  end

end

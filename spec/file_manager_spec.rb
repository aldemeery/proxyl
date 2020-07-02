require_relative '../lib/file_manager'

describe FileManager do
    let(:path) { FileManager.save('test', 'txt') }

    describe '.save' do
        it 'saves a file correctly' do
            expect(File).to exist(path)
        end

        it 'saves content correctly' do
            expect(File.read(path)).to eql('test')
            File.delete(path)
        end
    end
end

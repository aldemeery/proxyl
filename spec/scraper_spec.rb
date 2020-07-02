require_relative '../lib/scraper'
require_relative '../lib/proxy'

describe Scraper do
  describe '#scrape' do
    it 'scrapes html string to create proxy objects' do
      html = <<-HTML
                <!DOCTYPE html>
                <html>
                <body>
                <table id="proxylisttable">
                    <tbody>
                        <tr>
                            <td>103.81.104.66</td>
                            <td>34717</td>
                            <td>BD</td>
                            <td class="hm">Bangladesh</td>
                            <td>elite proxy</td>
                            <td class="hm">no</td>
                            <td class="hx">no</td>
                            <td class="hm">16 seconds ago</td>
                        </tr>
                    </tbody>
                </table>
                </body>
                </html>
      HTML
      scraper = Scraper.new(html)
      scraper.scrape
      expect(scraper.data.data.first).to be_instance_of(Proxy)
    end
  end
end

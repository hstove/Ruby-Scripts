require 'open-uri'
require 'net/http'
require 'rexml/document'
require 'vacuum'
require 'json'

@tag = 'seautex-20'

def all_depts
  uri = URI("http://www.seattleubookstore.com/textbooks_xml.asp?control=campus&campus=135&term=189")
  count = 0
  begin
    res = Net::HTTP.get_response(uri).body
  rescue Errno::ECONNRESET => e
    retry unless count > 10; count += 1
    puts "tried 10 times and couldn't get #{uri}: #{e}"
  end
  doc = REXML::Document.new(res)
  depts = []
  doc.elements.each('departments/department') do |dept|
    depts << dept.attributes
  end
  depts
end

def tagsForDepts
  puts "<select>"
  depts = all_depts
  depts.each do |dept|
    puts "<option data-id='#{dept['id']}'>#{dept['abrev']} - #{dept['name']}</option>"
  end
  puts "</select>"
end

def scraper
  depts = all_depts
  whole = {}
  #whole['depts'] = all_depts
  depts.each do |dept|
    #whole["#{dept['id']}"]['id'] = dept['id']
    #whole["#{dept['id']}"]['abrev'] = dept['abrev']
    #whole["#{dept['id']}"]['name'] = dept['name']
    whole[dept['id']] = {}
    uri = URI("http://www.seattleubookstore.com/textbooks_xml.asp?control=department&term=189&dept=#{dept['id']}")
    count = 0
    begin
      res = Net::HTTP.get_response(uri).body
    rescue Errno::ECONNRESET => e
      retry unless count > 10; count += 1
      puts "tried 10 times and couldn't get #{uri}: #{e}"
    end
    doc = REXML::Document.new(res)
    sections = []
    courses = []
    doc.elements.each('courses/course') do |course|
      courses << course.attributes
    end
    sections << courses 
    sections.each do |list|
      whole[dept['id']]['courses'] = list
      #puts list
    end
    courses.each_with_index do |course,indy|
      sections = []
      uri = URI("http://www.seattleubookstore.com/textbooks_xml.asp?control=course&term=189&course=#{course['id']}")
      res = Net::HTTP.get_response(uri).body
      #puts whole
      doc = REXML::Document.new(res)
      doc.elements.each_with_index('sections/section') do |e,index|
        section = {}
        section['instructor'] = e.attributes['instructor']
        section['name'] = e.attributes['name']
        section['id'] = e.attributes['id']
        sections << section
        puts section
      end 
      whole[dept['id']]['courses'][indy]['Sections'] = sections
      #puts whole[dept['id']]['courses'][indy]
      puts ''
    end
  end
  whole
end
scraper
## returns a list of objects, each is a product
def lookup(batch)
  req = Vacuum.new key: 'AKIAJA2IADZPBGHJTZRQ',
                    secret: '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',
                    tag: @tag,
                    locale: 'us'
  
    
  params = {  'Operation'                       => 'ItemLookup',
              'SearchIndex'                     => 'Books',
              'ItemLookup.Shared.IdType'        => 'ISBN',
              'ItemLookup.Shared.Condition'     => 'All',
              'ItemLookup.Shared.MerchantId'    => 'All',
              'ItemLookup.Shared.ResponseGroup' => 'OfferFull'}
              
  batch.each_with_index do |item,index|
    params['ItemLookup.'+(index+1).to_s+'.ItemId'] = item
  end
  req.build params
  
  res = req.get
  items = []
  if res.valid?
    res.to_hash['Items'].each do |item|
      prod = {}
      prod['ASIN'] = item['Item']['ASIN']
      prod['New Price'] = item['Item']['OfferSummary']['LowestNewPrice']['FormattedPrice']
      prod['Used Price'] = item['Item']['OfferSummary']['LowestUsedPrice']['FormattedPrice']
      prod['url'] = "http://www.amazon.com/dp/"+prod['ASIN']+'/?tag='+@tag
      items << prod
    end
  end
  #puts res.to_hash.to_json
  items
end
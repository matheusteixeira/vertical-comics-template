require 'json'

file = File.read("src/manifest.json")
data = JSON.load(file)

index = ''
# Generates index
data["comics"].each do |issue|
  index += "<a href='#{issue['url_slug']}.html'>#{issue['title']}</a>\n"
end

issue_file = File.open("public/index.html", 'w')

File.open("src/base.html", mode: 'r') do |i|
  while line = i.gets
    issue_file << line
    if line.chomp.include?("<div id='main'>")
      issue_file << index + "</ul>"
    end
  end
end

# Generates a Page for each issue
def self.add_order_chapters(issue)
  chapters = ''
  prev_chapter = "<a href='#{issue['previous_chapter_url_slug']}.html'>Previous</a>"
  next_chapter = "<a href='#{issue['next_chapter_url_slug']}.html'>Next</a>"

  chapters =+ prev_chapter unless issue['previous_chapter_url_slug'].empty?
  chapters =+ next_chapter unless issue['next_chapter_url_slug'].empty?
  chapters
end

def self.add_author(issue)
  return '' if issue['author'].empty? && issue['author_url'].empty?
  return "By: <a href='#{issue['author_url']}'>#{issue['author']}</a>" unless issue['author'].empty?

  "By: #{issue['author']}" if issue['author_url'].empty?
end

#ADD BY Author
itens = ''

data["comics"].each do |issue|
  issue_file = File.open("public/#{issue['url_slug']}.html", 'w')
  imgs = ''

  (1..issue["number_of_pages"].to_i).each do |i|
    imgs += "<img src='#{issue['folder']}/#{i}.#{issue['image_format']}' style='width:90%';/>\n"
  end

  itens = <<-HTML
    <div class='credits'>
      <h1>#{issue["title"]}</h1>
      #{add_author(issue)}
    </div><br/>
    #{imgs}
    <br/>
    <div class='issueNav'>
      #{add_order_chapters(issue)}
    </div>
  HTML

  File.open("src/base.html", mode: 'r') do |i|
    while line = i.gets
      issue_file << line
      if line.chomp.include?("<div id='main'>")
        issue_file << itens
      end
    end
  end
end


require 'csv'

def command_to_add_user id, title, author, date, summary, pullquote, body
	"INSERT INTO posts(id, title, author, date, summary, pullquote, body) VALUES('#{id}', '#{title}', '#{author}', #{date}, '#{summary}', '#{pullquote}', '#{body}')"
end

def run_command sql
  system %{ sqlite3 posts.sqlite3 \"#{sql}\" }
end

CSV.foreach "posts.csv" do |id, title, author, date, summary, pullquote, body|
  run_command command_to_add_user(id, title, author, date, summary, pullquote, body)
end
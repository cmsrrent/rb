# process_sql_log.rb

# declare some variables
inFileName = "input_sql.txt"
outFileName = "output_sql.txt"
startString = "[++SQL"
endString = "[--SQL"

# open log file for reading
inFile = File.new(inFileName, "r")

# open outfile for writing
outFile = File.new(outFileName, "w")

linecount = 0

puts ("Processing log file......")

# loop through inFile searching for SQL start and end tags
# output to file lines with tags and all lines in between
# this will give the SQL debug statements needed
while !(inFile.eof) do 	
	c = inFile.gets
	if (c.include? startString) then				
		outFile.puts( c )
		linecount += 1
		begin
			c = inFile.gets
			linecount += 1
			outFile.puts( c )			
		end	until (c.include? endString)
	end	
end

if inFile.eof then
	puts( "Completed processing......")
	puts ("#{inFileName} contained #{linecount} rows of SQL data")	
end

# close the files
inFile.close
outFile.close
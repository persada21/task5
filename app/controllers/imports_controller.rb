class ImportsController < ApplicationController
 def import
   
@spreadsheet = open_spreadsheet(params[:file])
        @article = Article.create(title: @spreadsheet.sheet('Article').row(2)[0], content:
@spreadsheet.sheet('Article').row(2)[1])

last_row = @spreadsheet.sheet('comment').last_row
(2..last_row).each do |index|
   @comment = @article.comments.build(content: @spreadsheet.sheet('comment').row(index)   [0]) 
@comment.save  
debugger     


end
   
 

redirect_to articles_url
end


def open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
     end
   end
end






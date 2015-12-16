class DownloadsController < ApplicationController
   def download
     p = Axlsx::Package.new
     @article=Article.find(params[:id])
      @comments=@article.comments
       
      
    
p.workbook.add_worksheet(:name => "Article") do |sheet|
  sheet.add_row ["Title", "Content","Comment", "Status"]
  sheet.add_row [ @article.title, @article.content]

  end
 


send_data p.to_stream.read, type:"Article/xlsx", filename:"article.xlsx"
   end
    
   






      
   
end

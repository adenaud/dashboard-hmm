class HomeController < ApplicationController

  def index
    @count = Node.all.count
    @last_update = UploadData.last
  end

  def zones

  end

  def contributions
    @contributions = UploadData.all
    @contributions_non_null = UploadData.all.where('data_imported_count > 0').order('time desc')
    @contributors = UploadData.select(:uploader).distinct
  end

end

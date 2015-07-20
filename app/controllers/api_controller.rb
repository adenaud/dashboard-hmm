class ApiController < ApplicationController

  def countType
    @countTypes = Node.joins('INNER JOIN categories ON nodes.category = categories.id').
        group('categories.name').
        order('count(*) desc').
        count()
    render json: @countTypes.map
  end

  def importAverage
    @importAverage = UploadData.average(:data_imported_count).to_i
    render plain: @importAverage
  end

  def contributionEvolution

    contribution_evolution = UploadData.select('cast(time as date) as date, sum(data_imported_count) as total_import').group('cast(time as date)').order('cast(time as date) asc')

    datas = []
    contribution_evolution.each { |data|
      point = []
      point.push(data.date.strftime('%d/%m/%y'))
      point.push(data.total_import.to_i)
      datas.push(point)
    }

    render json: datas
  end
end
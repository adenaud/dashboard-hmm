class ApiController < ApplicationController

  def types_count

    count_types = Node.select('categories.name, count(*) as total, categories.color').
        joins('INNER JOIN categories ON nodes.category = categories.id').
        group('categories.name, categories.color').
        order('count(*) desc')

    data = []
    count_types.each { |type|
      point = {:name => type.name,
               :y => type.total,
               :color => type.color
      }
      data.push(point)
    }
    render json: data
  end

  def types_evolution

    category = Category.find_by(id: params[:id])
    nodes_evolutions = Node.select('n.time as date, (select count(*) FROM nodes m WHERE m.category = '+params[:id]+' and m.time <= n.time) as total')
                           .from('nodes n')
                           .group('n.time')
                           .order('date asc')

    data = []
    nodes_evolutions.each { |node|
      point = {:x => node.date.to_time.to_i * 1000,
               :y => node.total.to_i
      }
      data.push(point)
    }

    render json: {:color => category.color, :category => category.name, :data => data}
  end

  def contributions_average
    import_average = UploadData.average(:data_imported_count).to_i
    render plain: import_average
  end

  def contributions_evolution

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
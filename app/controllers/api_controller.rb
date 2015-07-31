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
    nodes_evolutions = Node.select('u.time date, (select count(*) FROM nodes n INNER JOIN upload_datas u2 ON n.id_upload = u2.id
WHERE n.category = '+params[:id]+' and u.time >=  u2.time ) as total')
                           .from('upload_datas u')
                           .group('u.id')
                           .order('date ASC')

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

    contribution_evolution = UploadData.select(' cast(time as date) as date, sum(data_imported_count) as total_import ').group(' cast(time as date) ').order(' cast(time as date) asc ')

    datas = []
    contribution_evolution.each { |data|
      point = []
      point.push(data.date.strftime('%d/%m/%y '))
      point.push(data.total_import.to_i)
      datas.push(point)
    }

    render json: datas
  end

  def zones_count


    zone_code = params[:zone];
    zone_code = zone_code.gsub('-','/') unless zone_code.blank?
    zones_count = Node.group(:category).where(:zone => zone_code).order(:category).count;

    zone = Zone.find_by(:codename => zone_code);
    zones = zones_count.map;

    total = 0;
    zones.each do |z|
      total += z[1];
    end
    render json: { :zone => zone.id, :total => total,:datas => zones}
  end

  def zones_list
    zones = Zone.all
    render json: zones
  end
end
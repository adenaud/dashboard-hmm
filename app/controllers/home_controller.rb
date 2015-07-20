class HomeController < ApplicationController

  baseZone = ['alikr/alikr_base' => 'Alikr',
              'auridon/auridon_base' => 'Auridion',
              'bangkorai/bangkorai_base' => 'Bankorai',
              'coldharbor/coldharbour_base' => 'Havreglace',
              'craglorn/craglorn_base' => 'Raidelorn',
              'cyrodiil/ava_whole' => 'Cyrodiil'

  ]


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

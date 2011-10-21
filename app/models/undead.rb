class Undead < ActiveFedora::Base
  include Hydra::ModelMixins::CommonMetadata
  include Hydra::ModelMethods
  
  has_metadata :name => "descMetadata", :type => ZombieEaccpfDatastream

  delegate :first_name, :to=>:descMetadata, :unique=>true
  delegate :date_undeath, :to=>:descMetadata, :unique=>true
  delegate :date_of_birth, :to=>:descMetadata, :unique=>true
  
  def to_solr(solr_doc=Hash.new)
    super
    solr_doc["object_type_facet"] = "Undead"
    return solr_doc
  end
end

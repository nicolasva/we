class ProsQuery
  attr_reader :relation

  def initialize(relation = Pro.all)
    @relation = relation
  end

  def find_skills(booking)
    relation.select('*')
            .from(select_pro_with_prestations(booking))
            .where("pros_skill.count_pros = #{booking.prestation_ids.length}")
  end

  private
  def select_pro_with_prestations(booking)
    "(SELECT pros.*, count(*) as count_pros
                FROM pros
                JOIN pro_prestations ON pro_prestations.pro_id = pros.id 
                JOIN prestations ON prestations.id = pro_prestations.prestation_id
                WHERE 'prestations'.'id' IN (#{booking.prestation_ids.join(',')}) GROUP BY 'pros'.'name') as pros_skill"
  end
end
require 'pp'

Array.class_eval do

    def tree(foreign_key = :parent_id, id_key = :id)
        grouped = self.group_by { |i| i[foreign_key].nil? ? 0 : i[foreign_key] }
        grouped.each do |parent_id, children|
          if parent_id && parent_id != 0
            parent = self.select { |e| e[id_key] == parent_id }.first
            parent[:leaves] = children
          end
        end
        grouped[0]
    end

end
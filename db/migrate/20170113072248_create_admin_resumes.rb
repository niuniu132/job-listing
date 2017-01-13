class CreateAdminResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_resumes do |t|

      t.timestamps
    end
  end
end

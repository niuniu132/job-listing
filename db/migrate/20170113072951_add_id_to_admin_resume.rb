class AddIdToAdminResume < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_resumes,:job_id,:integer
    add_column :admin_resumes,:user_id,:integer

  end
end

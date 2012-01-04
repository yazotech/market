class CreateAppsofts < ActiveRecord::Migration
  def self.up
    create_table :appsofts do |t|
      t.string :name
      t.string :size
      t.string :package_name
      t.string :brief
      t.string :author
      t.string :language
      t.integer :fever
      t.string :app_type
      t.string :apk_path
      t.string :version
      t.string :small_sdk

      t.timestamps
    end

    create_table :appimgs do |t|
      t.string :imgname
      t.integer :app_id 
      t.string :icon_path
    end
  end

  def self.down
    drop_table :appsofts
    drop_table :appfile
  end
end

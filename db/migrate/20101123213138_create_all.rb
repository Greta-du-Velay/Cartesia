class CreateAll < ActiveRecord::Migration
  def self.up
    
    # Sessions
    create_table :sessions do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end

    add_index :sessions, :session_id
    add_index :sessions, :updated_at

    # Users
    create_table(:users) do |t|

      t.string :name
      t.string :role, :default => 'manager' 

      t.references :company

      # devise
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable

      t.timestamps
    end

    add_index :users, :email #,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :unlock_token,         :unique => true    

    # Companies
    create_table :companies do |t|
      t.string :name
      t.string :manager
      t.string :description
      t.integer :workers_count
      t.string :permalink
      t.boolean :fake, :default => false

      t.references :user

      t.timestamps
    end

    # Company critical needs
    create_table :bcns do |t|
      t.string :name
      t.text :description
      t.string :label

      t.references :company

      t.timestamps
    end

    create_table :bcn_templates do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    
    create_table :learning_indicators do |t|
      t.string :name
      t.string :label

      t.references :bcn

      t.timestamps
    end
    
    create_table :levels do |t|
      t.integer :initial_level
      t.integer :current_level
      t.integer :target_level

      t.references :employee
      t.references :learning_indicator
      t.boolean :not_relevant, :default => false
      
      t.references :priority_rating

      t.timestamps
    end

    create_table :priority_ratings do |t|
      t.string :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :users
    drop_table :sessions
    drop_table :companies
    drop_table :bcns
    drop_table :bcn_templates
    drop_table :learning_indicators
    drop_table :levels
    drop_table :priority_ratings
  end
end

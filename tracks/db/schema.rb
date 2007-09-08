# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 36) do

  create_table "contexts", :force => true do |t|
    t.column "name",       :string,   :default => "",    :null => false
    t.column "position",   :integer,                     :null => false
    t.column "hide",       :boolean,  :default => false
    t.column "user_id",    :integer,  :default => 1
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  add_index "contexts", ["user_id"], :name => "index_contexts_on_user_id"
  add_index "contexts", ["user_id", "name"], :name => "index_contexts_on_user_id_and_name"

  create_table "notes", :force => true do |t|
    t.column "user_id",    :integer,  :null => false
    t.column "project_id", :integer,  :null => false
    t.column "body",       :text
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "open_id_associations", :force => true do |t|
    t.column "server_url", :binary
    t.column "handle",     :string
    t.column "secret",     :binary
    t.column "issued",     :integer
    t.column "lifetime",   :integer
    t.column "assoc_type", :string
  end

  create_table "open_id_nonces", :force => true do |t|
    t.column "nonce",   :string
    t.column "created", :integer
  end

  create_table "open_id_settings", :force => true do |t|
    t.column "setting", :string
    t.column "value",   :binary
  end

  create_table "preferences", :force => true do |t|
    t.column "user_id",                            :integer,                                                           :null => false
    t.column "date_format",                        :string,  :limit => 40, :default => "%d/%m/%Y",                     :null => false
    t.column "week_starts",                        :integer,               :default => 0,                              :null => false
    t.column "show_number_completed",              :integer,               :default => 5,                              :null => false
    t.column "staleness_starts",                   :integer,               :default => 7,                              :null => false
    t.column "show_completed_projects_in_sidebar", :boolean,               :default => true,                           :null => false
    t.column "show_hidden_contexts_in_sidebar",    :boolean,               :default => true,                           :null => false
    t.column "due_style",                          :integer,               :default => 0,                              :null => false
    t.column "admin_email",                        :string,                :default => "butshesagirl@rousette.org.uk", :null => false
    t.column "refresh",                            :integer,               :default => 0,                              :null => false
    t.column "verbose_action_descriptors",         :boolean,               :default => false,                          :null => false
    t.column "show_hidden_projects_in_sidebar",    :boolean,               :default => true,                           :null => false
    t.column "time_zone",                          :string,                :default => "London",                       :null => false
    t.column "show_project_on_todo_done",          :boolean,               :default => false,                          :null => false
    t.column "title_date_format",                  :string,                :default => "%A, %d %B %Y",                 :null => false
    t.column "mobile_todos_per_page",              :integer,               :default => 6,                              :null => false
  end

  add_index "preferences", ["user_id"], :name => "index_preferences_on_user_id"

  create_table "projects", :force => true do |t|
    t.column "name",               :string,                 :default => "",       :null => false
    t.column "position",           :integer,                                      :null => false
    t.column "user_id",            :integer,                :default => 1
    t.column "description",        :text
    t.column "state",              :string,   :limit => 20, :default => "active", :null => false
    t.column "created_at",         :datetime
    t.column "updated_at",         :datetime
    t.column "default_context_id", :integer
    t.column "completed_at",       :datetime
  end

  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"
  add_index "projects", ["user_id", "name"], :name => "index_projects_on_user_id_and_name"

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"

  create_table "taggings", :force => true do |t|
    t.column "taggable_id",   :integer
    t.column "tag_id",        :integer
    t.column "taggable_type", :string
    t.column "user_id",       :integer
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type"], :name => "index_taggings_on_tag_id_and_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.column "name",       :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

  create_table "todos", :force => true do |t|
    t.column "context_id",   :integer,                                         :null => false
    t.column "project_id",   :integer
    t.column "description",  :string,                 :default => "",          :null => false
    t.column "notes",        :text
    t.column "created_at",   :datetime
    t.column "due",          :date
    t.column "completed_at", :datetime
    t.column "user_id",      :integer,                :default => 1
    t.column "show_from",    :date
    t.column "state",        :string,   :limit => 20, :default => "immediate", :null => false
  end

  add_index "todos", ["user_id", "state"], :name => "index_todos_on_user_id_and_state"
  add_index "todos", ["user_id", "project_id"], :name => "index_todos_on_user_id_and_project_id"
  add_index "todos", ["project_id"], :name => "index_todos_on_project_id"
  add_index "todos", ["context_id"], :name => "index_todos_on_context_id"
  add_index "todos", ["user_id", "context_id"], :name => "index_todos_on_user_id_and_context_id"

  create_table "users", :force => true do |t|
    t.column "login",                     :string,   :limit => 80, :default => "",         :null => false
    t.column "crypted_password",          :string,   :limit => 40
    t.column "token",                     :string
    t.column "is_admin",                  :boolean,                :default => false,      :null => false
    t.column "first_name",                :string
    t.column "last_name",                 :string
    t.column "auth_type",                 :string,                 :default => "database", :null => false
    t.column "open_id_url",               :string
    t.column "remember_token",            :string
    t.column "remember_token_expires_at", :datetime
  end

  add_index "users", ["login"], :name => "index_users_on_login"

end

# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120427143135) do

  create_table "annotation", :force => true do |t|
    t.integer  "editor",    :null => false
    t.text     "text"
    t.string   "changelog"
    t.datetime "created"
  end

  create_table "artist", :force => true do |t|
    t.string   "gid",              :limit => nil,                :null => false
    t.integer  "name",                                           :null => false
    t.integer  "sort_name",                                      :null => false
    t.integer  "begin_date_year",  :limit => 2
    t.integer  "begin_date_month", :limit => 2
    t.integer  "begin_date_day",   :limit => 2
    t.integer  "end_date_year",    :limit => 2
    t.integer  "end_date_month",   :limit => 2
    t.integer  "end_date_day",     :limit => 2
    t.integer  "artist_type_id"
    t.integer  "country"
    t.integer  "gender"
    t.string   "comment"
    t.string   "ipi_code",         :limit => 11
    t.integer  "edits_pending",                   :default => 0, :null => false
    t.datetime "last_updated"
    t.boolean  "wmg_talent"
  end

  add_index "artist", ["gid"], :name => "artist_idx_gid", :unique => true
  add_index "artist", ["ipi_code"], :name => "artist_idx_ipi_code"
  add_index "artist", ["name"], :name => "artist_idx_name"
  add_index "artist", ["sort_name"], :name => "artist_idx_sort_name"

  create_table "artist_alias", :force => true do |t|
    t.integer  "artist",                       :null => false
    t.integer  "name",                         :null => false
    t.text     "locale"
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "artist_alias", ["artist", "locale"], :name => "artist_alias_idx_locale_artist", :unique => true
  add_index "artist_alias", ["artist"], :name => "artist_alias_idx_artist"

  create_table "artist_annotation", :id => false, :force => true do |t|
    t.integer "artist",     :null => false
    t.integer "annotation", :null => false
  end

  create_table "artist_credit", :force => true do |t|
    t.integer  "name",                                     :null => false
    t.integer  "artist_count", :limit => 2,                :null => false
    t.integer  "ref_count",                 :default => 0
    t.datetime "created"
  end

  create_table "artist_credit_name", :id => false, :force => true do |t|
    t.integer "artist_credit",              :null => false
    t.integer "position",      :limit => 2, :null => false
    t.integer "artist",                     :null => false
    t.integer "name",                       :null => false
    t.text    "join_phrase"
  end

  add_index "artist_credit_name", ["artist"], :name => "artist_credit_name_idx_artist"

  create_table "artist_gid_redirect", :id => false, :force => true do |t|
    t.string   "gid",     :limit => nil, :null => false
    t.integer  "new_id",                 :null => false
    t.datetime "created"
  end

  create_table "artist_meta", :id => false, :force => true do |t|
    t.integer "id",                        :null => false
    t.integer "rating",       :limit => 2
    t.integer "rating_count"
  end

  create_table "artist_name", :force => true do |t|
    t.string "name", :limit => nil, :null => false
  end

  add_index "artist_name", ["name"], :name => "artist_name_idx_name", :unique => true

  create_table "artist_rating_raw", :id => false, :force => true do |t|
    t.integer "artist",              :null => false
    t.integer "editor",              :null => false
    t.integer "rating", :limit => 2, :null => false
  end

  add_index "artist_rating_raw", ["artist"], :name => "artist_rating_raw_idx_artist"
  add_index "artist_rating_raw", ["editor"], :name => "artist_rating_raw_idx_editor"

  create_table "artist_tag", :id => false, :force => true do |t|
    t.integer  "artist",       :null => false
    t.integer  "tag",          :null => false
    t.integer  "count",        :null => false
    t.datetime "last_updated"
  end

  add_index "artist_tag", ["artist"], :name => "artist_tag_idx_artist"
  add_index "artist_tag", ["tag"], :name => "artist_tag_idx_tag"

  create_table "artist_tag_raw", :id => false, :force => true do |t|
    t.integer "artist", :null => false
    t.integer "editor", :null => false
    t.integer "tag",    :null => false
  end

  add_index "artist_tag_raw", ["artist"], :name => "artist_tag_raw_idx_artist"
  add_index "artist_tag_raw", ["editor"], :name => "artist_tag_raw_idx_editor"
  add_index "artist_tag_raw", ["tag"], :name => "artist_tag_raw_idx_tag"

  create_table "artist_type", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "autoeditor_election", :force => true do |t|
    t.integer  "candidate",                   :null => false
    t.integer  "proposer",                    :null => false
    t.integer  "seconder_1"
    t.integer  "seconder_2"
    t.integer  "status",       :default => 1, :null => false
    t.integer  "yes_votes",    :default => 0, :null => false
    t.integer  "no_votes",     :default => 0, :null => false
    t.datetime "propose_time",                :null => false
    t.datetime "open_time"
    t.datetime "close_time"
  end

  create_table "autoeditor_election_vote", :force => true do |t|
    t.integer  "autoeditor_election", :null => false
    t.integer  "voter",               :null => false
    t.integer  "vote",                :null => false
    t.datetime "vote_time",           :null => false
  end

  create_table "cdtoc", :force => true do |t|
    t.string   "discid",         :limit => 28,                     :null => false
    t.string   "freedb_id",      :limit => 8,                      :null => false
    t.integer  "track_count",                                      :null => false
    t.integer  "leadout_offset",                                   :null => false
    t.string   "track_offset",   :limit => nil,                    :null => false
    t.boolean  "degraded",                      :default => false, :null => false
    t.datetime "created"
  end

  add_index "cdtoc", ["discid"], :name => "cdtoc_idx_discid", :unique => true
  add_index "cdtoc", ["freedb_id"], :name => "cdtoc_idx_freedb_id"

  create_table "cdtoc_raw", :force => true do |t|
    t.integer "release",                       :null => false
    t.string  "discid",         :limit => 28,  :null => false
    t.integer "track_count",                   :null => false
    t.integer "leadout_offset",                :null => false
    t.string  "track_offset",   :limit => nil, :null => false
  end

  add_index "cdtoc_raw", ["discid"], :name => "cdtoc_raw_discid"
  add_index "cdtoc_raw", ["track_count", "leadout_offset", "track_offset"], :name => "cdtoc_raw_toc", :unique => true
  add_index "cdtoc_raw", ["track_offset"], :name => "cdtoc_raw_track_offset"

  create_table "clientversion", :force => true do |t|
    t.string   "version", :limit => 64, :null => false
    t.datetime "created"
  end

  create_table "country", :force => true do |t|
    t.string "iso_code", :limit => 2, :null => false
    t.string "name",                  :null => false
  end

  add_index "country", ["iso_code"], :name => "country_idx_iso_code", :unique => true

  create_table "dbmirror_pending", :primary_key => "seqid", :force => true do |t|
    t.string  "tablename", :limit => nil, :null => false
    t.string  "op",        :limit => 1
    t.integer "xid",                      :null => false
  end

  add_index "dbmirror_pending", ["xid"], :name => "dbmirror_pending_xid_index"

  create_table "dbmirror_pendingdata", :id => false, :force => true do |t|
    t.integer "seqid",                :null => false
    t.boolean "iskey",                :null => false
    t.string  "data",  :limit => nil
  end

  create_table "edit", :force => true do |t|
    t.integer  "editor",                                  :null => false
    t.integer  "type",        :limit => 2,                :null => false
    t.integer  "status",      :limit => 2,                :null => false
    t.text     "data",                                    :null => false
    t.integer  "yes_votes",                :default => 0, :null => false
    t.integer  "no_votes",                 :default => 0, :null => false
    t.integer  "autoedit",    :limit => 2, :default => 0, :null => false
    t.datetime "open_time"
    t.datetime "close_time"
    t.datetime "expire_time",                             :null => false
    t.integer  "language"
    t.integer  "quality",     :limit => 2, :default => 1, :null => false
  end

  add_index "edit", ["editor"], :name => "edit_idx_editor"
  add_index "edit", ["status"], :name => "edit_idx_status"
  add_index "edit", ["type"], :name => "edit_idx_type"

  create_table "edit_artist", :id => false, :force => true do |t|
    t.integer "edit",                :null => false
    t.integer "artist",              :null => false
    t.integer "status", :limit => 2, :null => false
  end

  add_index "edit_artist", ["artist"], :name => "edit_artist_idx"
  add_index "edit_artist", ["status"], :name => "edit_artist_idx_status"

  create_table "edit_label", :id => false, :force => true do |t|
    t.integer "edit",                :null => false
    t.integer "label",               :null => false
    t.integer "status", :limit => 2, :null => false
  end

  add_index "edit_label", ["label"], :name => "edit_label_idx"
  add_index "edit_label", ["status"], :name => "edit_label_idx_status"

  create_table "edit_note", :force => true do |t|
    t.integer  "editor",    :null => false
    t.integer  "edit",      :null => false
    t.text     "text",      :null => false
    t.datetime "post_time"
  end

  add_index "edit_note", ["edit"], :name => "edit_note_idx_edit"

  create_table "edit_recording", :id => false, :force => true do |t|
    t.integer "edit",      :null => false
    t.integer "recording", :null => false
  end

  add_index "edit_recording", ["recording"], :name => "edit_recording_idx"

  create_table "edit_release", :id => false, :force => true do |t|
    t.integer "edit",    :null => false
    t.integer "release", :null => false
  end

  add_index "edit_release", ["release"], :name => "edit_release_idx"

  create_table "edit_release_group", :id => false, :force => true do |t|
    t.integer "edit",          :null => false
    t.integer "release_group", :null => false
  end

  add_index "edit_release_group", ["release_group"], :name => "edit_release_group_idx"

  create_table "edit_url", :id => false, :force => true do |t|
    t.integer "edit", :null => false
    t.integer "url",  :null => false
  end

  add_index "edit_url", ["url"], :name => "edit_url_idx"

  create_table "edit_work", :id => false, :force => true do |t|
    t.integer "edit", :null => false
    t.integer "work", :null => false
  end

  add_index "edit_work", ["work"], :name => "edit_work_idx"

  create_table "editor", :force => true do |t|
    t.string   "name",                :limit => 64,                :null => false
    t.string   "password",            :limit => 64,                :null => false
    t.integer  "privs",                             :default => 0
    t.string   "email",               :limit => 64
    t.string   "website"
    t.text     "bio"
    t.datetime "member_since"
    t.datetime "email_confirm_date"
    t.datetime "last_login_date"
    t.integer  "edits_accepted",                    :default => 0
    t.integer  "edits_rejected",                    :default => 0
    t.integer  "auto_edits_accepted",               :default => 0
    t.integer  "edits_failed",                      :default => 0
    t.datetime "last_updated"
  end

  create_table "editor_collection", :force => true do |t|
    t.string  "gid",    :limit => nil,                    :null => false
    t.integer "editor",                                   :null => false
    t.string  "name",   :limit => nil,                    :null => false
    t.boolean "public",                :default => false, :null => false
  end

  add_index "editor_collection", ["editor"], :name => "editor_collection_idx_editor"
  add_index "editor_collection", ["gid"], :name => "editor_collection_idx_gid", :unique => true
  add_index "editor_collection", ["name"], :name => "editor_collection_idx_name"

  create_table "editor_collection_release", :id => false, :force => true do |t|
    t.integer "collection", :null => false
    t.integer "release",    :null => false
  end

  create_table "editor_preference", :force => true do |t|
    t.integer "editor",                :null => false
    t.string  "name",   :limit => 50,  :null => false
    t.string  "value",  :limit => 100, :null => false
  end

  add_index "editor_preference", ["editor", "name"], :name => "editor_preference_idx_editor_name", :unique => true

  create_table "editor_subscribe_artist", :force => true do |t|
    t.integer "editor",                         :null => false
    t.integer "artist",                         :null => false
    t.integer "last_edit_sent",                 :null => false
    t.integer "deleted_by_edit", :default => 0, :null => false
    t.integer "merged_by_edit",  :default => 0, :null => false
  end

  add_index "editor_subscribe_artist", ["artist"], :name => "editor_subscribe_artist_idx_artist"
  add_index "editor_subscribe_artist", ["editor", "artist"], :name => "editor_subscribe_artist_idx_uniq"

  create_table "editor_subscribe_editor", :force => true do |t|
    t.integer "editor",            :null => false
    t.integer "subscribed_editor", :null => false
    t.integer "last_edit_sent",    :null => false
  end

  add_index "editor_subscribe_editor", ["editor", "subscribed_editor"], :name => "editor_subscribe_editor_idx_uniq"

  create_table "editor_subscribe_label", :force => true do |t|
    t.integer "editor",                         :null => false
    t.integer "label",                          :null => false
    t.integer "last_edit_sent",                 :null => false
    t.integer "deleted_by_edit", :default => 0, :null => false
    t.integer "merged_by_edit",  :default => 0, :null => false
  end

  add_index "editor_subscribe_label", ["editor", "label"], :name => "editor_subscribe_label_idx_uniq"
  add_index "editor_subscribe_label", ["label"], :name => "editor_subscribe_label_idx_label"

  create_table "editor_watch_artist", :id => false, :force => true do |t|
    t.integer "artist", :null => false
    t.integer "editor", :null => false
  end

  create_table "editor_watch_preferences", :id => false, :force => true do |t|
    t.integer  "editor",                                                      :null => false
    t.boolean  "notify_via_email",                      :default => true,     :null => false
    t.string   "notification_timeframe", :limit => nil, :default => "7 days", :null => false
    t.datetime "last_checked",                                                :null => false
  end

  create_table "editor_watch_release_group_type", :id => false, :force => true do |t|
    t.integer "editor",             :null => false
    t.integer "release_group_type", :null => false
  end

  create_table "editor_watch_release_status", :id => false, :force => true do |t|
    t.integer "editor",         :null => false
    t.integer "release_status", :null => false
  end

  create_table "gender", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "isrc", :force => true do |t|
    t.integer  "recording",                                  :null => false
    t.string   "isrc",          :limit => 12,                :null => false
    t.integer  "source",        :limit => 2
    t.integer  "edits_pending",               :default => 0, :null => false
    t.datetime "created"
  end

  add_index "isrc", ["isrc", "recording"], :name => "isrc_idx_isrc_recording", :unique => true
  add_index "isrc", ["isrc"], :name => "isrc_idx_isrc"
  add_index "isrc", ["recording"], :name => "isrc_idx_recording"

  create_table "l_artist_artist", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_artist_artist", ["entity0", "entity1", "link"], :name => "l_artist_artist_idx_uniq", :unique => true
  add_index "l_artist_artist", ["entity1"], :name => "l_artist_artist_idx_entity1"

  create_table "l_artist_label", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_artist_label", ["entity0", "entity1", "link"], :name => "l_artist_label_idx_uniq", :unique => true
  add_index "l_artist_label", ["entity1"], :name => "l_artist_label_idx_entity1"

  create_table "l_artist_recording", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_artist_recording", ["entity0", "entity1", "link"], :name => "l_artist_recording_idx_uniq", :unique => true
  add_index "l_artist_recording", ["entity1"], :name => "l_artist_recording_idx_entity1"

  create_table "l_artist_release", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_artist_release", ["entity0", "entity1", "link"], :name => "l_artist_release_idx_uniq", :unique => true
  add_index "l_artist_release", ["entity1"], :name => "l_artist_release_idx_entity1"

  create_table "l_artist_release_group", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_artist_release_group", ["entity0", "entity1", "link"], :name => "l_artist_release_group_idx_uniq", :unique => true
  add_index "l_artist_release_group", ["entity1"], :name => "l_artist_release_group_idx_entity1"

  create_table "l_artist_url", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_artist_url", ["entity0", "entity1", "link"], :name => "l_artist_url_idx_uniq", :unique => true
  add_index "l_artist_url", ["entity1"], :name => "l_artist_url_idx_entity1"

  create_table "l_artist_work", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_artist_work", ["entity0", "entity1", "link"], :name => "l_artist_work_idx_uniq", :unique => true
  add_index "l_artist_work", ["entity1"], :name => "l_artist_work_idx_entity1"

  create_table "l_label_label", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_label_label", ["entity0", "entity1", "link"], :name => "l_label_label_idx_uniq", :unique => true
  add_index "l_label_label", ["entity1"], :name => "l_label_label_idx_entity1"

  create_table "l_label_recording", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_label_recording", ["entity0", "entity1", "link"], :name => "l_label_recording_idx_uniq", :unique => true
  add_index "l_label_recording", ["entity1"], :name => "l_label_recording_idx_entity1"

  create_table "l_label_release", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_label_release", ["entity0", "entity1", "link"], :name => "l_label_release_idx_uniq", :unique => true
  add_index "l_label_release", ["entity1"], :name => "l_label_release_idx_entity1"

  create_table "l_label_release_group", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_label_release_group", ["entity0", "entity1", "link"], :name => "l_label_release_group_idx_uniq", :unique => true
  add_index "l_label_release_group", ["entity1"], :name => "l_label_release_group_idx_entity1"

  create_table "l_label_url", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_label_url", ["entity0", "entity1", "link"], :name => "l_label_url_idx_uniq", :unique => true
  add_index "l_label_url", ["entity1"], :name => "l_label_url_idx_entity1"

  create_table "l_label_work", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_label_work", ["entity0", "entity1", "link"], :name => "l_label_work_idx_uniq", :unique => true
  add_index "l_label_work", ["entity1"], :name => "l_label_work_idx_entity1"

  create_table "l_recording_recording", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_recording_recording", ["entity0", "entity1", "link"], :name => "l_recording_recording_idx_uniq", :unique => true
  add_index "l_recording_recording", ["entity1"], :name => "l_recording_recording_idx_entity1"

  create_table "l_recording_release", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_recording_release", ["entity0", "entity1", "link"], :name => "l_recording_release_idx_uniq", :unique => true
  add_index "l_recording_release", ["entity1"], :name => "l_recording_release_idx_entity1"

  create_table "l_recording_release_group", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_recording_release_group", ["entity0", "entity1", "link"], :name => "l_recording_release_group_idx_uniq", :unique => true
  add_index "l_recording_release_group", ["entity1"], :name => "l_recording_release_group_idx_entity1"

  create_table "l_recording_url", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_recording_url", ["entity0", "entity1", "link"], :name => "l_recording_url_idx_uniq", :unique => true
  add_index "l_recording_url", ["entity1"], :name => "l_recording_url_idx_entity1"

  create_table "l_recording_work", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_recording_work", ["entity0", "entity1", "link"], :name => "l_recording_work_idx_uniq", :unique => true
  add_index "l_recording_work", ["entity1"], :name => "l_recording_work_idx_entity1"

  create_table "l_release_group_release_group", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_release_group_release_group", ["entity0", "entity1", "link"], :name => "l_release_group_release_group_idx_uniq", :unique => true
  add_index "l_release_group_release_group", ["entity1"], :name => "l_release_group_release_group_idx_entity1"

  create_table "l_release_group_url", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_release_group_url", ["entity0", "entity1", "link"], :name => "l_release_group_url_idx_uniq", :unique => true
  add_index "l_release_group_url", ["entity1"], :name => "l_release_group_url_idx_entity1"

  create_table "l_release_group_work", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_release_group_work", ["entity0", "entity1", "link"], :name => "l_release_group_work_idx_uniq", :unique => true
  add_index "l_release_group_work", ["entity1"], :name => "l_release_group_work_idx_entity1"

  create_table "l_release_release", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_release_release", ["entity0", "entity1", "link"], :name => "l_release_release_idx_uniq", :unique => true
  add_index "l_release_release", ["entity1"], :name => "l_release_release_idx_entity1"

  create_table "l_release_release_group", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_release_release_group", ["entity0", "entity1", "link"], :name => "l_release_release_group_idx_uniq", :unique => true
  add_index "l_release_release_group", ["entity1"], :name => "l_release_release_group_idx_entity1"

  create_table "l_release_url", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_release_url", ["entity0", "entity1", "link"], :name => "l_release_url_idx_uniq", :unique => true
  add_index "l_release_url", ["entity1"], :name => "l_release_url_idx_entity1"

  create_table "l_release_work", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_release_work", ["entity0", "entity1", "link"], :name => "l_release_work_idx_uniq", :unique => true
  add_index "l_release_work", ["entity1"], :name => "l_release_work_idx_entity1"

  create_table "l_url_url", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_url_url", ["entity0", "entity1", "link"], :name => "l_url_url_idx_uniq", :unique => true
  add_index "l_url_url", ["entity1"], :name => "l_url_url_idx_entity1"

  create_table "l_url_work", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_url_work", ["entity0", "entity1", "link"], :name => "l_url_work_idx_uniq", :unique => true
  add_index "l_url_work", ["entity1"], :name => "l_url_work_idx_entity1"

  create_table "l_work_work", :force => true do |t|
    t.integer  "link",                         :null => false
    t.integer  "entity0",                      :null => false
    t.integer  "entity1",                      :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "l_work_work", ["entity0", "entity1", "link"], :name => "l_work_work_idx_uniq", :unique => true
  add_index "l_work_work", ["entity1"], :name => "l_work_work_idx_entity1"

  create_table "label", :force => true do |t|
    t.string   "gid",              :limit => nil,                :null => false
    t.integer  "name",                                           :null => false
    t.integer  "sort_name",                                      :null => false
    t.integer  "begin_date_year",  :limit => 2
    t.integer  "begin_date_month", :limit => 2
    t.integer  "begin_date_day",   :limit => 2
    t.integer  "end_date_year",    :limit => 2
    t.integer  "end_date_month",   :limit => 2
    t.integer  "end_date_day",     :limit => 2
    t.integer  "label_code"
    t.integer  "label_type_id"
    t.integer  "country"
    t.string   "comment"
    t.string   "ipi_code",         :limit => 11
    t.integer  "edits_pending",                   :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "label", ["gid"], :name => "label_idx_gid", :unique => true
  add_index "label", ["ipi_code"], :name => "label_idx_ipi_code"
  add_index "label", ["name"], :name => "label_idx_name"
  add_index "label", ["sort_name"], :name => "label_idx_sort_name"

  create_table "label_alias", :force => true do |t|
    t.integer  "label",                        :null => false
    t.integer  "name",                         :null => false
    t.text     "locale"
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "label_alias", ["label", "locale"], :name => "label_alias_idx_locale_label", :unique => true
  add_index "label_alias", ["label"], :name => "label_alias_idx_label"

  create_table "label_annotation", :id => false, :force => true do |t|
    t.integer "label",      :null => false
    t.integer "annotation", :null => false
  end

  create_table "label_gid_redirect", :id => false, :force => true do |t|
    t.string   "gid",     :limit => nil, :null => false
    t.integer  "new_id",                 :null => false
    t.datetime "created"
  end

  create_table "label_meta", :id => false, :force => true do |t|
    t.integer "id",                        :null => false
    t.integer "rating",       :limit => 2
    t.integer "rating_count"
  end

  create_table "label_name", :force => true do |t|
    t.string "name", :limit => nil, :null => false
  end

  add_index "label_name", ["name"], :name => "label_name_idx_name", :unique => true

  create_table "label_rating_raw", :id => false, :force => true do |t|
    t.integer "label",               :null => false
    t.integer "editor",              :null => false
    t.integer "rating", :limit => 2, :null => false
  end

  add_index "label_rating_raw", ["editor"], :name => "label_rating_raw_idx_editor"
  add_index "label_rating_raw", ["label"], :name => "label_rating_raw_idx_label"

  create_table "label_tag", :id => false, :force => true do |t|
    t.integer  "label",        :null => false
    t.integer  "tag",          :null => false
    t.integer  "count",        :null => false
    t.datetime "last_updated"
  end

  add_index "label_tag", ["label"], :name => "label_tag_idx_label"
  add_index "label_tag", ["tag"], :name => "label_tag_idx_tag"

  create_table "label_tag_raw", :id => false, :force => true do |t|
    t.integer "label",  :null => false
    t.integer "editor", :null => false
    t.integer "tag",    :null => false
  end

  add_index "label_tag_raw", ["editor"], :name => "label_tag_raw_idx_editor"
  add_index "label_tag_raw", ["label"], :name => "label_tag_raw_idx_label"
  add_index "label_tag_raw", ["tag"], :name => "label_tag_raw_idx_tag"

  create_table "label_type", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "language", :force => true do |t|
    t.string  "iso_code_3t", :limit => 3,                  :null => false
    t.string  "iso_code_3b", :limit => 3,                  :null => false
    t.string  "iso_code_2",  :limit => 2
    t.string  "name",        :limit => 100,                :null => false
    t.integer "frequency",                  :default => 0, :null => false
  end

  add_index "language", ["iso_code_2"], :name => "language_idx_iso_code_2", :unique => true
  add_index "language", ["iso_code_3b"], :name => "language_idx_iso_code_3b", :unique => true
  add_index "language", ["iso_code_3t"], :name => "language_idx_iso_code_3t", :unique => true

  create_table "link", :force => true do |t|
    t.integer  "link_type",                                    :null => false
    t.integer  "begin_date_year",  :limit => 2
    t.integer  "begin_date_month", :limit => 2
    t.integer  "begin_date_day",   :limit => 2
    t.integer  "end_date_year",    :limit => 2
    t.integer  "end_date_month",   :limit => 2
    t.integer  "end_date_day",     :limit => 2
    t.integer  "attribute_count",               :default => 0, :null => false
    t.datetime "created"
  end

  add_index "link", ["link_type", "attribute_count"], :name => "link_idx_type_attr"

  create_table "link_attribute", :id => false, :force => true do |t|
    t.integer  "link",           :null => false
    t.integer  "attribute_type", :null => false
    t.datetime "created"
  end

  create_table "link_attribute_type", :force => true do |t|
    t.integer  "parent"
    t.integer  "root",                                       :null => false
    t.integer  "child_order",                 :default => 0, :null => false
    t.string   "gid",          :limit => nil,                :null => false
    t.string   "name",                                       :null => false
    t.text     "description"
    t.datetime "last_updated"
  end

  add_index "link_attribute_type", ["gid"], :name => "link_attribute_type_idx_gid", :unique => true

  create_table "link_type", :force => true do |t|
    t.integer  "parent"
    t.integer  "child_order",                        :default => 0, :null => false
    t.string   "gid",                 :limit => nil,                :null => false
    t.string   "entity_type0",        :limit => 50,                 :null => false
    t.string   "entity_type1",        :limit => 50,                 :null => false
    t.string   "name",                                              :null => false
    t.text     "description"
    t.string   "link_phrase",                                       :null => false
    t.string   "reverse_link_phrase",                               :null => false
    t.string   "short_link_phrase",                                 :null => false
    t.integer  "priority",                           :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "link_type", ["gid"], :name => "link_type_idx_gid", :unique => true

  create_table "link_type_attribute_type", :id => false, :force => true do |t|
    t.integer  "link_type",                   :null => false
    t.integer  "attribute_type",              :null => false
    t.integer  "min",            :limit => 2
    t.integer  "max",            :limit => 2
    t.datetime "last_updated"
  end

  create_table "medium", :force => true do |t|
    t.integer  "tracklist",                    :null => false
    t.integer  "release",                      :null => false
    t.integer  "position",                     :null => false
    t.integer  "format"
    t.string   "name"
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "medium", ["release"], :name => "medium_idx_release"
  add_index "medium", ["tracklist"], :name => "medium_idx_tracklist"

  create_table "medium_cdtoc", :force => true do |t|
    t.integer  "medium",                       :null => false
    t.integer  "cdtoc",                        :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "medium_cdtoc", ["cdtoc"], :name => "medium_cdtoc_idx_cdtoc"
  add_index "medium_cdtoc", ["medium", "cdtoc"], :name => "medium_cdtoc_idx_uniq", :unique => true
  add_index "medium_cdtoc", ["medium"], :name => "medium_cdtoc_idx_medium"

  create_table "medium_format", :force => true do |t|
    t.string  "name",        :limit => 100,                    :null => false
    t.integer "parent"
    t.integer "child_order",                :default => 0,     :null => false
    t.integer "year",        :limit => 2
    t.boolean "has_discids",                :default => false, :null => false
  end

  create_table "puid", :force => true do |t|
    t.string  "puid",    :limit => 36, :null => false
    t.integer "version",               :null => false
  end

  add_index "puid", ["puid"], :name => "puid_idx_puid", :unique => true

  create_table "recording", :force => true do |t|
    t.string   "gid",           :limit => nil,                :null => false
    t.integer  "name",                                        :null => false
    t.integer  "artist_credit",                               :null => false
    t.integer  "length"
    t.string   "comment"
    t.integer  "edits_pending",                :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "recording", ["artist_credit"], :name => "recording_idx_artist_credit"
  add_index "recording", ["gid"], :name => "recording_idx_gid", :unique => true
  add_index "recording", ["name"], :name => "recording_idx_name"

  create_table "recording_annotation", :id => false, :force => true do |t|
    t.integer "recording",  :null => false
    t.integer "annotation", :null => false
  end

  create_table "recording_gid_redirect", :id => false, :force => true do |t|
    t.string   "gid",     :limit => nil, :null => false
    t.integer  "new_id",                 :null => false
    t.datetime "created"
  end

  create_table "recording_meta", :id => false, :force => true do |t|
    t.integer "id",                        :null => false
    t.integer "rating",       :limit => 2
    t.integer "rating_count"
  end

  create_table "recording_puid", :force => true do |t|
    t.integer  "puid",                         :null => false
    t.integer  "recording",                    :null => false
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "created"
  end

  add_index "recording_puid", ["puid"], :name => "recording_puid_idx_puid"
  add_index "recording_puid", ["recording", "puid"], :name => "recording_puid_idx_uniq", :unique => true

  create_table "recording_rating_raw", :id => false, :force => true do |t|
    t.integer "recording",              :null => false
    t.integer "editor",                 :null => false
    t.integer "rating",    :limit => 2, :null => false
  end

  add_index "recording_rating_raw", ["editor"], :name => "recording_rating_raw_idx_editor"
  add_index "recording_rating_raw", ["recording"], :name => "recording_rating_raw_idx_track"

  create_table "recording_tag", :id => false, :force => true do |t|
    t.integer  "recording",    :null => false
    t.integer  "tag",          :null => false
    t.integer  "count",        :null => false
    t.datetime "last_updated"
  end

  add_index "recording_tag", ["recording"], :name => "recording_tag_idx_recording"
  add_index "recording_tag", ["tag"], :name => "recording_tag_idx_tag"

  create_table "recording_tag_raw", :id => false, :force => true do |t|
    t.integer "recording", :null => false
    t.integer "editor",    :null => false
    t.integer "tag",       :null => false
  end

  add_index "recording_tag_raw", ["editor"], :name => "recording_tag_raw_idx_editor"
  add_index "recording_tag_raw", ["recording"], :name => "recording_tag_raw_idx_track"
  add_index "recording_tag_raw", ["tag"], :name => "recording_tag_raw_idx_tag"

  create_table "release", :force => true do |t|
    t.string   "gid",           :limit => nil,                 :null => false
    t.integer  "name",                                         :null => false
    t.integer  "artist_credit",                                :null => false
    t.integer  "release_group",                                :null => false
    t.integer  "status"
    t.integer  "packaging"
    t.integer  "country"
    t.integer  "language"
    t.integer  "script"
    t.integer  "date_year",     :limit => 2
    t.integer  "date_month",    :limit => 2
    t.integer  "date_day",      :limit => 2
    t.string   "barcode"
    t.string   "comment"
    t.integer  "edits_pending",                :default => 0,  :null => false
    t.integer  "quality",       :limit => 2,   :default => -1, :null => false
    t.datetime "last_updated"
  end

  add_index "release", ["artist_credit"], :name => "release_idx_artist_credit"
  add_index "release", ["date_year", "date_month", "date_day"], :name => "release_idx_date"
  add_index "release", ["gid"], :name => "release_idx_gid", :unique => true
  add_index "release", ["name"], :name => "release_idx_name"
  add_index "release", ["release_group"], :name => "release_idx_release_group"

  create_table "release_annotation", :id => false, :force => true do |t|
    t.integer "release",    :null => false
    t.integer "annotation", :null => false
  end

  create_table "release_coverart", :id => false, :force => true do |t|
    t.integer  "id",            :null => false
    t.datetime "last_updated"
    t.string   "cover_art_url"
  end

  create_table "release_gid_redirect", :id => false, :force => true do |t|
    t.string   "gid",     :limit => nil, :null => false
    t.integer  "new_id",                 :null => false
    t.datetime "created"
  end

  create_table "release_group", :force => true do |t|
    t.string   "gid",                   :limit => nil,                :null => false
    t.integer  "name",                                                :null => false
    t.integer  "artist_credit",                                       :null => false
    t.integer  "release_group_type_id"
    t.string   "comment"
    t.integer  "edits_pending",                        :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "release_group", ["artist_credit"], :name => "release_group_idx_artist_credit"
  add_index "release_group", ["gid"], :name => "release_group_idx_gid", :unique => true
  add_index "release_group", ["name"], :name => "release_group_idx_name"

  create_table "release_group_annotation", :id => false, :force => true do |t|
    t.integer "release_group", :null => false
    t.integer "annotation",    :null => false
  end

  create_table "release_group_gid_redirect", :id => false, :force => true do |t|
    t.string   "gid",     :limit => nil, :null => false
    t.integer  "new_id",                 :null => false
    t.datetime "created"
  end

  create_table "release_group_meta", :id => false, :force => true do |t|
    t.integer "id",                                                   :null => false
    t.integer "release_count",                         :default => 0, :null => false
    t.integer "first_release_date_year",  :limit => 2
    t.integer "first_release_date_month", :limit => 2
    t.integer "first_release_date_day",   :limit => 2
    t.integer "rating",                   :limit => 2
    t.integer "rating_count"
  end

  create_table "release_group_rating_raw", :id => false, :force => true do |t|
    t.integer "release_group",              :null => false
    t.integer "editor",                     :null => false
    t.integer "rating",        :limit => 2, :null => false
  end

  add_index "release_group_rating_raw", ["editor"], :name => "release_group_rating_raw_idx_editor"
  add_index "release_group_rating_raw", ["release_group"], :name => "release_group_rating_raw_idx_release_group"

  create_table "release_group_tag", :id => false, :force => true do |t|
    t.integer  "release_group", :null => false
    t.integer  "tag",           :null => false
    t.integer  "count",         :null => false
    t.datetime "last_updated"
  end

  add_index "release_group_tag", ["release_group"], :name => "release_group_tag_idx_release_group"
  add_index "release_group_tag", ["tag"], :name => "release_group_tag_idx_tag"

  create_table "release_group_tag_raw", :id => false, :force => true do |t|
    t.integer "release_group", :null => false
    t.integer "editor",        :null => false
    t.integer "tag",           :null => false
  end

  add_index "release_group_tag_raw", ["editor"], :name => "release_group_tag_raw_idx_editor"
  add_index "release_group_tag_raw", ["release_group"], :name => "release_group_tag_raw_idx_release"
  add_index "release_group_tag_raw", ["tag"], :name => "release_group_tag_raw_idx_tag"

  create_table "release_group_type", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "release_label", :force => true do |t|
    t.integer  "release",        :null => false
    t.integer  "label"
    t.string   "catalog_number"
    t.datetime "last_updated"
  end

  add_index "release_label", ["label"], :name => "release_label_idx_label"
  add_index "release_label", ["release"], :name => "release_label_idx_release"

# Could not dump table "release_meta" because of following StandardError
#   Unknown type 'cover_art_presence' for column 'cover_art_presence'

  create_table "release_name", :force => true do |t|
    t.string "name", :limit => nil, :null => false
  end

  add_index "release_name", ["name"], :name => "release_name_idx_name", :unique => true

  create_table "release_packaging", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "release_raw", :force => true do |t|
    t.string   "title",                        :null => false
    t.string   "artist"
    t.datetime "added"
    t.datetime "last_modified"
    t.integer  "lookup_count",  :default => 0
    t.integer  "modify_count",  :default => 0
    t.integer  "source",        :default => 0
    t.string   "barcode"
    t.string   "comment"
  end

  add_index "release_raw", ["last_modified"], :name => "release_raw_idx_last_modified"
  add_index "release_raw", ["lookup_count"], :name => "release_raw_idx_lookup_count"
  add_index "release_raw", ["modify_count"], :name => "release_raw_idx_modify_count"

  create_table "release_status", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "release_tag", :id => false, :force => true do |t|
    t.integer  "release",      :null => false
    t.integer  "tag",          :null => false
    t.integer  "count",        :null => false
    t.datetime "last_updated"
  end

  create_table "release_tag_raw", :id => false, :force => true do |t|
    t.integer "release", :null => false
    t.integer "editor",  :null => false
    t.integer "tag",     :null => false
  end

  create_table "replication_control", :force => true do |t|
    t.integer  "current_schema_sequence",      :null => false
    t.integer  "current_replication_sequence"
    t.datetime "last_replication_date"
  end

  create_table "script", :force => true do |t|
    t.string  "iso_code",   :limit => 4,                  :null => false
    t.string  "iso_number", :limit => 3,                  :null => false
    t.string  "name",       :limit => 100,                :null => false
    t.integer "frequency",                 :default => 0, :null => false
  end

  add_index "script", ["iso_code"], :name => "script_idx_iso_code", :unique => true

  create_table "script_language", :force => true do |t|
    t.integer "script",                   :null => false
    t.integer "language",                 :null => false
    t.integer "frequency", :default => 0, :null => false
  end

  create_table "statistic", :force => true do |t|
    t.string  "name",           :limit => 100, :null => false
    t.integer "value",                         :null => false
    t.date    "date_collected",                :null => false
  end

  add_index "statistic", ["name", "date_collected"], :name => "statistic_name_date_collected", :unique => true
  add_index "statistic", ["name"], :name => "statistic_name"

  create_table "tag", :force => true do |t|
    t.string  "name",                     :null => false
    t.integer "ref_count", :default => 0, :null => false
  end

  add_index "tag", ["name"], :name => "tag_idx_name", :unique => true

  create_table "tag_relation", :id => false, :force => true do |t|
    t.integer  "tag1",         :null => false
    t.integer  "tag2",         :null => false
    t.integer  "weight",       :null => false
    t.datetime "last_updated"
  end

  create_table "track", :force => true do |t|
    t.integer  "recording",                    :null => false
    t.integer  "tracklist",                    :null => false
    t.integer  "position",                     :null => false
    t.integer  "name",                         :null => false
    t.integer  "artist_credit",                :null => false
    t.integer  "length"
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "track", ["artist_credit"], :name => "track_idx_artist_credit"
  add_index "track", ["name"], :name => "track_idx_name"
  add_index "track", ["recording"], :name => "track_idx_recording"
  add_index "track", ["tracklist", "position"], :name => "track_idx_tracklist"

  create_table "track_name", :force => true do |t|
    t.string "name", :limit => nil, :null => false
  end

  add_index "track_name", ["name"], :name => "track_name_idx_name", :unique => true

  create_table "track_raw", :force => true do |t|
    t.integer "release",  :null => false
    t.string  "title",    :null => false
    t.string  "artist"
    t.integer "sequence", :null => false
  end

  add_index "track_raw", ["release"], :name => "track_raw_idx_release"

  create_table "tracklist", :force => true do |t|
    t.integer  "track_count",  :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "tracklist", ["track_count"], :name => "tracklist_idx_track_count"

# Could not dump table "tracklist_index" because of following StandardError
#   Unknown type 'cube' for column 'toc'

  create_table "url", :force => true do |t|
    t.string   "gid",           :limit => nil,                :null => false
    t.text     "url",                                         :null => false
    t.text     "description"
    t.integer  "ref_count",                    :default => 0, :null => false
    t.integer  "edits_pending",                :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "url", ["gid"], :name => "url_idx_gid", :unique => true
  add_index "url", ["url"], :name => "url_idx_url", :unique => true

  create_table "url_gid_redirect", :id => false, :force => true do |t|
    t.string   "gid",     :limit => nil, :null => false
    t.integer  "new_id",                 :null => false
    t.datetime "created"
  end

  create_table "vote", :force => true do |t|
    t.integer  "editor",                                     :null => false
    t.integer  "edit",                                       :null => false
    t.integer  "vote",       :limit => 2,                    :null => false
    t.datetime "vote_time"
    t.boolean  "superseded",              :default => false, :null => false
  end

  add_index "vote", ["edit"], :name => "vote_idx_edit"
  add_index "vote", ["editor"], :name => "vote_idx_editor"

  create_table "wmg_artist", :id => false, :force => true do |t|
    t.integer "artist_id"
    t.string  "artist_name"
    t.string  "country_of_origin", :limit => 3
    t.string  "genre",             :limit => 20
    t.integer "mb_id"
  end

  create_table "wmg_asset", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "artist_id"
    t.integer "project_id"
    t.string  "gaid",             :limit => 33
    t.string  "gaid_type",        :limit => 10
    t.string  "display_title"
    t.string  "category",         :limit => 43
    t.string  "type",             :limit => 40
    t.string  "sub_type",         :limit => 40
    t.string  "major_genre",      :limit => 40
    t.string  "play_length",      :limit => 15
    t.string  "repertoire_owner", :limit => 100
  end

  create_table "wmg_asset_work", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.string  "work_id",  :limit => 16
  end

  create_table "wmg_component", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "parent_product_id"
    t.integer "asset_id"
    t.integer "unit_number"
    t.integer "side"
    t.integer "sequence"
  end

  create_table "wmg_contract", :id => false, :force => true do |t|
    t.string  "contract_id",   :limit => 16
    t.string  "contract_type", :limit => 30
    t.string  "contract_name", :limit => 200
    t.string  "start_date",    :limit => 20
    t.string  "end_date",      :limit => 20
    t.integer "entity_id"
    t.string  "entity",        :limit => 20
  end

  create_table "wmg_product", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "artist_id"
    t.integer "project_id"
    t.string  "gpid",                      :limit => 33
    t.string  "gpid_type",                 :limit => 20
    t.string  "display_title"
    t.string  "category",                  :limit => 40
    t.string  "product_type",              :limit => 40
    t.string  "sub_type",                  :limit => 40
    t.string  "product_media_type",        :limit => 40
    t.string  "major_genre",               :limit => 40
    t.string  "first_global_release_date", :limit => 20
    t.string  "marketing_owner",           :limit => 100
  end

  create_table "wmg_project", :id => false, :force => true do |t|
    t.integer "project_id"
    t.string  "contract_id",        :limit => 16
    t.string  "project_nm",         :limit => 200
    t.string  "first_release_date", :limit => 20
    t.string  "budget",             :limit => 100
    t.string  "financial_company",  :limit => 100
    t.string  "profit_center",      :limit => 100
  end

  create_table "wmg_rights", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "right_type",          :limit => 30
    t.string  "permission_type",     :limit => 30
    t.string  "grant_desc",          :limit => 50
    t.string  "code",                :limit => 30
    t.string  "effective_from_date", :limit => 30
    t.string  "effective_to_date",   :limit => 30
    t.string  "notes",               :limit => 50
    t.string  "entity",              :limit => 50
    t.string  "entity_id",           :limit => 33
    t.string  "ownership_percetage", :limit => 30
    t.string  "claim_percetage",     :limit => 30
  end

  create_table "wmg_rights_territories", :id => false, :force => true do |t|
    t.string "code", :limit => 15
    t.text   "name"
  end

  create_table "wmg_roles", :id => false, :force => true do |t|
    t.integer "role_id"
    t.string  "role_name", :limit => 30
  end

  create_table "wmg_social_media", :id => false, :force => true do |t|
    t.integer "social_media_id"
    t.string  "account_type",    :limit => 30
    t.string  "account_id",      :limit => 130
    t.integer "artist_id"
    t.integer "talent_id"
  end

  create_table "wmg_talent", :id => false, :force => true do |t|
    t.integer "participant_id"
    t.string  "name"
    t.string  "birthdate",      :limit => 30
    t.string  "email",          :limit => 60
    t.string  "home_phone",     :limit => 20
    t.string  "business_phone", :limit => 30
    t.string  "cell_phone",     :limit => 30
    t.integer "address_id"
    t.integer "mb_id"
  end

  create_table "wmg_talent_role_identity", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "talent_id"
    t.integer "role_code"
    t.string  "entity",    :limit => 30
    t.string  "entity_id", :limit => 33
  end

  create_table "wmg_websites", :id => false, :force => true do |t|
    t.integer "talent_website_id"
    t.string  "url",               :limit => 130
    t.string  "website_name",      :limit => 130
    t.integer "talent_id"
    t.integer "artist_id"
  end

  create_table "wmg_work", :id => false, :force => true do |t|
    t.string  "id",                           :limit => 50
    t.string  "contract_id",                  :limit => 16
    t.integer "project_id"
    t.string  "iswc",                         :limit => 30
    t.string  "title"
    t.string  "type",                         :limit => 30
    t.integer "year"
    t.string  "language",                     :limit => 30
    t.string  "estimated_public_domain_date", :limit => 30
  end

  create_table "work", :force => true do |t|
    t.string   "gid",           :limit => nil,                :null => false
    t.integer  "name",                                        :null => false
    t.integer  "artist_credit"
    t.integer  "type"
    t.string   "iswc",          :limit => 15
    t.string   "comment"
    t.integer  "edits_pending",                :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "work", ["artist_credit"], :name => "work_idx_artist_credit"
  add_index "work", ["gid"], :name => "work_idx_gid", :unique => true
  add_index "work", ["name"], :name => "work_idx_name"

  create_table "work_alias", :force => true do |t|
    t.integer  "work",                         :null => false
    t.integer  "name",                         :null => false
    t.text     "locale"
    t.integer  "edits_pending", :default => 0, :null => false
    t.datetime "last_updated"
  end

  add_index "work_alias", ["work", "locale"], :name => "work_alias_idx_locale_work", :unique => true
  add_index "work_alias", ["work"], :name => "work_alias_idx_work"

  create_table "work_annotation", :id => false, :force => true do |t|
    t.integer "work",       :null => false
    t.integer "annotation", :null => false
  end

  create_table "work_gid_redirect", :id => false, :force => true do |t|
    t.string   "gid",     :limit => nil, :null => false
    t.integer  "new_id",                 :null => false
    t.datetime "created"
  end

  create_table "work_meta", :id => false, :force => true do |t|
    t.integer "id",                        :null => false
    t.integer "rating",       :limit => 2
    t.integer "rating_count"
  end

  create_table "work_name", :force => true do |t|
    t.string "name", :limit => nil, :null => false
  end

  add_index "work_name", ["name"], :name => "work_name_idx_name", :unique => true

  create_table "work_rating_raw", :id => false, :force => true do |t|
    t.integer "work",                :null => false
    t.integer "editor",              :null => false
    t.integer "rating", :limit => 2, :null => false
  end

  create_table "work_tag", :id => false, :force => true do |t|
    t.integer  "work",         :null => false
    t.integer  "tag",          :null => false
    t.integer  "count",        :null => false
    t.datetime "last_updated"
  end

  add_index "work_tag", ["tag"], :name => "work_tag_idx_tag"

  create_table "work_tag_raw", :id => false, :force => true do |t|
    t.integer "work",   :null => false
    t.integer "editor", :null => false
    t.integer "tag",    :null => false
  end

  create_table "work_type", :force => true do |t|
    t.string "name", :null => false
  end

end

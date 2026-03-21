module Types
  class DashboardStatsType < Types::BaseObject
    field :total, Integer, null: false
    field :open, Integer, null: false
    field :resolved, Integer, null: false
    field :high_priority, Integer, null: false
  end
end
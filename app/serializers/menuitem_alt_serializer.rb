class MenuitemAltSerializer < MenuitemSerializer
  has_many :shmeals
  has_many :shmmenuitemstatuses
  has_many :shmshmealattributes
end
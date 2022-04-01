# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == "システム管理者"
      can :manage, :all
    elsif user.role == "運用管理者"
      can :manage, :all
    elsif user.role == "マネージャー"
      can :read, :all
      # 全てのリストを閲覧可能にする
      can :access_all_list_page, :all
      
    elsif user.role == "一般"
      # 担当かクローザーになっているリードのみアクセスできる
      can :read, :all
      cannot :read, Lead
      can :manage, Lead, owner: user
      can :manage, Lead, closer: user
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
class TradePolicy < ApplicationPolicy

  def accept?
    @user == @record.user
  end

  def show?
    user_owns_record
  end

  def destroy?
    user_owns_record
  end

  def user_owns_record
    @user.credit_cards.include? @record
  end

end

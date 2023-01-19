class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where("from_account = ? OR to_account = ?", params[:account], params[:account])
    render json: @transactions
end

    # def index
    #     @transactions = Transaction.where(from_account: params[:from_account]).page(params[:page]).per(params[:per])
    #     render json: @transactions
    # end
        
    def create
      from_account = params[:fromAccount]
      to_account = params[:toAccount]
      amount = params[:amount]
  
      if Account.exists?(name: from_account) && Account.exists?(name: to_account)
        from_account = Account.find_by(name: from_account)
        to_account = Account.find_by(name: to_account)
        if from_account.balance >= amount
          # Process the transaction
          from_account.balance -= amount
          to_account.balance += amount
          from_account.save
          to_account.save
          # save the transaction
          Transaction.create(from_account: from_account.name, to_account: to_account.name, amount: amount, timestamp: Time.now)
          render json: { message: 'Transaction successful' }
        else
          render json: { error: 'Not enough balance' }, status: :unprocessable_entity
        end
      else
        render json: { error: 'Account not found' }, status: :not_found
      end
    end
  
    
  end
  

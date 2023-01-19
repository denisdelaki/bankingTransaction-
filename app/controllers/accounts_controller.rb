class AccountsController < ApplicationController
    def show
        @account = Account.find_by(name: params[:name])
        if @account
            render json: @account
        else
            render json: {error: 'Account not found'}, status: :not_found
        end
    end
end

class ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[ show edit update destroy ]

  # GET /conversations
  def index
    @conversations = Conversation.all
  end

  # GET /conversations/1
  def show
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  def create
    @conversation = Conversation.new(conversation_params)

    if @conversation.save
      redirect_to @conversation, notice: "Conversation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conversations/1
  def update
    if @conversation.update(conversation_params)
      redirect_to @conversation, notice: "Conversation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /conversations/1
  def destroy
    @conversation.destroy
    redirect_to conversations_url, notice: "Conversation was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.fetch(:conversation, {})
    end
end

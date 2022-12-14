module ConversationsHelper
  def last_message_extract_for conversation
    (conversation.messages.last&.content || "")[0, 50]
  end

  def last_message_class_for conversation
    direction = conversation.messages.last&.direction
    direction ? "Conversation__sub--#{direction}" : "Conversation__sub--empty"
  end
end

class Api::V1::AttachmentsController < Api::V1::BaseController

  def index

  end

  # params do
  #   requires :attachment, type: Hash do
  #     requires :file, type: Hash do
  #       optional :filename
  #       optional :type
  #       optional :headers
  #       optional :tempfile
  #     end
  #   end
  # end
  def upload
    permitted_params = attachment_params
    file = permitted_params.delete(:file)
    attachment_params = {
      :name => file[:name],
      :type => file[:type],
      :headers => file[:headers],
      :tempfile => file[:tempfile]
    }
    tempfile = ActionDispatch::Http::UploadedFile.new(attachment_params)

    attachment = Attachment.create(file: tempfile, user: current_user)
    {
      code: 0,
      data: AttachmentSerializer.new(attachment)
    }
  end

  # params do
  #   requires :attachments, type: Hash
  # end
  def multi_upload
    authenticate!
    attachments = []
    (attachment_params[:attachments] || []).each do |key, value|
      if value[:file]
        attachment = value[:file]
        attachment_params = {
          :filename => attachment[:filename],
          :type => attachment[:type],
          :headers => attachment[:head],
          :tempfile => attachment[:tempfile]
        }
        file = ActionDispatch::Http::UploadedFile.new(attachment_params)
        attachments << Attachment.create(file: file, user: current_user)
      end
    end
    {
      code: 0,
      data: attachments
    }
  end
end

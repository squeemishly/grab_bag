class DataSlurper

  def initialize(path, extension, current_user, binary_id)
    @path = path
    @extension = extension
    @pictures = (%w(jpeg tiff jpg))
    @files = (%w(docx pdf doc xls xlsx ppt pptx))
    @user = current_user
    @binary_id = binary_id
  end

  def direct_slurping
    if pictures.include?(extension.downcase)
      picture_slurping
    elsif files.include?(extension.downcase)
      file_slurping
    end
  end

  private
  attr_reader :path, :extension, :pictures, :files, :user, :binary_id

  def file_slurping
    yomu = Yomu.new(path)
    FileMetaDataService.new(yomu, user, binary_id, extension).collect
  end

  def picture_slurping
    exif_object = EXIFR::JPEG.new(path)
    PictureMetaDataService.new(exif_object, user, binary_id).collect
  end
end

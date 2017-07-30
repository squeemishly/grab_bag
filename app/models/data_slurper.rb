class DataSlurper

  def initialize(path = nil, extension = nil, binary_id = nil, current_user )
    @path = path
    @extension = extension
    @pictures = (%w(jpeg tiff))
    @files = (%w(docx pdf doc xls xlsx ppt pptx))
    @user = current_user
    @binary_id = binary_id
  end

  def direct_slurping
    if pictures.include?(extension)
      picture_slurping(path)
    elsif files.include?(extension)
      file_slurping
    end
  end

  def fb_slurping
    photos = MetaDataPhoto.where(user_id: user.id)
    photos.each do |photo|
      url = photo.image
      create_delete_images(url)
    end
  end

  private
    attr_reader :path, :extension, :pictures, :files, :user, :binary_id

    def create_delete_images(url)
      
    end

    def file_slurping
      yomu = Yomu.new(path)
      FileMetaDataService.new(yomu, user, binary_id).collect
    end

    def picture_slurping(path)
      exif_object = EXIFR::JPEG.new(path)
      PictureMetaDataService.new(exif_object, user, binary_id).collect
    end
end

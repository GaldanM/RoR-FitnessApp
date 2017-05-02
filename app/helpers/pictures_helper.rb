module PicturesHelper
  def pics(selected = nil)
    options_for_select(Picture.all.map { |p|
       ['', {
          :'data-img-src' => File.join('/uploads', p.filename),
          :'data-img-alt' => p.alt_text,
          selected: selected && selected.include?(p)
      }, p.id]
    })
  end
end
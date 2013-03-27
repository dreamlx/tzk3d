# encoding: utf-8

class Model3dUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(stl x3d vrml)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end

#######################################################

#
#3dm  3D metafile和Rhinoceros的文件格式
#
#3ds  DOS下的三维软件3D Studio的文件格式,可以记录基本的动画信息.
#
#dxf  (Drawing Exchange Format) Autodesk的图形交换格式,为ASCII文件.
#    AutoCAD的12版,13版,14版,2000版的DXF各有不同.包含Polyfaceemsh和3dface.
#
#prj  3D Studio的工程文件,比3ds记录的信息更多,包括贴图路径,实心体模型.可以包含AutoCAD的实心体,曲面区域的ASCII格式的ACIS文件.
#
#stl  Stereolithography立体石版印刷术文件,与立体石版印刷设备(sla)兼容.只能存储完全封闭的模型.
#
#iges  基本图形传输协议.可以存储BURBS和多边形(Rhino的IGES因为与多边形兼容性差而将它的IGES存储多边形能力屏蔽了)
#
#mdt  Autodesk Mechanical Desktop的文件.

#low/lw  Lightwave的物体格式.

#lws  Lingtwave的场景文件.

#ag   AGLib binary文件格式.可以存储NURBS模型.

#pov  Pov-ray文件格式.Pov-ray是一个自由软件.可以进行光影跟踪.Rhino对它提供支持.单独使用它很不方便,场景没有图形界面.效果一般.

#rib  (renderman interface bitystream)著名渲染软件Renderman的格式.

#udo  Moray UDO文件格式.Moray是一个共享软件.可以从www.stmuc.com下载.

#obj  Wavefront OBJ文件.

#geo  AOFF文件.

#v3d  Stratum 3D object.

#vdr  Stratum 2D Space.

#mdl  Quake模型.

#mdz  Quake2模型.

#scn  Caligari场景.

#cob  caligari物体.

#iob  Imagine物体.

#c4d  Cinema 4D文件格式.

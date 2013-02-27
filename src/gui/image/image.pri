# -*-mode:sh-*-
# Qt image handling

# Qt kernel module

HEADERS += \
        image/qbitmap.h \
        image/qicon.h \
        image/qicon_p.h \
        image/qiconloader_p.h \
        image/qiconengine.h \
        image/qiconengineplugin.h \
        image/qimage.h \
        image/qimage_p.h \
        image/qimageiohandler.h \
        image/qimagereader.h \
        image/qimagewriter.h \
        image/qmovie.h \
        image/qnativeimage_p.h \
        image/qpaintengine_pic_p.h \
        image/qpicture.h \
        image/qpicture_p.h \
        image/qpictureformatplugin.h \
        image/qpixmap.h \
        image/qpixmap_raster_p.h \
        image/qpixmap_blitter_p.h \
        image/qpixmapcache.h \
        image/qpixmapcache_p.h \
        image/qpixmapdata_p.h \
        image/qpixmapdatafactory_p.h \
        image/qpixmapfilter_p.h \
        image/qimagepixmapcleanuphooks_p.h \
        image/qvolatileimage_p.h \
        image/qvolatileimagedata_p.h \
        image/qnativeimagehandleprovider_p.h

SOURCES += \
        image/qbitmap.cpp \
        image/qicon.cpp \
        image/qiconloader.cpp \
        image/qimage.cpp \
        image/qimageiohandler.cpp \
        image/qimagereader.cpp \
        image/qimagewriter.cpp \
        image/qpaintengine_pic.cpp \
        image/qpicture.cpp \
        image/qpictureformatplugin.cpp \
        image/qpixmap.cpp \
        image/qpixmapcache.cpp \
        image/qpixmapdata.cpp \
        image/qpixmapdatafactory.cpp \
        image/qpixmapfilter.cpp \
        image/qiconengine.cpp \
        image/qiconengineplugin.cpp \
        image/qmovie.cpp \
        image/qpixmap_raster.cpp \
        image/qpixmap_blitter.cpp \
        image/qnativeimage.cpp \
        image/qimagepixmapcleanuphooks.cpp \
        image/qvolatileimage.cpp

win32 {
    SOURCES += image/qpixmap_win.cpp
}
else:embedded {
    SOURCES += image/qpixmap_qws.cpp
}
else:qpa {
    SOURCES += image/qpixmap_qpa.cpp
}
else:x11 {
    HEADERS += image/qpixmap_x11_p.h
    SOURCES += image/qpixmap_x11.cpp
}
else:mac {
    HEADERS += image/qpixmap_mac_p.h
    SOURCES += image/qpixmap_mac.cpp
}
else:symbian {
    HEADERS += image/qpixmap_raster_symbian_p.h
    SOURCES += image/qpixmap_raster_symbian.cpp
}

!symbian|contains(S60_VERSION, 3.1)|contains(S60_VERSION, 3.2) {
    SOURCES += image/qvolatileimagedata.cpp
}
else {
    SOURCES += image/qvolatileimagedata_symbian.cpp
}

# Built-in image format support
HEADERS += \
        image/qbmphandler_p.h \
        image/qppmhandler_p.h \
        image/qxbmhandler_p.h \
        image/qxpmhandler_p.h \
        image/qjpeghandler_p.h

SOURCES += \
        image/qbmphandler.cpp \
        image/qppmhandler.cpp \
        image/qxbmhandler.cpp \
        image/qxpmhandler.cpp \
        image/qjpeghandler.cpp

INCLUDEPATH += $$PWD/libjpeg
SOURCES += \
    $$PWD/../../3rdparty/libjpeg/jaricom.c \
    $$PWD/../../3rdparty/libjpeg/jcapimin.c \
    $$PWD/../../3rdparty/libjpeg/jcapistd.c \
    $$PWD/../../3rdparty/libjpeg/jcarith.c \
    $$PWD/../../3rdparty/libjpeg/jccoefct.c \
    $$PWD/../../3rdparty/libjpeg/jccolor.c \
    $$PWD/../../3rdparty/libjpeg/jcdctmgr.c \
    $$PWD/../../3rdparty/libjpeg/jchuff.c \
    $$PWD/../../3rdparty/libjpeg/jcinit.c \
    $$PWD/../../3rdparty/libjpeg/jcmainct.c \
    $$PWD/../../3rdparty/libjpeg/jcmarker.c \
    $$PWD/../../3rdparty/libjpeg/jcmaster.c \
    $$PWD/../../3rdparty/libjpeg/jcomapi.c \
    $$PWD/../../3rdparty/libjpeg/jcparam.c \
    $$PWD/../../3rdparty/libjpeg/jcprepct.c \
    $$PWD/../../3rdparty/libjpeg/jcsample.c \
    $$PWD/../../3rdparty/libjpeg/jctrans.c \
    $$PWD/../../3rdparty/libjpeg/jdapimin.c \
    $$PWD/../../3rdparty/libjpeg/jdapistd.c \
    $$PWD/../../3rdparty/libjpeg/jdarith.c \
    $$PWD/../../3rdparty/libjpeg/jdatadst.c \
    $$PWD/../../3rdparty/libjpeg/jdatasrc.c \
    $$PWD/../../3rdparty/libjpeg/jdcoefct.c \
    $$PWD/../../3rdparty/libjpeg/jdcolor.c \
    $$PWD/../../3rdparty/libjpeg/jddctmgr.c \
    $$PWD/../../3rdparty/libjpeg/jdhuff.c \
    $$PWD/../../3rdparty/libjpeg/jdinput.c \
    $$PWD/../../3rdparty/libjpeg/jdmainct.c \
    $$PWD/../../3rdparty/libjpeg/jdmarker.c \
    $$PWD/../../3rdparty/libjpeg/jdmaster.c \
    $$PWD/../../3rdparty/libjpeg/jdmerge.c \
    $$PWD/../../3rdparty/libjpeg/jdpostct.c \
    $$PWD/../../3rdparty/libjpeg/jdsample.c \
    $$PWD/../../3rdparty/libjpeg/jdtrans.c \
    $$PWD/../../3rdparty/libjpeg/jerror.c \
    $$PWD/../../3rdparty/libjpeg/jfdctflt.c \
    $$PWD/../../3rdparty/libjpeg/jfdctfst.c \
    $$PWD/../../3rdparty/libjpeg/jfdctint.c \
    $$PWD/../../3rdparty/libjpeg/jidctflt.c \
    $$PWD/../../3rdparty/libjpeg/jidctfst.c \
    $$PWD/../../3rdparty/libjpeg/jidctint.c \
    $$PWD/../../3rdparty/libjpeg/jquant1.c \
    $$PWD/../../3rdparty/libjpeg/jquant2.c \
    $$PWD/../../3rdparty/libjpeg/jutils.c \
    $$PWD/../../3rdparty/libjpeg/jmemmgr.c \
    $$PWD/../../3rdparty/libjpeg/jmemnobs.c

!contains(QT_CONFIG, no-png):include($$PWD/qpnghandler.pri)
#!contains(QT_CONFIG, no-png):include($$PWD/qjpeghandler.pri)
else:DEFINES *= QT_NO_IMAGEFORMAT_PNG

#contains(QT_CONFIG, jpeg):include($$PWD/qjpeghandler.pri)
contains(QT_CONFIG, mng):include($$PWD/qmnghandler.pri)
contains(QT_CONFIG, tiff):include($$PWD/qtiffhandler.pri)
contains(QT_CONFIG, gif):include($$PWD/qgifhandler.pri)

# SIMD
NEON_SOURCES += image/qimage_neon.cpp
SSE2_SOURCES += image/qimage_sse2.cpp
SSSE3_SOURCES += image/qimage_ssse3.cpp

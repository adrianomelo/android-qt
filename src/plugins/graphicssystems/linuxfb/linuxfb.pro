TARGET = qlinuxfbgraphicssystem
include(../../qpluginbase.pri)

QTDIR_build:DESTDIR = $$QT_BUILD_TREE/plugins/graphicssystems

SOURCES = main.cpp qgraphicssystem_linuxfb.cpp qwindowsurface_linuxfb.cpp
HEADERS = qgraphicssystem_linuxfb.h qwindowsurface_linuxfb.h

target.path += $$[QT_INSTALL_PLUGINS]/graphicssystems
INSTALLS += target
#-------------------------------------------------
#
# Project created by QtCreator 2018-10-06T08:16:10
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = testbodymover
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
        main.cpp \
        mainwindow.cpp

HEADERS += \
        mainwindow.h

FORMS += \
        mainwindow.ui

include($${PWD}/../../multi-link/add_base_manager.pri)

#-------------------------------------------------
#用户工程配置
#-------------------------------------------------
add_version(1,0,0,0)
add_deploy()
add_dependent_manager(QQt)
system(touch main.cpp)

HEADERS += \
    mainwidget.h
SOURCES += \
    mainwidget.cpp

#CONFIG += use_source
use_source {
    add_file(qqtbodymover.h)
    add_file(qqtbodymover.cpp)
    add_file(qqtbodymover_p.h)
    add_file(qqtbodymover_p.cpp)
    HEADERS += \
        qqtbodymover.h \
        qqtbodymover_p.h
    SOURCES += \
        qqtbodymover.cpp \
        qqtbodymover_p.cpp
}
#-------------------------------------------------
#用户工程配置
#-------------------------------------------------
equals(QSYS_PRIVATE, macOS) {
    CONFIG += app_bundle
    QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.9
    LIBS += -framework DiskArbitration -framework Cocoa -framework IOKit -framework CoreGraphics
}

contains(QSYS_PRIVATE, Android|AndroidX86) {
    CONFIG += mobility
    MOBILITY =
    DISTFILES += \
        android/AndroidManifest.xml

    ANDROID_PACKAGE_SOURCE_DIR = $${PWD}/android
}

message ($${TARGET} config $${CONFIG})
message ($${TARGET} DEFINE $${DEFINES})
message ($${TARGET} prelink $${QMAKE_PRE_LINK})
message ($${TARGET} postlink $${QMAKE_POST_LINK})

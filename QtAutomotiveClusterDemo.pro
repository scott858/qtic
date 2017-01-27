# Project Options
TEMPLATE = app
TARGET = QtAutomotiveClusterDemo

DESTPATH = /data/user/$$TARGET
target.path = $$DESTPATH

INCLUDEPATH += ./GeneratedFiles \
    .build \
    . \
    ./GeneratedFiles/Release
PRECOMPILED_HEADER = StdAfx.h

DEPENDPATH += .
MOC_DIR = .build
OBJECTS_DIR = .build
RCC_DIR = .build
UI_DIR = .build
QT = core \
    gui \
    svg \
    network \
    xml \
    sql \
    qml \
    quick

# use OpenGL where available
contains(QT_CONFIG, opengl)|contains(QT_CONFIG, opengles1)|contains(QT_CONFIG, opengles2) {
    QT += opengl
}

# disable the Wordcloud appliance (for 0.9 release)
DEFINES += NO_WORDCLOUD_APPLIANCE

# Fotowall input files
include(QtAutomotiveClusterDemo.pri)

# Installation path
#target.path = /usr/bin

OTHER_FILES += \
    QtAutomotiveClusterDemoDesign/RpmDial.qml \
    QtAutomotiveClusterDemoDesign/SpeedDial.qml \
    QtAutomotiveClusterDemoDesign/FuelMeter.qml \
    QtAutomotiveClusterDemoDesign/qml.qml

#OTHER_FOLDER += QtAutomotiveClusterDemoDesign

#QMAKE_POST_LINK += $$quote(cp -r $${PWD}/$${OTHER_FOLDER} $${OUT_PWD})

#for(FILE, OTHER_FILES){
# QMAKE_POST_LINK += $$quote(cp $${PWD}/$${FILE} $${OUT_PWD})
#}


# deployment on Linux
qml.path = $$DESTPATH/QtAutomotiveClusterDemoDesign
qml.files = QtAutomotiveClusterDemoDesign/*
qml.files =

DISTFILES += \
    QtAutomotiveClusterDemoDesign/qml_800x480.qml \
    QtAutomotiveClusterDemoDesign/RpmDial.qml \
    QtAutomotiveClusterDemoDesign/SpeedDial.qml \
    QtAutomotiveClusterDemoDesign/FuelMeter.qml \
    QtAutomotiveClusterDemoDesign/qml.qml

content.files = \
    QtAutomotiveClusterDemoDesign
content.path = $$DESTPATH

defineTest(b2qtdemo_deploy_defaults) {
    commonFiles.files =
    commonFiles.path = $$DESTPATH
    OTHER_FILES += $${commonFiles.files}
    INSTALLS += commonFiles
    export(commonFiles.files)
    export(commonFiles.path)
    export(OTHER_FILES)
    export(INSTALLS)
}

b2qtdemo_deploy_defaults()


OTHER_FILES += $${content.files}

INSTALLS += target \
            qml \
            content

#content.files = \
#    qml \
#    fonts \
#    images
#content.path = $$DESTPATH

#OTHER_FILES += $${content.files}

#INSTALLS += target content

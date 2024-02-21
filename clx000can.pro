TARGET = clx000canbus

QT = core serialbus serialport

HEADERS += \
    CLX000CanBus.h \
    CLX000CanBusUSB.h \
    CLX000Plugin.h \
    CRC16.h

SOURCES += CLX000CanBus.cpp \
    CLX000CanBusUSB.cpp \
    CLX000Plugin.cpp \
    CRC16.cpp \

DISTFILES = plugin.json

PLUGIN_TYPE = canbus
PLUGIN_CLASS_NAME = CLX000CanBusPlugin
load(qt_plugin)

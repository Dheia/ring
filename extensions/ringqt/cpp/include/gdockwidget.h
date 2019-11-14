
/* Copyright (c) 2013-2018 Mahmoud Fayed <msfclipper@yahoo.com> */
#ifndef GDOCKWIDGET_H
#define GDOCKWIDGET_H
#include <QApplication>
#include <QDockWidget>
extern "C" {
#include "ring.h"
}

class GDockWidget : public QDockWidget
{

  Q_OBJECT

  public:

    VM *pVM;

    List *pParaList;

    char callowedAreasChangedEvent[200];
    char cdockLocationChangedEvent[200];
    char cfeaturesChangedEvent[200];
    char ctopLevelChangedEvent[200];
    char cvisibilityChangedEvent[200];


    GDockWidget(QWidget *x,Qt::WindowFlags parent,VM *pVM );

    ~GDockWidget();

    void geteventparameters(void) ;

    void setallowedAreasChangedEvent(const char *cStr);
    void setdockLocationChangedEvent(const char *cStr);
    void setfeaturesChangedEvent(const char *cStr);
    void settopLevelChangedEvent(const char *cStr);
    void setvisibilityChangedEvent(const char *cStr);


    const char *getallowedAreasChangedEvent(void);
    const char *getdockLocationChangedEvent(void);
    const char *getfeaturesChangedEvent(void);
    const char *gettopLevelChangedEvent(void);
    const char *getvisibilityChangedEvent(void);


  public slots:

    void allowedAreasChangedSlot();
    void dockLocationChangedSlot();
    void featuresChangedSlot();
    void topLevelChangedSlot();
    void visibilityChangedSlot();

};

#endif


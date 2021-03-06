#ifndef QQTCLICKLABEL_H
#define QQTCLICKLABEL_H

#include <qqtvirtualclicklabel.h>
#include <qqtclickhelper.h>

#include <qqt-local.h>
#include <qqtcore.h>

/**
 * 这个是个basic类 提供click信号
 * 提供安装ClickHelper的能力
 * 提供MouseEvent响应
 *
 * 用户使用方法
 * new ClickHelper
 * installClickHelper
 */
class QQTSHARED_EXPORT QQtClickLabel : public QQtVirtualClickLabel
{
    Q_OBJECT
public:
    explicit QQtClickLabel ( QWidget* parent = 0 ) :
        QQtVirtualClickLabel ( parent ) {
        mClickHelper = new QQtClickHelper ( this );
        mDefaultClickHelper = mClickHelper;
        installClickHelper ( mClickHelper );
    }
    virtual ~QQtClickLabel() {}

    /**
     * 提供给App用信号
     * 界面层内部直接处理
     */
signals:
    void click();

signals:
    void clickWithPoint ( QPoint point );

    /**
     * 子类重写这两个函数,实现丰富的click能力
     */
    // QQtWidget interface
protected:
    virtual void connectClickHelper() {
        if ( !mClickHelper )
            return;

        connect ( mClickHelper, SIGNAL ( click() ), this, SIGNAL ( click() ) );
        connect ( mClickHelper, SIGNAL ( clickWithPoint ( QPoint ) ), this, SIGNAL ( clickWithPoint ( QPoint ) ) );
    }

    virtual void unConnectClickHelper() {
        if ( !mClickHelper )
            return;

        disconnect ( mClickHelper, SIGNAL ( click() ), this, SIGNAL ( click() ) );
        disconnect ( mClickHelper, SIGNAL ( clickWithPoint ( QPoint ) ), this, SIGNAL ( clickWithPoint ( QPoint ) ) );
    }

};

#endif // QQTCLICKLABEL_H

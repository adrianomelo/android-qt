/****************************************************************************
**
** Copyright (C) 2009 Nokia Corporation and/or its subsidiary(-ies).
** Contact: Qt Software Information (qt-info@nokia.com)
**
** This file is part of the QtNetwork module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** No Commercial Usage
** This file contains pre-release code and may not be distributed.
** You may use this file in accordance with the terms and conditions
** contained in the either Technology Preview License Agreement or the
** Beta Release License Agreement.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain
** additional rights. These rights are described in the Nokia Qt LGPL
** Exception version 1.0, included in the file LGPL_EXCEPTION.txt in this
** package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
** If you are unsure which license is appropriate for your use, please
** contact the sales department at qt-sales@nokia.com.
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QHTTPNETWORKREQUEST_H
#define QHTTPNETWORKREQUEST_H

//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists for the convenience
// of the Network Access API.  This header file may change from
// version to version without notice, or even be removed.
//
// We mean it.
//
#ifndef QT_NO_HTTP

#include <private/qhttpnetworkheader_p.h>

QT_BEGIN_NAMESPACE

class QHttpNetworkRequestPrivate;
class Q_AUTOTEST_EXPORT QHttpNetworkRequest: public QHttpNetworkHeader
{
public:
    enum Operation {
        Options,
        Get,
        Head,
        Post,
        Put,
        Delete,
        Trace,
        Connect
    };

    enum Priority {
        HighPriority,
        NormalPriority,
        LowPriority
    };

    QHttpNetworkRequest(const QUrl &url = QUrl(), Operation operation = Get, Priority priority = NormalPriority);
    QHttpNetworkRequest(const QHttpNetworkRequest &other);
    virtual ~QHttpNetworkRequest();
    QHttpNetworkRequest &operator=(const QHttpNetworkRequest &other);
    bool operator==(const QHttpNetworkRequest &other) const;

    QUrl url() const;
    void setUrl(const QUrl &url);

    int majorVersion() const;
    int minorVersion() const;

    qint64 contentLength() const;
    void setContentLength(qint64 length);

    QList<QPair<QByteArray, QByteArray> > header() const;
    QByteArray headerField(const QByteArray &name, const QByteArray &defaultValue = QByteArray()) const;
    void setHeaderField(const QByteArray &name, const QByteArray &data);

    Operation operation() const;
    void setOperation(Operation operation);

    Priority priority() const;
    void setPriority(Priority priority);

    QIODevice *data() const;
    void setData(QIODevice *data);

private:
    QSharedDataPointer<QHttpNetworkRequestPrivate> d;
    friend class QHttpNetworkRequestPrivate;
    friend class QHttpNetworkConnectionPrivate;
};


class QHttpNetworkRequestPrivate : public QHttpNetworkHeaderPrivate
{
public:
    QHttpNetworkRequestPrivate(QHttpNetworkRequest::Operation op,
        QHttpNetworkRequest::Priority pri, const QUrl &newUrl = QUrl());
    QHttpNetworkRequestPrivate(const QHttpNetworkRequestPrivate &other);
    ~QHttpNetworkRequestPrivate();
    bool operator==(const QHttpNetworkRequestPrivate &other) const;
    QByteArray methodName() const;
    QByteArray uri(bool throughProxy) const;

    static QByteArray header(const QHttpNetworkRequest &request, bool throughProxy);

    QHttpNetworkRequest::Operation operation;
    QHttpNetworkRequest::Priority priority;
    mutable QIODevice *data;
    bool autoDecompress;
};


QT_END_NAMESPACE

//Q_DECLARE_METATYPE(QHttpNetworkRequest)

#endif // QT_NO_HTTP


#endif // QHTTPNETWORKREQUEST_H
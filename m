Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C526483F
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Feb 2002 08:43:43 -0700 (MST)
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
To: Matthias Klose <doko@cs.tu-berlin.de>
Cc: carlos@baldric.uwo.ca,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	"jso" <jso@europay.com>(=?iso-8859-1?Q?Jo=EBl_Soete?=),
	parisc-linux@lists.parisc-linux.org
Message-ID: <OF1AF63CA2.4A22BA83-ONC1256B65.0056BC8B@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Tue, 19 Feb 2002 16:49:40 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hey Matthias,

Just a stupid question: "/usr/lib/gcc-snapshot/" is there where you put
your sources gcc-snapshot sources?

Thanks for help,
     Joel



                                                                           =
                                       =20
                    Matthias                                               =
                                       =20
                    Klose                To:     "John David Anglin" <dave@=
hiauly1.hia.nrc.ca>                    =20
                    <doko@cs.tu-b        cc:     jso@europay.com (Jo=EBl So=
ete), carlos@baldric.uwo.ca,             =20
                    erlin.de>            parisc-linux@lists.parisc-linux.or=
g                                      =20
                                         Subject:     Re: [parisc-linux] Re=
: hppa-linux gcc-3.0.3:                =20
                    18-02-02                                               =
                                       =20
                    10:47 PM                                               =
                                       =20
                                                                           =
                                       =20
                                                                           =
                                       =20




John David Anglin writes:
> > Thanks for advise but I speek well about the new (annonced on
> > http://www.gnu.org/software/gcc/gcc.html: ...The next major release,
GCC
> > 3.1,...) gcc release 3.1.
>
> I am building 3.1 experimental regularly from the main gcc cvs source.
> I have built glibc with it.  You probably should get the cvs binutils
> because it contains a long branch related fix which will cause a seg
> fault early in the bootstrap.  You can avoid it by using "-O2" in
> stage1.  I have a couple of small fixes that need to go in regarding
> linking with milli and pthreads routines.  The gcc testsuite (expect)
> seems to trigger a parisc-linux bug which fills /var with page fault
> error mesages.

I just uploaded the gcc-snapshot_20020216 build to incoming (without
any extra patches).

To use this snapshot, you should set the following environment
variables:

        LD_LIBRARY_PATH=3D/usr/lib/gcc-snapshot/lib:$LD_LIBRARY_PATH
        PATH=3D/usr/lib/gcc-snapshot/bin:$PATH

Unset these variables before building Debian packages destined for an
upload to ftp-master.debian.org.

The snapshot packages doesn't build automatically. I had to restart
the build due to bash problems (the same you saw as well).

           Matthias






**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

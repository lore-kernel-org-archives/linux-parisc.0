Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id B54394838
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 00:39:47 -0700 (MST)
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, willy@debian.org
Message-ID: <OF7728C2FF.967E7C94-ONC1256B64.002A52DE@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Mon, 18 Feb 2002 08:45:38 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: kernel-2.4.17-pa22 boot problem B132L+ with serial
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

Hey all,

Regarding root login problem on serial link, I could not reproduce on my
B180.
May be a new apt-get diste-upgrade would help?

Joel

Notes;
Debian GNU/Linux 3.0 palinux ttyS0

palinux login: root
Password:
Last login: Fri Feb 15 10:35:16 2002 from wsjso:0.0 on pts/2
Linux palinux 2.4.17-pa23-lkcd-evms-0.9.0 #4 Thu Feb 14 14:19:07 CET 2002
parisc unknown
palinux:~# dpkg -l libc6
Desired=3DUnknown/Install/Remove/Purge/Hold
| Status=3DNot/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=3D(none)/Hold/Reinst-required/X=3Dboth-problems (Status,Err:
uppercase=3Dbad)
||/ Name           Version        Description
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ii  libc6          2.2.5-3        GNU C Library: Shared libraries and
Timezone
palinux:~#

And also with k pa26

Debian GNU/Linux 3.0 palinux ttyS0

palinux login: root
Password:
Last login: Mon Feb 18 08:30:39 2002 on ttyS0
Linux palinux 2.4.17-pa26 #2 Fri Feb 15 14:55:59 CET 2002 parisc unknown
palinux:~# ll /var/lib/dpkg/status
-rw-r--r--    1 root     root       273512 Feb 14 12:31
/var/lib/dpkg/status
palinux:~# date
Mon Feb 18 08:45:02 CET 2002
palinux:~#



                                                                           =
                                               =20
                    Grant Grundler                                         =
                                               =20
                    <grundler@dsl2.extern        To:     "Jo=EBl Soete" <js=
o@europay.com>                                   =20
                    al.hp.com>                   cc:     parisc-linux@lists=
.parisc-linux.org                              =20
                                                 Subject:     Re: kernel-2.=
4.17-pa22 boot problem B132L+ with serial      =20
                    15-02-02 07:55 AM                                      =
                                               =20
                                                                           =
                                               =20
                                                                           =
                                               =20




"=3D?iso-8859-1?Q?Jo=3DEBl_Soete?=3D" wrote:
> It was "built-in 21143 on B180L" (is there a difference here between b180
> and b132?)

Yes. I don't think B132L had 100BT built-in.
But I'm too lazy to check hwdb.parisc-linux.org right now.
Bed time.

grant






**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DAA04847
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 09:47:49 -0700 (MST)
To: Matthias Klose <doko@cs.tu-berlin.de>, carlos@baldric.uwo.ca,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <OF57EB6BBE.3537F19D-ONC1256B66.005252D2@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Wed, 20 Feb 2002 17:53:32 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] gcc-3.1 && k-2.4.17-pa27 50/50(was Re: hppa-linux gcc-3.0.3:)
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

Hi all,

Test  summary: I follow the recipe to build a kernel with binutils snapshot
20020218; gcc snapshot 20020218; glibc debian sources and last cvs kernel
2.4.17-pa27 and palo .

I do not notice compile error :-)) (Hmm only note in dmesg  some
do_page_fault() pid=3D... command=3D'conftest' ... during glibc rebuild, I =
am
not sure; I do not find any trace in my logs? ).

Also I install this kernel and reboot the server with it.

Well it boot well and seems to run well in mutli-user mode with minimun
daemon running.

Just inetd seems to make the system panic after a simple telnet:
...
Kernel fault: Code=3D15 regs=3D...
...

David is it the problem of bootstrap you spoke about binutils?

Matthias very sorry but I do not yet find your new package(s) (neither on
ftp://ftp.debian.org/debian/pool/main/g/gcc* neither on ftp.de.debian.org).
Must I be more patient? (I do not know anything about debian life cycle pkg
:( )
Hmm I do not find more where you upload your snapshot 20020216?

Thanks a lot to all for all info,
     Joel




                                                                           =
                                       =20
                    Matthias                                               =
                                       =20
                    Klose                To:     "Jo=EBl Soete" <jso@europa=
y.com>                                   =20
                    <doko@cs.tu-b        cc:     parisc-linux@lists.parisc-=
linux.org                              =20
                    erlin.de>            Subject:     Re: [parisc-linux] Re=
: hppa-linux gcc-3.0.3:                =20
                                                                           =
                                       =20
                    19-02-02                                               =
                                       =20
                    10:57 PM                                               =
                                       =20
                                                                           =
                                       =20
                                                                           =
                                       =20




Jo=EBl Soete writes:
>
> David,
>
> It seems Ok: just finished the first step of compiling gcc (snapshot
dated
> 020218 from sources.redhat.com because I do not find where Matthias
> uploaded its snapshot :( ) with echo $? -> after make :-).

It's now in the unstable/sid distribution.







**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90FC94855
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 10:47:52 -0700 (MST)
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca,
	"jso" <jso@europay.com>(=?iso-8859-1?Q?Jo=EBl_Soete?=),
	parisc-linux@lists.parisc-linux.org
Message-ID: <OFB6528EDF.C6603F22-ONC1256B64.00615768@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Mon, 18 Feb 2002 18:53:49 +0100
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

David,

Ok I just launch the download of binutils snapshot dated of today.
I will then follow the 'recipe'.

Than again for all,
     Joel

PS: I would try natively (on my palinux box directly) with MACH=3Dhppa-linux
i.e.: ~/source/binutils/configure --host=3Dhppa-linux ... ?



                                                                           =
                                         =20
                    "John David                                            =
                                         =20
                    Anglin"                To:     jso@europay.com (Jo=EBl =
Soete)                                     =20
                    <dave@hiauly1.h        cc:     carlos@baldric.uwo.ca, p=
arisc-linux@lists.parisc-linux.org       =20
                    ia.nrc.ca>             Subject:     Re: [parisc-linux] =
Re: hppa-linux gcc-3.0.3:                =20
                                                                           =
                                         =20
                    18-02-02 05:41                                         =
                                         =20
                    PM                                                     =
                                         =20
                                                                           =
                                         =20
                                                                           =
                                         =20




> Thanks for advise but I speek well about the new (annonced on
> http://www.gnu.org/software/gcc/gcc.html: ...The next major release, GCC
> 3.1,...) gcc release 3.1.

I am building 3.1 experimental regularly from the main gcc cvs source.
I have built glibc with it.  You probably should get the cvs binutils
because it contains a long branch related fix which will cause a seg
fault early in the bootstrap.  You can avoid it by using "-O2" in
stage1.  I have a couple of small fixes that need to go in regarding
linking with milli and pthreads routines.  The gcc testsuite (expect)
seems to trigger a parisc-linux bug which fills /var with page fault
error mesages.

I am currently trying to get dw2 unwinding working.

Dave
--
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX:
952-6605)






**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id BD14E484E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 07:48:14 -0700 (MST)
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Cc: dave@hiauly1.hia.nrc.ca, parisc-linux@lists.parisc-linux.org
Message-ID: <OF99BC0404.6646AF92-ONC1256B64.0050D0F6@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Mon, 18 Feb 2002 15:54:11 +0100
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

Carlos,

Thanks for advise but I speek well about the new (annonced on
http://www.gnu.org/software/gcc/gcc.html: ...The next major release, GCC
3.1,...) gcc release 3.1.

Thanks any way for attention,
     Joel



                                                                           =
                                       =20
                    "Carlos                                                =
                                       =20
                    O'Donell Jr."        To:     Jo=EBl Soete <jso@europay.=
com>                                     =20
                    <carlos@baldr        cc:     dave@hiauly1.hia.nrc.ca, p=
arisc-linux@lists.parisc-linux.org     =20
                    ic.uwo.ca>           Subject:     Re: [parisc-linux] Re=
: hppa-linux gcc-3.0.3:                =20
                                                                           =
                                       =20
                    18-02-02                                               =
                                       =20
                    03:29 PM                                               =
                                       =20
                                                                           =
                                       =20
                                                                           =
                                       =20




> Hi Dave,
>
> Can you explain me how to get those sources.
> 'http://www.parisc-linux.org/toolchain/index.html', I would also need
> corresponding binutils and glibc sources?
> Which release do I have do use to rebuild gcc-3.1 and how to get their
src
> (if requested)?

J,

[Re: Numbers]

I think you might mean rebuilding gcc-3.0.1?

[Re: How to build]

You can take a look at:
http://www.parisc-linux.org/toolchain/PARISC-Linux-XC-HOWTO.html

Which has the detail for building binutils, gcc, glibc as a XC,
but in general it's pretty much the same for most situations.


[Re: Locations]

binutils, glibc, gcc:

ftp://ftp.debian.org/debian/pool/main/b/binutils/
ftp://ftp.debian.org/debian/pool/main/g/glibc/

ftp://ftp.debian.org/debian/pool/main/g/gcc-3.0/ (New)
ftp://ftp.debian.org/debian/pool/main/g/gcc-snapshot/ (VERY New)

You can change ftp.debian.org to match the closest mirror.

Get the latest source for everything and start compiling!

/me smiles

c.








**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA16808
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Jan 2001 08:05:39 -0700
Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD87AC@EPIXCH003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
To: "'pjlahaie@linuxcare.com'" <pjlahaie@linuxcare.com>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] Beta CD 
Date: Wed, 10 Jan 2001 16:07:36 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hello Paul,

I use your CD image (palinux-0.5.iso) first as a base to trying to use PDC
console on a C110 model.

As it finally does not work yet, I install your CD as it is with supplied
Debian packages.

"debhelper" complaint at configure phase because of "file" package
dependencies.

Ok, I download sources of last release from Debian server and try to rebuild
this package.

It fails and in the log of configure: /usr/bin/ld: cannot open crt1.o: no
such a file or directory.

It remembers me an old problem
(http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/08-Aug/0202.h
tml).
(I not sure that it exists a link between problems but the coincidence is
strange) [I do not actually try to find the solution because it was largely
recommended to work with a i386 linux and I had this opportunity some time
after]

I suspect that you already met the problem and may be have you the solution
or a good work around.

Do I have to used another release of gcc (under 
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace I found other gcc
and binutils binaries. But is it for palinux?)?

Another way should be to use the cross-compiler on a i386 linux box (as it
seems enough stable). But if I well found the way to build native .deb
packages (http://www.debian.org/doc/packaging-manuals/packaging.html/), I do
not find here the way for "cross-pacakging"?

Thanks in advance for help,
	Joel


**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA17980
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Jan 2001 10:58:15 -0700
Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD87AF@EPIXCH003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
To: "'pjlahaie@linuxcare.com'" <pjlahaie@linuxcare.com>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: RE: RE: [parisc-linux] Beta CD 
Date: Wed, 10 Jan 2001 19:00:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Oops I just figure out that crt1.o is supply by glibc which is well in the
install/debian-hppa but not in deb package format but as a tarball. May I
install it like this or does it exists already somewhere the package
(easiest for maintenance. no?)

Thanks a lot,
	Joel

> -----Original Message-----
> From:	SOETE Joël 
> Sent:	Wednesday, January 10, 2001 4:08 PM
> To:	'pjlahaie@linuxcare.com'
> Cc:	'parisc-linux@thepuffingroup.com'
> Subject:	RE: [parisc-linux] Beta CD 
> 
> Hello Paul,
> 
> I use your CD image (palinux-0.5.iso) first as a base to 
> trying to use PDC console on a C110 model.
> 
> As it finally does not work yet, I install your CD as it is 
> with supplied Debian packages.
> 
> "debhelper" complaint at configure phase because of "file" 
> package dependencies.
> 
> Ok, I download sources of last release from Debian server and 
> try to rebuild this package.
> 
> It fails and in the log of configure: /usr/bin/ld: cannot 
> open crt1.o: no such a file or directory.
> 
> It remembers me an old problem 
> (http://puffin.external.hp.com/mailing-lists/parisc-linux/2000
> /08-Aug/0202.html).
> (I not sure that it exists a link between problems but the 
> coincidence is strange) [I do not actually try to find the 
> solution because it was largely recommended to work with a 
> i386 linux and I had this opportunity some time after]
> 
> I suspect that you already met the problem and may be have 
> you the solution or a good work around.
> 
> Do I have to used another release of gcc (under 
> ftp://puffin.external.hp.com/pub/parisc/binaries/userspace I 
> found other gcc and binutils binaries. But is it for palinux?)?
> 
> Another way should be to use the cross-compiler on a i386 
> linux box (as it seems enough stable). But if I well found 
> the way to build native .deb packages 
> (http://www.debian.org/doc/packaging-manuals/packaging.html/),
>  I do not find here the way for "cross-pacakging"?
> 
> Thanks in advance for help,
> 	Joel


**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

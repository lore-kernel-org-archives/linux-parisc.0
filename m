Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA29878
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Feb 2000 18:07:55 -0700
Received: from xboibrg1.boi.hp.com (xboibrg1.boi.hp.com [15.56.8.167])
	by atlrel1.hp.com (Postfix) with ESMTP id 3FBE61591
	for <parisc-linux@thepuffingroup.com>; Mon, 28 Feb 2000 19:08:52 -0500 (EST)
Message-ID: <56D553C0B61BD311AD2300A0C9F485C2038D0FD4@xfc02.fc.hp.com>
From: "MEYER,ALAN C. \(HP-FtCollins,ex1\)" <alan_meyer@hp.com>
To: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] HP-UX application support?
Date: Mon, 28 Feb 2000 17:08:50 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>


> > Can someone plz clarify what will be supported:
> > * 64-bit/ELF HP-UX applications
> > * 32-bit/SOM HP-UX applications
> 
> We intend to support both of the above; in addition we also intend to
> support 32 bit ELF Linux applications and, eventually, 64 bit 
> ELF Linux applications.  In case anyone didn't realise it, the
> current executables we use are 32-bit SOM HP-UX applications.
> Admittedly, the current sash we have implements `-mount' by
> calling a linux syscall, but that's only one command.

Yeah, I have loosely followed the interesting path taken with the toolchain
to get, eventually, to 64-bit ELF Linux apps.  But, there could be a
difference between what had to be done during development vs. wanting to
support it.  From HP's view, of course, supporting 32-bit SOM HP-UX apps is
great.

On a related note, is there any intention to support development of HP-UX
applications on PA/Linux?  Sure, a gcc cross-compiler could be created for
this.  But, my assumption is that PA/Linux would be a deployment environment
for HP-UX, but NOT a development environment.

> > And, what about the install location of HP-UX shlibs 
> > required for these 64-bit (and 32-bit?) HP-UX applications?
> 
> If we use a dynamically linked application, they would need 
> to be placed in the same location that HP/UX requires them to be.

Yes.  But, it gets stranger than that.  This topic has received lots of
airtime for IA-64 Linux, where x86 Linux apps will be supported.  The
existance of the IA-64 ABI "mandates" some of the rules for that platform,
but there are still some points that could apply here.

Actually, most of the HP-UX application issues should be OK because ... name
and version conflicts for shlibs are not so likely given the different
naming conventions for HP-UX (.sl) and Linux (.so).  This gets rid of many
of the issues IA-64 is dealing with - although /lib and /usr/lib may get
heavily populated.

BTW, you could imagine someone wanting to run both 32- and 64-bit HP-UX
apps.  The convention used by HP-UX shlibs seems to be:

	/usr/lib/libm.sl
	/usr/lib/pa20_64/libm.sl

But, the real problems will arise when supporting both 32- and 64-bit Linux
apps on PA.  I assume you meant that both 32- and 64-bit Linux apps would be
supported on 64-bit PA/Linux.  If not, never mind!  If so, this creates some
fun issues, such as:

* There will be naming conflicts between the 32- and 64-bit shlibs (and for
config files, man pages, etc.).  The RPMs for both the 32- and 64-bit
package will want to install in the same locations.

How to address?  Could create subdirs, such as /lib/32bit/... for the 32-bit
libs.  By mucking with rpm and the Linux loader, this could be addressed OK.
But, still a problem for config files and such.

Have I missed the mark, or aren't there some lurking issues here?

Alan

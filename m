Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA27702
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Feb 2000 16:03:59 -0700
From: willy@thepuffingroup.com
Date: Mon, 28 Feb 2000 17:04:46 -0500
To: "MEYER,ALAN C. HP-FtCollins,ex1\"" <alan_meyer@hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP-UX application support?
Message-ID: <20000228170446.Z9944@thepuffingroup.com>
References: <56D553C0B61BD311AD2300A0C9F485C2038D0FD0@xfc02.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56D553C0B61BD311AD2300A0C9F485C2038D0FD0@xfc02.fc.hp.com>; from MEYER,ALAN C. HP-FtCollins,ex1" on Mon, Feb 28, 2000 at 02:14:17PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Feb 28, 2000 at 02:14:17PM -0700, MEYER,ALAN C. HP-FtCollins,ex1" wrote:
> I have heard several descriptions of what will be supported for HP-UX
> applications on 64-bit PA/Linux.
> 
> Can someone plz clarify what will be supported:
> * 64-bit/ELF HP-UX applications
> * 32-bit/SOM HP-UX applications

We intend to support both of the above; in addition we also intend to
support 32 bit ELF Linux applications and, eventually, 64 bit ELF Linux
applications.  In case anyone didn't realise it, the current executables
we use are 32-bit SOM HP-UX applications.  Admittedly, the current sash
we have implements `-mount' by calling a linux syscall, but that's only
one command.

Not every application will work, but the vast majority of them will.
Binary support for threaded applications is most unlikely.

> And, what about the install location of HP-UX shlibs required for these
> 64-bit (and 32-bit?) HP-UX applications?

If we use a dynamically linked application, they would need to be placed
in the same location that HP/UX requires them to be.

> Also, I am assuming the install model will be to simply copy files from an
> HP-UX system over to a PA/Linux system.  In particular, I have heard of no
> plans to support HP-UX packages bundled in "SD" format.  Right?

Hmmm.. this is really a userspace problem that we haven't thought
about yet.  I anticipate that the `swinstall' program will work without
much pain and therefore installing .depot files will work.  However,
it wouldn't be the recommended way; packaging products as rpm or dpkg
(depending which distribution we pick) would be the preferred way to go.
There is a program called `alien' which can install other package formats,
extending that to support .depot files might be a fun thing to do for
someone with too much time on their hands :-)

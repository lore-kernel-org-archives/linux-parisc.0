Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA15674
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Apr 1999 23:46:40 -0600
Date: Tue, 4 May 1999 23:30:21 -0700 (PDT)
From: Kumar <kumar@ix.netcom.com>
To: Alex deVries <adevries@redhat.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] linker errors
In-Reply-To: <Pine.LNX.3.96.990505012802.22012I-100000@devserv.devel.redhat.com>
Message-ID: <Pine.LNX.3.96.990504232216.456A-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



Yes, I am using prebuilt binaries downloaded from puffin.external.hp.com.


-pkd

-rw-r--r--   1 500      233       1923587 May  1  1999
binutils-x-parisc-linux-2.9.1-11.tar.gz
-rw-r--r--   1 500      233       1706806 May  1  1999
egcs-x-parisc-linux-1.1.1-9.tar.gz
ftp> pwd
257 "/pub/parisc/binaries/tgz" is current directory.



On Wed, 5 May 1999, Alex deVries wrote:

> 
> On Tue, 4 May 1999, Kumar wrote:
> > I am getting following errors even from the latest binutils and
> > parisc-linux-gcc. Are there any special LDFLAGS that one needs to use ?
> > 						-pkd
> > 
> > parisc-linux-ld -L. -R 0x100000 -N -S rom_interface.o setup.o utils.o
> > strutils.o bcopy.o main.o io.o -l milli -o vmlinux
> > parisc-linux-ld: can not size stub section: Bad value
> > rom_interface.o: In function `cout_putc':
> > rom_interface.o($CODE$+0xe4): undefined reference to `$$dyncall'
> > rom_interface.o: In function `bootdev_sread':
> > rom_interface.o($CODE$+0xe0): undefined reference to `$$dyncall'
> > rom_interface.o: In function `pdc_call':
> > rom_interface.o($CODE$+0x118): undefined reference to `$$dyncall'
> > main.o: In function `parisc_init':
> > main.o($CODE$+0x208): undefined reference to `$$divU'
> > make: *** [vmlinux] Error 1
> > 
> 
> Hm.  I don't get this at all... it certainly links for me.  I do get a lot
> of errors with the linker itself, but nothing fatal.
> 
> Are you using the pre-built cross compilers? If so, which ones?
> 
> - Alex
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
> 

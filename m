Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA00911
	for <parisc-linux@puffin.external.hp.com>; Fri, 24 Sep 1999 03:59:49 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com, LaMont Jones <lamont@security.hp.com>,
        Grant Grundler <grundler@cup.hp.com>
Subject: Re: [parisc-linux] Missing directories from CVS
Date: Fri, 24 Sep 1999 10:13:13 +0200
Content-Type: text/plain
References: <19990923185853.4632E18708@security.hp.com>
MIME-Version: 1.0
Message-Id: <99092410263805.00271@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Thu, 23 Sep 1999 schrieb LaMont Jones:
> > And on this one "cc" gets picky about pointer math.
> > Here's my diff for mkImage.c:
> 
> > <     *entry_point = *(unsigned long*)(ptr + 6*sizeof(long));
> > ---
> > >     *entry_point = *(unsigned long*)((char *)ptr + 6*sizeof(long));
> OK, so I'm too lazy to go look...  what type is ptr?  I'd guess that
> it's declared void*, since that's the only way the pointer math could
> work in gcc and not in HP-cc.

Yes.

> 
> > Any objections to committing this change?
> > On second thought, both changes should be written as:
> > 	*entry_point = ((unsigned long *)ptr)[6];
> > and	
> > 	short magic = ((short *)ptr)[1];
> How about just using filehdr.h, or copying struct header from it, and
> using the real structure...?  (I think we've released the format enough
> that we could clone the structure, failing that:
> 
>   struct header {
> 	unsigned short magic;
> 	short fill0;
> 	long fill[5];
> 	unsigned long entry_point;
>   };
> will fit the bill quite nicely.

Yes, I think this would be the best solution. When I wrote the program, I tried
to include the header-files som.h and elf.h, but then I always got
different errors from every of the arch-compilers (iA32 or hpux).  So maybe it
is best to use the structure as above and write the structure-layout directly
into the source.  
Does someone want to fill it in and commit it ?

> 
> LaMont "I hate magic offsets" Jones
Helge "master of bad pointer arithmetic" Deller :-)

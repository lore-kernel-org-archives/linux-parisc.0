Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA25752
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 16:00:13 -0600
To: Brian Poole <raj@cerias.purdue.edu>
Cc: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Troubles following the 'recipe'
References: <Pine.SOL.4.10.10010141453400.22986-100000@basm.cerias.purdue.edu>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 14 Oct 2000 18:00:56 -0400
In-Reply-To: Brian Poole's message of "Sat, 14 Oct 2000 15:10:26 -0500 (EST)"
Message-ID: <87pul36q1z.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Brian Poole <raj@cerias.purdue.edu> writes:

> And I configured it as per the recipe with..
> 
> ../gcc/configure --target=hppa1.1-linux --prefix=$DEST --host=$MACH
> --disable-nls --without-libc

--without-libc does nothing.  You also need --enable-languages=c, or
else it will try to build ObjC, C++, Java, etc., all of which require
you to have a built libc.

Another thing - though 'hppa1.1-linux' works, you should use
'hppa-linux' as the target instead.

You should configure gcc with:

../gcc/configure --target=hppa-linux --prefix=$DEST --enable-languages=c

If you want a cross-compiler for C++, you must build a cross-glibc
(using --prefix=$DEST/hppa-linux - important!) and then rebuild with
--enable-languages=c,c++.

I thought the recipe had been updated (I *clearly* remember helping
write a functional one a while ago).  Are you sure this is a recent
version of it?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

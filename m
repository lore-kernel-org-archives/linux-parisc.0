Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F473482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Apr 2001 13:34:08 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14mKju-0002sg-00; Sun, 08 Apr 2001 20:20:46 +0100
Date: Sun, 8 Apr 2001 20:20:46 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>, randolph@tausq.org,
	lamont@hp.com, debian-buildd@list.parisc-linux.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rpc.lockd hangs  (was Re: portmap deb)
Message-ID: <20010408202046.B19712@parcelfarce.linux.theplanet.co.uk>
References: <20010406210401.7685C37CDB@carmen.fc.hp.com> <20010407001500.Z9198@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010407001500.Z9198@linuxcare.com>; from rhirst@linuxcare.com on Sat, Apr 07, 2001 at 12:15:00AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 07, 2001 at 12:15:00AM +0100, Richard Hirst wrote:
> Options (somone who knows the area better than me can correct
> these):
> 
> a) Implement syscall() in glibc - I made an initial stab at that,
> included below, but I didn't get as far as building it.  Not sure
> if my approach was valid for hppa, with some args on stack, etc.
> 
> b) change nfs-common to use the proper glibc wrappers for these
> functions, rather than syscall().
> 
> c) change nfs-common to use INLINE_SYSCALL or something..

Actually I prefer (d) [hands up everyone who's surprised?  :-)]  I
don't see why we should implement syscall in assembler.  After all, that
would be the third implementation :-)  Why not have something along the
lines of:

int syscall(int nr, int arg1, int arg, int arg3, int arg4, int arg5, int arg6)
{
	return INLINE_SYSCALL(nr, arg1, arg2, arg3, arg4, arg5, arg6);
}

I don't have a copy of glibc to hand, so i'm not quite sure on the syntax
of INLINE_SYSCALL.

> I tried a quick hack at (b) and rebuilt.  I didn't get as far as trying
> the new binaries yet, because I was doing this on a 64 bit machine, and...
> both nfsservctl and quotactl are unimplemented on 64 bit :(

Ooops.  Clearly, that needs to get fixed.

-- 
Revolutions do not require corporate support.

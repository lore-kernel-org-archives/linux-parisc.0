Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7C8A482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 03:55:03 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9C685B007; Mon,  9 Apr 2001 10:56:06 +0100 (BST)
Date: Mon, 9 Apr 2001 10:56:06 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>, randolph@tausq.org,
	lamont@hp.com, debian-buildd@list.parisc-linux.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rpc.lockd hangs  (was Re: portmap deb)
Message-ID: <20010409105606.C5790@linuxcare.com>
References: <20010406210401.7685C37CDB@carmen.fc.hp.com> <20010407001500.Z9198@linuxcare.com> <20010408202046.B19712@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010408202046.B19712@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sun, Apr 08, 2001 at 08:20:46PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Apr 08, 2001 at 08:20:46PM +0100, Matthew Wilcox wrote:
> Actually I prefer (d) [hands up everyone who's surprised?  :-)]  I

Not me ;)

> don't see why we should implement syscall in assembler.  After all, that
> would be the third implementation :-)  Why not have something along the
> lines of:
> 
> int syscall(int nr, int arg1, int arg, int arg3, int arg4, int arg5, int arg6)
> {
> 	return INLINE_SYSCALL(nr, arg1, arg2, arg3, arg4, arg5, arg6);
> }
> 
> I don't have a copy of glibc to hand, so i'm not quite sure on the syntax
> of INLINE_SYSCALL.

This is nfs-utils code atm:


/* compatibility hack... */
#ifndef __NR_nfsctl
#define __NR_nfsctl     __NR_nfsservctl
#endif

int
nfsctl (int cmd, struct nfsctl_arg * argp, union nfsctl_res * resp)
{
  return syscall (__NR_nfsctl, cmd, argp, resp);
}


INLINE_SYSCALL wants a name, and an arg count, not a syscall number, eg:

  INLINE_SYSCALL(nfsservctl, 3, cmd, argp, resp);

so passing a syscall number in to syscall() doesn't work, and also
syscall() won't know how many arguments there are to pass on to
INLINE_SYSCALL.  Maybe we could just use '6' to get round that.

Maybe we duplicate INLINE_SYSCALL in sysdeps/unix/sysv/linux/hppa/sysdep.h,
call the new one INLINE_SYSCALL_NR, and replace 'SYS_ify(name)' with 'name'.
Then have

int syscall(int nr, int arg1, int arg, int arg3, int arg4, int arg5, int arg6)
{
      return INLINE_SYSCALL_NR(nr, arg1, arg2, arg3, arg4, arg5, arg6);
}

so long as there is no prototype of that visible to clash with use
in nfs-utils..

Richard

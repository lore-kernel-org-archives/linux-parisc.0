Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2E50482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Dec 2001 07:48:39 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 43BB9B00C; Wed, 19 Dec 2001 14:47:29 +0000 (GMT)
Date: Wed, 19 Dec 2001 14:47:29 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Joerg Hartmann <J.Hartmann@reinarts.de>
Cc: parisc-linux Mailinglist <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] can not get samba to work
Message-ID: <20011219144729.Y1897@linuxcare.com>
References: <881475869708.20011219132844@reinarts.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <881475869708.20011219132844@reinarts.de>; from J.Hartmann@reinarts.de on Wed, Dec 19, 2001 at 01:28:44PM +0100
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

On Wed, Dec 19, 2001 at 01:28:44PM +0100, Joerg Hartmann wrote:
> Hello parisc-linux users,
> 
> i can not get samba to work on my 720 with the 0.9.3 Debian.
> smbd dies immediatly with an error message in log.smbd:
> [2001/12/16 19:51:43, 0] lib/messages.c:message_init(97)
>   ERROR: Failed to initialise messages database

This looks like a glibc problem to me - I think it is calling fcntl
where it should be calling fcntl64, and using FSETLKW rather than
F_SETLKW64.

samba builds with

-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE

Using a test program, without those defines, i386 strace shows:

fcntl64(3, F_SETLKW, {type=F_WRLCK, whence=SEEK_SET, start=0, len=1}) = 0

with those defines:

fcntl64(3, F_SETLKW64, {type=F_WRLCK, whence=SEEK_SET, start=0, len=1}, 0xbffffa9c) = 0


Now on hppa, without those defines

fcntl(3, F_SETLKW, {type=F_WRLCK, whence=SEEK_SET, start=0, len=1}) = 0

and with them:

fcntl(3, F_SETLKW, {type=F_WRLCK, whence=SEEK_SET, start=31, len=0}) = 0


note that 'start' and 'len' are wrong in the last case; I think that's
because glibc used a 64 bit struct flock, but didn't specify F_SETLKW64
(and didn't call fcntl64).

Richard

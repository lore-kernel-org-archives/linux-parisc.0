Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA20411
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 17:11:48 -0700
Message-Id: <200101230017.QAA19389@milano.cup.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: tar hangs on 715/75 (spinlock problem) 
In-reply-to: Your message of "Mon, 22 Jan 2001 22:17:04 PST."
             <20010122221704.R3571@linuxcare.com>
Date: Mon, 22 Jan 2001 16:17:29 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> On Mon, Jan 22, 2001 at 09:32:19PM +0000, Richard Hirst wrote:
> > On Mon, Jan 22, 2001 at 04:50:14PM +0000, Richard Hirst wrote:
> > > Hi,
> > >   tar (and nscd) hang on my 715/75.  Same binaries/libraries work on
> > > the B180.  The hang is in __pthread_acquire() called from
> > 
> > This is because ldcw behaves differently on the 715/75 and the B180.
> 
> Grant tells me spinlock words have to be the first word of a cacheline,

16-byte aligned.

> so that would be why my example code broke.  However, libpthreads uses
> spinlocks and doesn't appear to force any alignment.

Yeah - this is definitely broken. taggart and jsm are going to play
with the alignments. jsm couldn't say for sure off-hand which processors
don't really care about the alignment. But we agreed it doesn't matter
since the architecture requires it and some of the processor models do
care.

> 
> I think the libpthreads spinlock definitions come from
> glibc/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h, struct
> pthread_mutex_t, spinlock is inside __m_lock.  No alignment is
> specified.  When debugging tar, I found the spinlock word at
> 0x4014df4c.

I spoke with Scott Norton (http://www.hp.com/hpbooks/authors/norton.html)
and he made it clear the POSIX spec defines pthread_mutex_t to be an
"opaque" type - ie it's arch specific.  _pthread_fastlock and
pthread_spinlock_t types must be aligned to correctly work under parisc
and Scott made it clear these are not POSIX data types.
Perhaps UNIX98 or some other standard.

What's baffled me is did this ever work under HPUX?

HP published a CD with a bunch of GNU/open source tools for HPUX 11.
The glibc version shipped was 1.2.6. Only has references to pthread_mutex_t
and none for "spinlock".

So HPUX only supports the pthread_mutex_t and not pthread_spinlock_t.
The HPUX kernel support for pthread_mutex_t seems to be __pthread_spinlock_t.
__pthread_spinlock_t contains an array where the init sequence figures
out where the 16byte alignment falls in the array and uses that offset.
I don't want to endorse that as *the* strategy to use since the linux
kernel obviously uses compiler built-ins to get's it's alignments right.

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253

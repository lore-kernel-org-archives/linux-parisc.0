Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA21231
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 17:44:08 -0700
Sender: drepper@cygnus.com
To: Grant Grundler <grundler@cup.hp.com>
Cc: Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: tar hangs on 715/75 (spinlock problem)
References: <200101230017.QAA19389@milano.cup.hp.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 22 Jan 2001 16:38:07 -0800
In-Reply-To: Grant Grundler's message of "Mon, 22 Jan 2001 16:17:29 -0800"
Message-ID: <m34ryrgl1s.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler <grundler@cup.hp.com> writes:

> > I think the libpthreads spinlock definitions come from
> > glibc/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h, struct
> > pthread_mutex_t, spinlock is inside __m_lock.  No alignment is
> > specified.  When debugging tar, I found the spinlock word at
> > 0x4014df4c.

Then add appropriate alignment.  What's the problem?  We just don't
have to do it for any architecture.

> I spoke with Scott Norton (http://www.hp.com/hpbooks/authors/norton.html)
> and he made it clear the POSIX spec defines pthread_mutex_t to be an
> "opaque" type - ie it's arch specific.  _pthread_fastlock and
> pthread_spinlock_t types must be aligned to correctly work under parisc
> and Scott made it clear these are not POSIX data types.
> Perhaps UNIX98 or some other standard.

The leading underscore should tell you that this is an internal,
private type.

> What's baffled me is did this ever work under HPUX?
> 
> HP published a CD with a bunch of GNU/open source tools for HPUX 11.
> The glibc version shipped was 1.2.6. Only has references to pthread_mutex_t
> and none for "spinlock".

Glibc has no support for HPUX.  I know some people inside HP worked on
it but none of this code is available.  Besides, I doubt that the
LinuxThreads add-on is used on HPUX.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------

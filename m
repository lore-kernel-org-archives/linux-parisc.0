From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Sat, 2 May 2009 18:34:59 -0400 (EDT)
Message-ID: <20090502223459.BC8924EE8@hiauly1.hia.nrc.ca>
References: <20080417075357.GB23641@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: matthew@wil.cx, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080417075357.GB23641@phobos.i.cabal.ca> from "Kyle McMartin" at Apr 17, 2008 03:53:57 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Kyle,

> On Sun, Apr 06, 2008 at 07:09:59PM -0400, John David Anglin wrote:
> > > If you strace it, what syscall returns -EOPNOTSUPP?
> > 
> > strace is broken and quits before the relevant syscall.  Think I
> > mentioned this before is a different context.
> > 
> 
> Fixed & updated strace available at
> http://people.debian.org/~kyle/strace/

strace is either broken again or debian didn't pick up your fix.  The link
to your updated version is broken.

This happens when tracing sshd during a connection attempt with -f option:

strace -f -p 2390
Process 2390 attached - interrupt to quit
_newselect(7, [3 4], NULL, NULL, NULL
...
[pid  5627] open("/etc/selinux/config", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
upeek: ptrace(PTRACE_PEEKUSER,5627,4294967292,0): Input/output error
Process 5627 detached
<... _newselect resumed> )              = 1 (in [6])

Trying to figure out why sshd sometimes does wierd stuff.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

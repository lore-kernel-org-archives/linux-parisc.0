Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA18565
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 10:53:14 -0600
Message-Id: <200010181653.MAA06998@hiauly1.hia.nrc.ca>
Subject: Re: problems with binutils and/or g++
To: dhd@linuxcare.com (David Huggins-Daines)
Date: Wed, 18 Oct 2000 12:53:41 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, alan@linuxcare.com.au, parisc-linux@thepuffingroup.com
In-Reply-To: <87itqq2p7f.fsf@linuxcare.com> from "David Huggins-Daines" at Oct 18, 2000 10:34:12 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Randolph Chung <randolph@tausq.org> writes:
> 
> > Alan, for my curiosity, could you explain this particular line from g++'s 
> > output (from dhd's message)?
> > 
> > ../build/obj/cmdline/apt-get.o(.gnu.linkonce.t.__tf10LogCleaner+0x1c):
> > cannot handle R_PARISC_PCREL17F for pkgArchiveCleaner type_info function
> > 
> > that seems to be causing the "undefined" symbol messages.
> 
> No, it's caused *by* the undefined symbol.  If a symbol is undefined,
> it won't have a stub hash entry.  If it doesn't have a stub hash entry
> and it is either in a shared library or out of branch range, then
> relocations to it can't be handled.  Thus the error message.

I have observed problems with cc1plus regarding weak symbols that sometimes
don't get output.  For example, libg++ wouldn't build under i386 linux for
a number of weeks because of this.  Turning off math inlining (define
__NO_MATH_INLINES) would for some strange reason fix the problem.  The
problem was fixed a week or two ago, although it is not clear what patch
fixed the problem.  The problem didn't seem to occur for the pa port
under hpux.

On the otherhand, cc1plus has problems compiling tFile.cc in the libio
testsuite under hpux.  Although the compile does complete sucessfully
after a long time, it uses an enormous amount of memory.  This doesn't
happen under i386 linux.  I have determined the memory blow up occurs
in the gcse pass but haven't been able to find the cause as of yet.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Thu, 6 Sep 2007 21:25:13 -0400 (EDT)
Message-ID: <200709070125.l871PD6I007142__102.875653147017$1416624437$gmane$org@hiauly1.hia.nrc.ca>
References: <20070907005002.GG27404@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: varenet@gmail.com,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: matthew@wil.cx (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070907005002.GG27404@parisc-linux.org> from "Matthew Wilcox"
	at Sep 6, 2007 06:50:02 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, Sep 06, 2007 at 04:33:00PM -0400, John David Anglin wrote:
> > This has arisen on the PA since we have separate 32 and 64 bit tools.
> > In other architectures, a compiler flag is used to select the output
> > architecture.
> 
> Any interest in doing the unification of 32 and 64-bit?  ISTR Jeff
> Bailey had binutils working.

Not really.  Binutils is probably easier than GCC.  With the GCC,
the problem is macros that are defined in one case and not the
other.  The hard OS is hpux because 32-bit is SOM and 64-bit ELF.
Linux would be much easier because of the consistent runtime
architecture.

The reality is that a lot of work has been needed to keep up with
the rapid changes occuring in the middle of GCC and it has been
difficult to keep things from regressing.  For this to happen,
somebody else would have to do it.  Personally, I would rather
see work on the 64-bit linux userspace.

I must say though that I find the stability and reliability of
hppa-linux much better than it was a year or two ago.  I haven't 
had any crashes, even on SMP machines, with 2.6.22.x.  Applications
also seem to run reliably.  There is some issue with timeouts in
the GCC testsuite, particularly on 64-bit machines.  I think SMP
performance isn't great (e.g., 650 MHz running hpux beats 800 MHz
linux in GCC builds and checks).  Probably, this is the TLB flush
issue and why 2.6.23 is broken currently (Kyle's flush cleanup).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

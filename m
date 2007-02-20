From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Mon, 19 Feb 2007 23:08:14 -0500 (EST)
Message-ID: <200702200408.l1K48FOe013501__46973.9035972909$1416624308$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702191908r773a00capade2bc7ec19c4160@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702191908r773a00capade2bc7ec19c4160@mail.gmail.com>
	from "Carlos O'Donell" at Feb 19, 2007 10:08:10 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 2/19/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > > John, what's the fastest non-PA8800 machine you have right now? Would a dual
> > > 750MHz j6700 help you?
> >
> > c3750 (875 MHz).  This one is is subject to the thread timing bug.
> 
> What is the "thread timing bug"?

http://lists.parisc-linux.org/pipermail/parisc-linux/2006-December/030969.html

I presume this is the same bug as you reported here:
http://lists.parisc-linux.org/pipermail/parisc-linux/2007-February/031200.html

In the java case, the tests that fail are always thread intensive.
I should note that when a test times out in the gcc testsuite (other
than in the acats suite), expect tries to kill off the processes
that have timed out.  Yet, sometimes the processes survive and killing
the initial process causes a system crash.  Also, the system often
fails to reboot when it panics.

There's some timing aspect to this bug.  I have the strong impression
that it occurs mainly on fast processors.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

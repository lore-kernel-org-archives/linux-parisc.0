From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Thu, 14 Dec 2006 12:22:53 -0700
Message-ID: <20061214192253.GR21070__11581.2355805703$1416624232$gmane$org@parisc-linux.org>
References: <119aab440612140929i3f5ea59dvb002b6fa525978ff@mail.gmail.com>
	<200612141914.kBEJETU6021023@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612141914.kBEJETU6021023@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Dec 14, 2006 at 02:14:28PM -0500, John David Anglin wrote:
> > Yes. We talked about this before. You have to set up a serial console
> > to your C3K, and issue a SYSRQ-T to show where the process is stuck in
> > the kernel.
> 
> I know but that's a problem.  Can't capture enough info to graphics
> console.  Don't have the right cable for a serial console, so I would
> probably have to build it.  The machine's downtown and I haven't been
> driving for the last two weeks.  Before that, Luxcom was sucking up
> most of my time.

I have a bunch of null-modem cables; you can borrow one if you like.
Heck, if you give me directions (and sort out access permissions),
I can go and install it for you.

> I've now using ethernet consoles for the servers but that's not an
> option for the c3k.  Really, it would be great if it were possible
> to do a SYSRQ-T over a standard ssh link.

Ah, /proc/sysrq-trigger is your friend here.

Best of luck with your eye problems!

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

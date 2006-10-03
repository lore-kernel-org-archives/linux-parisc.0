From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] check_ivt panic / binutils
Date: Mon, 2 Oct 2006 22:52:01 -0400 (EDT)
Message-ID: <200610030252.k932q2h5024391@hiauly1.hia.nrc.ca>
References: <1159841839.5737.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: jbailey@raspberryginger.com (Jeff Bailey)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1159841839.5737.13.camel@localhost.localdomain> from "Jeff
	Bailey" at Oct 2, 2006 10:17:19 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > I bisected the binutils CVS until I found the failure point.  It seems
> > > that with 2006-04-30 I don't get the check_ivt failure (although the
> > > kernel does die immediately after e100 is initialised), but at
> > > 2006-05-01, I get the check_ivt failure.
> >=20
> > It's not at all obvious why you think this is a binutils bug.
> 
> Sorry, the first part of the conversation happened on IRC, my bad.
> 
> I was trying to figure out why I was seeing a problem that Joel had
> reported before and no-one else was.  Kyle got me to try a sid chroot,
> and it didn't happen there.  Eventually I narrowed down the difference
> between a working kernel and a non-working one was whether I was using a
> bleeding edge CVS snapshot, or whether I was using the released
> binutils-2.17 package.

If you think it's a binutils issue, then cmp the two kernels
or modules and see if they differ.  Generate an assembler printout
for the code that caused the panic.  This would show if there's a
relocation issue with the instruction that causes the panic.

There haven't been many changes to the hppa binutils port in recent
months.  The TLS stuff went in after you say the failure started.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

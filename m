From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] hppa glibc 2.3.2-9 available for the brave testers!
Date: Mon, 20 Oct 2003 00:33:14 -0400
Message-ID: <20031020043314.GA26432__42352.5406550199$1416622891$gmane$org@systemhalted>
References: <20031018215509.GB10704@colo.lackof.org> <200310182225.h9IMPR0i023691@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200310182225.h9IMPR0i023691@hiauly1.hia.nrc.ca>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Oct 18, 2003 at 06:25:27PM -0400, John David Anglin wrote:
> > I've installed the libc6 and libc6-dev debs on both c3k's
> > and they both are working fine (well, mozilla-firebird is
> > still broken, not new).
> 
> I don't know about firebird but standard mozilla needs some pa specific
> configuration stuff added before it will build/work.  I made a first
> cut at this and started debugging the app a few weeks ago, but got
> caught up in other things.

I'm surprised that more things aren't broken, the typo in sysdep-cancel
made all six argument syscalls unsuable :)

Thanks for the testing guys!

c.

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: strtold
Date: Sat, 7 Jan 2006 21:28:26 -0700
Message-ID: <20060108042826.GA3567@colo.lackof.org>
References: <20060107210757.GM17559@baldric.uwo.ca>
	<200601072241.k07MfqiW020827@hiauly1.hia.nrc.ca>
	<20060107234230.GQ17559@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060107234230.GQ17559@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jan 07, 2006 at 06:42:30PM -0500, Carlos O'Donell wrote:
...
> > I've given up hope that HP will release their IEEE long double emulation
> > code for PA-RISC.  Although I don't have any hard evidence of bugs in it,
> > there is the suggestion from the ada testsuite run under hpux that there
> > may be bugs in the rounding and exception support.
> 
> I agree, I don't think it will ever be released. If it is released then
> we'll jigger it out some other way :)

Me too. But I wouldn't worry about an ABI event too much.
As long as the only dependency is debian/gentoo packages,
then I think we can tolerate an ABI event like this on the
next OS release if necessary.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

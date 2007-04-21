From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: hanging linuxthread processes
Date: Sat, 21 Apr 2007 12:49:17 -0500
Message-ID: <1177177757.3718.79.camel__32178.1555343934$1416624340$gmane$org@mulgrave.il.steeleye.com>
References: <200704211726.l3LHQxEg027021@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200704211726.l3LHQxEg027021@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2007-04-21 at 13:26 -0400, John David Anglin wrote:
> > On Sat, 2007-04-21 at 12:16 -0400, Carlos O'Donell wrote:
> > > Are you considering your patch for Kyle's CFP?
> > 
> > Er, what patch?
> 
> http://lists.parisc-linux.org/pipermail/parisc-linux/2007-February/031385.html

This one, definitely not ... it doesn't work ... I need to get acess to
a machine again where I can play around with it.

> There's also the somewhat related space register issue associated with
> TLB flushing:
> 
> http://lists.parisc-linux.org/pipermail/parisc-linux/2007-February/031365.html

I think this one works OK ... but we could do with checking it

> Randolph's change to tlbflush.h is broken and needs to be reverted
> if we don't have a better fix yet.

I really think these problems demonstrate this new approach to patch
management is non functional.  I bet even the good patch has had no
testing at all for the last two months.  I'm afraid that unless I care
about a patch (i.e. I need it for something I'm doing), I shoot it
across the list and forget about it.  Previously, when I checked it into
the repository and forgot about it, at least it was being built and
tested ... and someone would eventually notice if it needed to go
upstream.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

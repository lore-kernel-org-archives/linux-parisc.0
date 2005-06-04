From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] usb/input/hid-core.c extract() brain damage
Date: Fri, 3 Jun 2005 21:25:18 -0400 (EDT)
Message-ID: <200506040125.j541PI7g009179__47127.3056966767$1416624540$gmane$org@hiauly1.hia.nrc.ca>
References: <20050604011655.GA16999@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org,
 linux-usb-devel@lists.sourceforge.net,
 kyle@cabal.ca
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050604011655.GA16999@colo.lackof.org> from "Grant Grundler" at
	Jun 3, 2005 07:16:55 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > It seems that this problem has been around for some time.
> 
> I didn't check to see how long this code has been around.

It's in 2.6.10-pa3.  Since the USB mouse and keyboard work in it,
some other change must have been involved in the 2.6.12 breakage.

As an aside, 2.6.10-pa3 doesn't seem to have the stability problems
that I saw 2.6.11-pa4.  It pretty much seems as stable as 2.6.8.1-pa11
on my c3750.  There was hang in the java testsuite (PR218) in one of
two gcc builds and check.  Otherwise, the test results were identical.

> > Does it fix the usb keyboard and mouse problems in 2.6.12?
> 
> USB keyboard and mouse work with 2.6.12-rc5 on parisc.

Great!

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

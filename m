Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 327E8482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 17:04:13 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 163R3i-0004iM-00; Tue, 13 Nov 2001 00:04:10 +0000
Date: Tue, 13 Nov 2001 00:04:10 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Craig D. Lansing" <lansing@beldar.com>
Cc: thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost There...
Message-ID: <20011113000410.A15323@parcelfarce.linux.theplanet.co.uk>
References: <3BEF3746.FB93DC1@beldar.com> <20011112070306.B14600@alpha.of.nowhere> <004401c16bd7$33ae82e0$0101a8c0@pogo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <004401c16bd7$33ae82e0$0101a8c0@pogo>; from lansing@beldar.com on Mon, Nov 12, 2001 at 07:07:35PM -0500
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Nov 12, 2001 at 07:07:35PM -0500, Craig D. Lansing wrote:
> Today, I rescued a 700/96 and cable from the trash so I'm going to try to
> use it as a serial console to see how far I get.  It's amazing the "junk"
> that shows up in the trash when your HP shop gets bought out by an IBM shop.
> Anybody need a few K580x4's, 4GB RAM, and a couple of fully loaded AutoRaid
> cabinets each?  In the meantime, how do I change the "Command Line" at boot?
> Do I have to "interact" with IPL (almost as bad as having to interact with
> people :-) ?

The K580s are definitely of interest...

Yes, interacting with IPL (or ISL on some models) is how you change
the command line params; you get a nifty little menu and can edit the
arguments.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A0074829
	for <parisc-linux@parisc-linux.org>; Wed, 11 Dec 2002 16:05:17 -0700 (MST)
Message-Id: <200212112305.gBBN5Bdj021432@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] ["CSA Test Drive" <TestDrive@compaq.com>] FW: Some issues
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 11 Dec 2002 18:05:10 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bdale@gag.com, parisc-linux@parisc-linux.org
In-Reply-To: <20021211224404.GC15219@systemhalted> from "Carlos O'Donell" at Dec 11, 2002 05:44:04 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> The code _seems_ to trap on a PA8600. Though I won't say anything until
> I enable debugging in the trap handler and rerun the test.

The code doesn't seem to trap on a A500 which I believe is a PA8500.
I think we need to look at bits 0..1 of the coprocessor configuration
register to determine instruction validity.  See table 8-6 on page 8-11.
I can look at what the HP compiler does.  Up to now, we have assumed
that all PA8000 machines have the same instruction set.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

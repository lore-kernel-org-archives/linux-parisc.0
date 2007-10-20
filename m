From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] what's in parisc-2.6.git
Date: Fri, 19 Oct 2007 22:14:59 -0400 (EDT)
Message-ID: <200710200214.l9K2Ex5X001494__10837.4023148373$1416624446$gmane$org@hiauly1.hia.nrc.ca>
References: <20071018194100.GA11936@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20071018194100.GA11936@fattire.cabal.ca> from "Kyle McMartin" at
	Oct 18, 2007 03:41:00 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Just temporarily. The workflow wasn't really working for me, and wasn't
> motivating me to generate diffs. I'll be putting more -pa testkernels
> up.

Ok, I saw you made a lot of updates to parisc-2.6, so I cloned it
this evening.  Noticed a small warning/bug from asm-parisc/rtc.h.

The call to get_rtc_time in get_rtc_ss doesn't check the return
value from get_rtc_time for RTC_BATT_BAD.  As a result, h may
be used unininitialized.  I guess this only happens if the RTC
battery is bad...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Mon, 19 Feb 2007 14:22:16 -0500 (EST)
Message-ID: <200702191922.l1JJMGhm014372__36583.6083343767$1416624306$gmane$org@hiauly1.hia.nrc.ca>
References: <20070219182112.GA32148@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070219182112.GA32148@athena.road.mcmartin.ca> from "Kyle
	McMartin" at Feb 19, 2007 01:21:12 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> John, what's the fastest non-PA8800 machine you have right now? Would a dual
> 750MHz j6700 help you?

c3750 (875 MHz).  This one is is subject to the thread timing bug.

I'm out of ethernet connections and NRC doesn't like switches, so
I can't easily add new machines.  I could swap out the c3750 for
the j6700.  It would probably would build gcc faster.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [Status] hppa's userspace in 2004 (looking back)
Date: Tue, 6 Jan 2004 01:16:44 -0500 (EST)
Message-ID: <200401060616.i066GiBR007413__29604.4745985002$1416623108$gmane$org@hiauly1.hia.nrc.ca>
References: <20040106053924.GC14464@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040106053924.GC14464@systemhalted> from "Carlos O'Donell" at
	Jan 6, 2004 00:39:25 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Does this seem like a reasonable triage list?
> 
> a. gdb.
> b. atomic kernel ops.
> c. libstdc++ failures.

I expect GCC 3.4 is coming in 2-3 months, although there isn't a definite
timeline yet.  Would you like to try to get atomic kernel ops in 2.6.x?
How important is the kernel timeline for this work?  We missed gdb 6.0.
A couple of quick hacks allow 6.0 to build for hppa-linux.  Bug fixes are
another matter.

Probably, the v3 issues involve doing enough research to file a PR if
the problem is generic, fix the problem if it is GCC hppa specific.
If a problem turns out to be glibc/kernel related, we can wait for
a fix ;)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

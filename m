Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04A6B482E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Nov 2002 19:33:13 -0700 (MST)
Date: Sun, 17 Nov 2002 02:32:58 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, <bzeeb-lists@lists.zabbadoz.net>,
	<carlos@baldric.uwo.ca>, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] [2.5] next issues ...
In-Reply-To: <200211160037.gAG0bZRa015952@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.44.0211170215340.6003-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 15 Nov 2002, John David Anglin wrote:

> > Amen! :-) hopefully we are going to start gcc-3.2 transition fairly
> > soon.
>
> Don't wait too long!  3.3 may have slipped a bit but the schedule
> still shows Dec. 15 2002 as the release date.

I'm not very familiar with the pa-risc internals, but I wonder whether it
is probably a better idea to wait for 3.3?. I've followed the parisc-linux
and the gcc-mailing lists and IMHO gcc-3.3 provides lots of
improvements, not just for Intel, but also for PA-RISC. E.g. a new
scheduler which provides better optimizations (for PA-RISC and lots of
bugfixes are in 3.3. More over the C++ ABI will be changed again, so a
couple  of packages would have to be rebuild AGAIN if we stick to 3.2 (if
not the 3.2-ABI compatibility is used). The people at gcc are just about
to release 3.2.1 and from then they're just focussing on the 3.3-release.
AFAIK they are also to resolve some gcc-hpux/linux issues at the moment,
and I doubt they are going to be in gcc-3.2.1. You probably know much
better than me, but that's just my 2 cent.

I know, it's not the usual debian way (using well tested and very stable
packages), but Linux/PA-RISC is improving/has so much possibilities
to improve, and one major package that contributes to this alot is gcc.


greetings max

PS: I offered to help to track down the problems with Voodoo3 and C240,
but right now I'm really busy (e.g. moving to a new home over the
weekend). Hopefully I'll finnaly have a DSL flatline at home, so I can
work from home ;)

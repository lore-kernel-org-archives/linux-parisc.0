Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA26524
	for <parisc-linux@puffin.external.hp.com>; Thu, 31 Aug 2000 20:52:38 -0600
Message-Id: <200009010248.WAA17382@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PATCH: build gcc/gcc/depedence.c w/HPUX ANSI C
To: grundler@cup.hp.com (Grant Grundler)
Date: Thu, 31 Aug 2000 22:48:58 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: gcc-patches@gcc.gnu.org, parisc-linux@thepuffingroup.com
In-Reply-To: <200009010220.TAA20141@milano.cup.hp.com> from "Grant Grundler" at Aug 31, 2000 07:20:06 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Hi folks,
> I work on the parisc-linux port and was trying to build binutils/gcc
> on an HP-UX 11 system. HP-UX ansic didn't like enum direction_type[][]
> or int[][] constructs.  It complained with:
> cc: "/linux/pa32/gcc/gcc/dependence.c", line 199: error 1501: Only the first
> 	dimension of an array may be omitted.

I believe this was recently fixed in the mainline source:

2000-08-23  Alexandre Oliva  <aoliva@redhat.com>

        * dependence.c: Replace `[][]' with `[][MAX_SUBSCRIPTS]'.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

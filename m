Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B4BE482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 18:48:37 -0600 (MDT)
Message-Id: <200205290048.g4T0mUrP026311@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PATCH: flush_icache_page() and flush_icache_range()
To: rhirst@linuxcare.com (Richard Hirst)
Date: Tue, 28 May 2002 20:48:30 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020528234023.GF3471@sleepie.demon.co.uk> from "Richard Hirst" at May 29, 2002 00:40:24 am
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

> Hi,
>   gdb has a problem in that it often doesn't stop the target program
> when you do a 'step' or 'next'.  This is because it plants breakpoints,
> but those breakpoints sit in the data cache and don't get flushed
> through to be visible as code in time.  We need a flush_icache_page()
> implementation to fix this; the following adds that and
> flush_icache_range() also.  It does fix gdb for me on my a500.

Good find! I'll give it a try.  Can you now print function results?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

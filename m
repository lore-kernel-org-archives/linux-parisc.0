Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BEFA54844
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Sep 2003 17:16:06 -0600 (MDT)
Message-Id: <200309172315.h8HNFYC1025245@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 64-bit kernel builds with gcc-3.4 experimental cross.
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 17 Sep 2003 19:15:34 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca
In-Reply-To: <20030917225406.GG30176@systemhalted> from "Carlos O'Donell" at Sep 17, 2003 06:54:07 pm
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

> Separate compilers yes. Separate linker and assembler no.

There isn't an option in as to select the output object format.
There are somewhat different relocations used in the 32 and 64
bit formats.  So, I don't see how you can use a single assembler
for both.

You may be able to use "-A" with ld but GCC doesn't support this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

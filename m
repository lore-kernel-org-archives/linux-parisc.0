Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C43D4833
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 08:09:30 -0600 (MDT)
Message-Id: <200205291409.g4TE9RG7027493@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PATCH: flush_icache_page() and flush_icache_range()
To: rhirst@linuxcare.com (Richard Hirst)
Date: Wed, 29 May 2002 10:09:27 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020529060242.GG3471@sleepie.demon.co.uk> from "Richard Hirst" at May 29, 2002 07:02:42 am
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

> You mean like
> 
> Breakpoint 1, main (argc=1, argv=0xbff00148) at ../simple.c:16
> 16              a = thing(1);
> (gdb) print thing(7)

Yes.  I find this an extremely useful feature in debugging gcc.  It
has various hooks to print rtl and tree structs that I miss not being
able to use.

> thing(x) just returns x*2 in this case.  As you see it didn't work, 
> and gave a protection id trap for the target program.  I'll investigate
> further.

Great.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

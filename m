From: Andreas Schwab <schwab@suse.de>
Subject: Re: [parisc-linux] /lib/ld.so.1 (glibc) issues on parisc-linux 2.5
 kernel??
Date: Mon, 24 Mar 2003 10:48:06 +0100
Message-ID: <jeptohumcp.fsf__5590.00319703973$1416622322$gmane$org@sykes.suse.de>
References: <1048493134.8777.22.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: libc-alpha@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org
To: Ryan Bradetich <rbradetich@uswest.net>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1048493134.8777.22.camel@beavis.ybsoft.com> (Ryan Bradetich's
 message of "24 Mar 2003 01:05:34 -0700")
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Ryan Bradetich <rbradetich@uswest.net> writes:

|> Hello again,
|> 
|> I have been working on tracking this down some more, and I think I found
|> something odd.  I just wanted to verify this is an anomaly (and
|> potentially the problem) or if this is the correct behavior, understand
|> why.
|> 
|> 
|> I am starting to think the kernel is doing the correct thing and
|> glibc is causing the problem ... based on debug output from i386
|> and just my general understanding (or lack of understanding :))
|> of the elf file format.
|> 
|> The bootstrap_map.l_addr was printed using _dl_debug_printf right
|> after the following line in glibc-2.3.1/elf/rtld.c:
|> 
|> 	      ELF_DYNAMIC_RELOCATE (&bootstrap_map, 0, 0);
|> 
|> The ENTRY_POINT, _start, and user_entry line was added as the first
|> line of code in the function dl_main in glibc-2.3.1/elf/rtld.c.
|> 
|> This is the debug output on hppa:
|> ---------------------------------
|> rbrad@vega:~/glibc-2.3.1/hppa-linux/obj/elf$ ./ld.so --verify /bin/sh
|> 
|> 05626:  bootstrap_map.l_addr: 41000000
|> 05626:  ENTRY_POINT: 41027162 _start: 41027162 user_entry: 41001ff0

hppa is using function descriptors, AFAIK.  So you'll have to do something
similar to what ia64 and ppc64 are doing.

Andreas.

-- 
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux AG, Deutschherrnstr. 15-19, D-90429 Nürnberg
Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA27648
	for <parisc-linux@puffin.external.hp.com>; Mon, 3 Apr 2000 09:06:40 -0600
Date: Mon, 3 Apr 2000 11:06:37 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.10.10003252208590.28525-100000@morph.net>
Message-ID: <Pine.BSO.4.21.0004031058540.21769-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] ALPHA cross compile -- progress
List-ID: <linux-parisc.vger.kernel.org>



OK, so I got over my last problem by doing a more thorough
search in the gas sources for the BFD64 macro and undeffing
it everywhere...  Now I can compile and install gcc (my
compile doesn't fail on libgcc1 like the recipe says -- maybe
because I have the linux devel environment?)

Now things die during kernel compilation:
hppa1.1-linux-gcc -I/usr/src/parisc/linux-2.3/include  -D__KERNEL__
-I/usr/src/parisc/linux-2.3/include  -c -o interruption.o interruption.S
interruption.S: Assembler messages:
interruption.S:257: Error: Value of -3221225472 too large for field of 4
bytes at 36
interruption.S:257: Error: Value of -3221225472 too large for field of 4
bytes at 40
interruption.S:257: Error: Value of -3221225472 too large for field of 4
bytes at 56
make[1]: *** [interruption.o] Error 1

I note that compiling gas issues one warning about a pointer/integer 
sizes in tc-hppa.c.  Should I be looking at that for the cause, or
elsewhere?

--
Brian S. Julin

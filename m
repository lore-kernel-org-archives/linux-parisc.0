Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A9254857
	for <parisc-linux@parisc-linux.org>;
	Mon, 15 Mar 2004 07:36:01 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B2tCC-0003IT-19; Mon, 15 Mar 2004 14:36:00 +0000
Date: Mon, 15 Mar 2004 14:35:59 +0000
From: Matthew Wilcox <willy@debian.org>
To: pinotj@club-internet.fr
Subject: Re: [parisc-linux] [DOC] Linux 2.6.4
Message-ID: <20040315143559.GD25059@parcelfarce.linux.theplanet.co.uk>
References: <mnet8.1079358785.20900.pinotj@club-internet.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <mnet8.1079358785.20900.pinotj@club-internet.fr>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Mar 15, 2004 at 02:53:05PM +0100, pinotj@club-internet.fr wrote:
> I wrote this week-end a document to sum up all the arch that Linux
> 2.6.4 support. I extracted the informations from the source and I would
> like to have comments/changes/advice from you about the PA-RISC part. I
> have maybe make some mistake and/or things are little bit different so
> I would like you to take a look at this (I removed the non-PARISC parts,
> the complete file is around 11ko) before suggesting a patch.

This doesn't seem *terribly* useful in its current form ... and of course there are some mistakes.  It might help if I saw what the other entries look like,
but it might make more sense to say something like:

+ 10. PA-RISC
+ ~~~~~~~~~~~
+	705, 710, 720, 730, 750
+	712, 715, 725, 735, 755
+	B, C, J class workstations
+	D, K, R, A, L, N class servers and rpXXXX servers
+	T and V class servers are not supported
+	Superdome will need some additional work.
+
+  (see Documentation/parisc)
+  <http://www.parisc-linux.org>


> --- linux-2.6.4.orig/Documentation/ARCH	1970-01-01 09:00:00.000000000 +0900
> +++ linux-2.6.4/Documentation/ARCH	2004-03-15 16:20:06.000000000 +0900
> @@ -0,0 +1,425 @@
> + Content:
> + ~~~~~~~~
> +	1. i386		7. IA-64		13. S390
> +	2. Alpha	8. M68K (w/o MMU)	14. SuperH
> +	3. ARM		9. MIPS (32/64)		15. SPARC
> +	4. ARM26	10. PA-RISC		16. UltraSPARC
> +	5. CRIS		11. PPC			17. v850
> +	6. H8300	12. PPC64		18. x86-64

S390 and PA-RISC also support both 32 and 64 bit.
I'd leave off the 'w/o MMU' tag from M68k since both are supported.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

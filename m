From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux]
	Heads up, 2.6.7-pa0 FTBS with 64-bit toolchain + loop
Date: Wed, 16 Jun 2004 15:44:11 -0400
Message-ID: <20040616194411.GB3412@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


2.6.7-pa0 fails to build on newer 64-bit toolchain:

  CC      drivers/block/loop.o
{standard input}: Assembler messages:
{standard input}:3652: Error: Field not properly aligned [8] (-183).
{standard input}:3652: Error: Invalid operands 
make[2]: *** [drivers/block/loop.o] Error 1
make[1]: *** [drivers/block] Error 2
make: *** [drivers] Error 2

Just a heads up.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

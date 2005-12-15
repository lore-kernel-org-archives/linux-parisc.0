From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Unknown FPU exception, help needed, please decode.
Date: Thu, 15 Dec 2005 14:22:04 -0500
Message-ID: <20051215192204.GE1298@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


pa,

Running some more compliant fpu code in glibc causes this:

arch/parisc/math-emu/decode_exc.c(351) Unknown FPU exception 0x23
arch/parisc/math-emu/decode_exc.c(351) Unknown FPU exception 0x23
...

Could someone please decode the FPU exception and tell me if the kernel
is doing the right thing?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

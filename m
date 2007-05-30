From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3 ?
Date: Wed, 30 May 2007 02:52:21 -0400
Message-ID: <20070530065221.GB18422__39453.9687702947$1416624379$gmane$org@fattire.cabal.ca>
References: <200705271438.57394.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@fattire.cabal.ca>
In-Reply-To: <200705271438.57394.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, May 27, 2007 at 02:38:57PM +0200, Helge Deller wrote:
>

Ok.

Pushed out a new HEAD (cc650a7a9f5ebc3f9290a8e20e3f55b4f52f849e) which
fixes the issues I was having booting on C8000.

http://git.kernel.org/git/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commit;h=376e210b71d7736775f43f32c5c7712f90aaf59a

was the fix for why userspace was not working at all for a 64-bit
kernel.

http://git.kernel.org/git/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commit;h=cb9577958d85896303561d9cc8544885deb272be

was the fix for one(?) of the unwinder bugs. Well, the brown paper bag
fix at least. Fix for the fix is pending upstream ack.

Now maybe I can get some sleep.

Cheers,
	Kyle

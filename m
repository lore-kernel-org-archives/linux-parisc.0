Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp3.xs4all.nl (smtp3.xs4all.nl [194.109.127.132])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44454482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 23:18:03 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp3.xs4all.nl (8.9.3/8.9.3) with ESMTP id HAA01514
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Aug 2001 07:18:01 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Fri, 31 Aug 2001 06:57:32 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.9-pa10 hangs on c200+ after 'branching to kernel entry point'
Message-ID: <20010831065732.B4816@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010830215714.A19233@middle.of.nowhere> <20010830210933.D30497@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010830210933.D30497@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 30, 2001 at 09:09:33PM +0100, Matthew Wilcox wrote:
> On Thu, Aug 30, 2001 at 09:57:14PM +0200, thunder7@xs4all.nl wrote:
> > I did change the CPU-type to PA8x00, and set CONFIG_PA20 to y.
> > 
> > That should still work, right?
> 
> Yes.  Just don't go to a 64-bit kernel.  You're not seeing any output
> because of the current serial port snafu.  If you connect another cable
> to your other serial port, you'll see the boot messages.  I've found
> someone in the firmware team who worked on C200-era firmware to talk to
> now, but he's not at his desk right now.
> 
Where can I find any info on 'the current serial port snafu'? Is this
the same problem as mentioned on the 5th of August 'more serial problems
on D310' ?

Jurriaan
-- 
BOFH excuse #279:

The static electricity routing is acting up...
GNU/Linux 2.4.9-ac2 SMP/ReiserFS 2x1402 bogomips load av: 0.06 0.03 0.01

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CC71482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 14:09:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15cY85-00046y-00; Thu, 30 Aug 2001 21:09:33 +0100
Date: Thu, 30 Aug 2001 21:09:33 +0100
From: Matthew Wilcox <willy@debian.org>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.9-pa10 hangs on c200+ after 'branching to kernel entry point'
Message-ID: <20010830210933.D30497@parcelfarce.linux.theplanet.co.uk>
References: <20010830215714.A19233@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010830215714.A19233@middle.of.nowhere>; from thunder7@xs4all.nl on Thu, Aug 30, 2001 at 09:57:14PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 30, 2001 at 09:57:14PM +0200, thunder7@xs4all.nl wrote:
> I did change the CPU-type to PA8x00, and set CONFIG_PA20 to y.
> 
> That should still work, right?

Yes.  Just don't go to a 64-bit kernel.  You're not seeing any output
because of the current serial port snafu.  If you connect another cable
to your other serial port, you'll see the boot messages.  I've found
someone in the firmware team who worked on C200-era firmware to talk to
now, but he's not at his desk right now.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from barry.mail.mindspring.net (barry.mail.mindspring.net [207.69.200.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3322482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Apr 2002 07:49:34 -0600 (MDT)
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id g3TDnKh18021;
	Mon, 29 Apr 2002 09:49:20 -0400
Subject: Re: [parisc-linux] Problems with hardware clock
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
To: kenneth westelinck <kennywest1@hotmail.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <OE32NqFJ3sl3xbYiMCI00001250@hotmail.com>
References: <OE32NqFJ3sl3xbYiMCI00001250@hotmail.com>
Content-Type: text/plain
Date: 29 Apr 2002 09:49:20 -0400
Message-Id: <1020088160.2676.97.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
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

That really sounds like a dead battery problem to me. I don't ave near
the PaRISK experience that I do on intel and sgi. But the symptoms are
identical to to dead battery symptoms on both other platforms.

On Mon, 2002-04-29 at 09:38, kenneth westelinck wrote:
> Hi,
> 
> When I first booted my 712/60, that was a few months ago, it was running
> some old HP-UX version. Also, the clock was running 7 years behind. After
> upgrading my box to Linux I tried to set this clock to a more recent point
> in time. No luck however, the date command is -for some reason- not working
> for me. So I'm using this workaround to set my clock:
> hwclock --set --date="04/29/2002 15:22:00", then hwclock --hctosys.
> The problem is that the system does not appear to keep track of time when
> it's powered off.
> So if I shutdown the system, today at 18h00, the date will still be
> 04/29/2002 - 18h00 if I boot the system tomorrow. Sometimes the date is
> reset to 1970. Currently I'm using NTP to bypass this issue.
> 
> Any ideas why this is happening? Could it be that some battery is dead?
> (According to this site my box should be Y2K compliant:
> http://www.wagoneers.com/UNIX/HP-UX/Y2k.html)
> 
> 
> Thanks.
> 
> Kenneth
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
-- 
James P. Kinney III   \Changing the mobile computing world/
President and CEO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint = 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7 

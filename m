Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from wolf.alaskatech (207-5-237-24-cable.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8E3E482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 10:34:06 -0700 (MST)
Received: from wolf.alaskatech (palinux@wolf.alaskatech [24.237.5.207])
	by wolf.alaskatech (8.12.3/8.12.3/Debian -4) with ESMTP id gALHYcRO023533;
	Thu, 21 Nov 2002 08:34:38 -0900
Date: Thu, 21 Nov 2002 08:34:38 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Chris Jantzen <chris-parisc@maybe.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 not booting Sarge kernel
In-Reply-To: <20021121090154.GB23152@maybe.net>
Message-ID: <Pine.LNX.4.44.0211210831370.23497-100000@wolf.alaskatech>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 21 Nov 2002, Chris Jantzen wrote:
> FYI, my sarge-based C180 has not been able to boot 2.4.19-32_18 or _22.1;
> I have to interact with IPL and fall back to 2.4.18_62.2. It gets as
> far as the "...if this is the last message you see..." and I never hear
> from it again, even on the network. And I think after a very very long
> time, it falls back to firmware. At least, I see DHCP requests coming
> out of it after a while. (I only just hooked up serial console to
> interact with IPL after getting no response. No I don't boot it up too
> often, it's a "side project".)

This is the "bus-walk" issue I asked about a few weeks back. Apparently
the system is looking through every possible connection, looking for
peripherals, and doesn't continue until it finishes. My C180 sits for ~20
minutes at that point, then continues and runs normally. Boots normally on
2.4.18-pa59, happens on all the 2.4.19 kernels (pa20, pa24 for sure, as I
tried both of those). Not sure about 2.4.20-rc1-pa6, but it did boot (I
wasn't paying attention - powered up before dinner, after dinner
everything was waiting for me <g>)

"They" swear this has a fix in 2.5, but I just let it take it's time and
all seems happy...

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4800148A3
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 Oct 2003 10:10:49 -0600 (MDT)
Date: Thu, 16 Oct 2003 17:10:39 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <soete.joel@tiscali.be>
Cc: hinzen@blah.pl, parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] ATI rage xl and C360 (it works!)
In-Reply-To: <3F8A29A2000025F8@ocpmta1.freegates.net>
Message-ID: <Pine.LNX.4.58.0310161708130.15082@sal.ucc.ie>
References: <3F8A29A2000025F8@ocpmta1.freegates.net>
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

On Thu, 16 Oct 2003, Joel Soete wrote:

> Thomas,
>
> Thanks a lot, you config file was very helpfull to make it work:
> root@fw02:~# modprobe atyfb
> atyfb: using auxiliary register aperture
> atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27] 8M WRAM, 14.31818 MHz XTAL,
> 230 MHz PLL, 83 Mhz MCLK, 63 Mhz XCLKConsole: switching to colour frame buffer
> device 80x30
> fb0: ATY Mach64 frame buffer device on PCI

I wonder whether you can also use more recent ATI Radeon graphic cards.
So far I've only seen reports about ATI Rage XL, but does this patch
work with any kind of ATI card?

Thanks,
  Max

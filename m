From: "rubisher" <rubi.sher@scarlet.be>
Subject: Re:BUG 2.6.26-rc2: deadlock with pa_tlb_lock
Date: Tue, 20 May 2008 13:36:14 +0100
Message-ID: <K1630E$CD50E274087F116859994AEA72189418@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>,
	"rubisher" <rubisher@scarlet.be>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello,

> Hey,
> 
> Rebuilding now with gcc-4.2 (instead of gcc-4.3) and retesting
> with 2.6.26-rc3.
> 
Just a short report, tbh I didn't pay attention that gcc-4.3 became the
default gcc on my unstable install:
same Kyle git tree 2.6.26-rc2 + fixed vmlinux.lds 32bit up build for d380 &
b2k with new gcc-4.3 boot well but nic failed to work (either from box ping
outside or the contrary: nothing respond)? (the same for the 2 different boxes.)

Otoh, same src tree rebuild with gcc-4.2 works fine on the boxes without any
other chg.

Hth,
  r.




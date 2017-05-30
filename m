From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2] serial/parisc: Ignore AUX port of DIVA on rp34xx
 machines
Date: Tue, 30 May 2017 23:21:12 +0200
Message-ID: <6f18e42e-e4e3-311d-163a-fed71268e8f0@gmx.de>
References: <20170521211623.GA22326@ls3530.fritz.box>
 <20170529200545.GA19561@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170529200545.GA19561@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 29.05.2017 22:05, Helge Deller wrote:
> On rp34xx machines Linux detects the AUX port of the DIVA GSP card (PCI
> subsystem id 0x1291) before the console port of DIVA GSP and as such the AUX
> port becomes ttyS0 and the console port becomes ttyS1.
> Since the palo bootloader by default sets the console output to ttyS0 if no
> keyboard & monitor is attached, all Linux kernel boot messages get lost.
> 
> Avoid this problem by ignoring the AUX port. There is no external serial
> port connector for AUX, so we won't miss this serial port either.
> 
> Tested on a rp3410 parisc machine.

I will drop this patch.
Instead I've committed changes to the palo bootloader
to default to ttyS1 on rp34x0 machines.
Patch is in palo git tree, palo v1.98 release will include that fix:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git/commit/?id=9bb40b5ab775a077fd847c6ff99462249cc3f426

Helge

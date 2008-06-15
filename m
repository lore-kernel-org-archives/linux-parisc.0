From: Adrian Bunk <bunk@kernel.org>
Subject: parisc: pcibios_init_bus() isn't called
Date: Sun, 15 Jun 2008 19:13:27 +0300
Message-ID: <20080615161327.GC7865@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758488AbYFOQPW@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

arch/parisc/kernel/pci.c:pcibios_init_bus() never gets called - this
doesn't seem to be intentionally?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

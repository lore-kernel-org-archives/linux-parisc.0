From: Helge Deller <deller@gmx.de>
Subject: Re: kernel 4.15.7/64bit, C3600 is unstable during heavy I/O on PCI
Date: Sat, 17 Mar 2018 12:36:55 +0100
Message-ID: <20180317113655.GA30572@ls3530.fritz.box>
References: <CA+QBN9DxM5PYCnPJCRtgxQ8xGk75=jAtsE+VibUfFOv+Yah6Og@mail.gmail.com>
 <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org
To: Carlo Pisani <carlojpisani@gmail.com>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
Resent-Message-ID: <p57-qQSkOwB.A.rO.o3PraB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20180317113655.GA30572@ls3530.fritz.box

* Carlo Pisani <carlojpisani@gmail.com>:
> I have created and applied the following patch
> testing the kernel with heavy I/O seems now stable
> 
> my C3600 is still under testing, moving chunks of 500Mbyte and compiling gcc-v6
> 
> 
> http://93.55.217.0//wonderland/chunk_of/user/ivelegacy/happa-dev/hppa2_0001_HPMC_fix_my_v1.patch

--- drivers/parisc/lba_pci.c	2018-01-28 22:20:33.000000000 +0100
+++ drivers/parisc/lba_pci.c	2018-03-15 12:26:44.839894952 +0100
@@ -1405,7 +1405,7 @@
 
 	/* Set HF mode as the default (vs. -1 mode). */
         stat = READ_REG32(d->hba.base_addr + LBA_STAT_CTL);
-	WRITE_REG32(stat | HF_ENABLE, d->hba.base_addr + LBA_STAT_CTL);
+	WRITE_REG32(stat & ~HF_ENABLE, d->hba.base_addr + LBA_STAT_CTL);
 
 	/*
 	** Writing a zero to STAT_CTL.rf (bit 0) will clear reset signal

That's the patch from Kyle:
https://www.spinics.net/lists/linux-parisc/msg01027.html

which comes out of this mail thread:
https://www.spinics.net/lists/linux-parisc/msg01024.html
specifically with those notes:
https://www.spinics.net/lists/linux-parisc/msg01026.html

Citing here:
"bus timeout" usually means we tried to read an address that doesn't
respond. that is, nothing on the bus accepted the transaction for it,
so it timed out and HPMC'd the box.

what you really need is the IIR, and the address it tried to access
(both the kernel vaddr which will be in the register, and the "system
requester address" from the hpmc dump which will be the physical address
mapped.

not sure why the hpmc handler is getting skipped, that's a little weird.

you can try hacking elroy to set softfail mode on that bus, which will
result in a timeout on the pci bus to return -1 (like what x86 and most
other architectures do) rather than hang the box, but it really likely
means a driver bug.



So, you change LBA to return -1 instead of faulting via HPMC which is
of course one work-around to avoid the HPMC.

But could you try to check the driver instead?

You run this SATA controller:
01:05.0 RAID bus controller: VIA Technologies, Inc. VT6421 IDE RAID

Can you maybe try to localize where in the drivers/ata/sata_via.c driver
triggers the HPMC ?


--- arch/parisc/kernel/hpmc.S	2018-01-28 22:20:33.000000000 +0100
+++ arch/parisc/kernel/hpmc.S	2018-03-15 14:13:46.611969815 +0100
@@ -308,4 +290,5 @@
 	.align 4
 	.export os_hpmc_size
 os_hpmc_size:
-	.word .os_hpmc_end-.os_hpmc
+	/* .word .os_hpmc_end-.os_hpmc */
+	.word (.os_hpmc_end - .os_hpmc) * 4 /* sizeof(u32) */

This one seems wrong.
I think you just didn't hit a HPMC with your first patch, and as such
this patch has no influence...

Helge

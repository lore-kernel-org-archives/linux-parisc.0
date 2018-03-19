From: Helge Deller <deller@gmx.de>
Subject: [RFC][PATCH] Fix HPMC handler by increasing size to multiple of 16
 bytes
Date: Mon, 19 Mar 2018 23:23:53 +0100
Message-ID: <20180319222353.GA28132@ls3530.fritz.box>
References: <CA+QBN9DxM5PYCnPJCRtgxQ8xGk75=jAtsE+VibUfFOv+Yah6Og@mail.gmail.com>
 <CA+QBN9D9vUA7Q=Sd=moi+bSAkQjGQ6nGa8wnb1=7qHudAY8L8g@mail.gmail.com>
 <20180317113655.GA30572@ls3530.fritz.box>
 <81f118a7-5bc5-c6b2-eb10-a9c683c72a26@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <81f118a7-5bc5-c6b2-eb10-a9c683c72a26@bell.net>
Resent-Message-ID: <WA3GnTD4HjI.A.pmE.NiDsaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20180319222353.GA28132@ls3530.fritz.box

* John David Anglin <dave.anglin@bell.net>:
> On 2018-03-17 7:36 AM, Helge Deller wrote:
> > Can you maybe try to localize where in the drivers/ata/sata_via.c driver
> > triggers the HPMC ?
> > 
> > 
> > --- arch/parisc/kernel/hpmc.S	2018-01-28 22:20:33.000000000 +0100
> > +++ arch/parisc/kernel/hpmc.S	2018-03-15 14:13:46.611969815 +0100
> > @@ -308,4 +290,5 @@
> >   	.align 4
> >   	.export os_hpmc_size
> >   os_hpmc_size:
> > -	.word .os_hpmc_end-.os_hpmc
> > +	/* .word .os_hpmc_end-.os_hpmc */
> > +	.word (.os_hpmc_end - .os_hpmc) * 4 /* sizeof(u32) */
> > 
> > This one seems wrong.
> > I think you just didn't hit a HPMC with your first patch, and as such
> > this patch has no influence...

> Helge, did you check that os_hpmc is correctly entered after you added
> the ".align 4" statement (e.g., trigger hpmc by accessing page 0 or
> such)?  I looked at one of my builds and the size is correct as is. 
> Is it possible that the length needs to be a multiple of 16?  Current
> length is 0x194.

Good point. I changed that in the patch below.

> There are a couple of minor issues with assembly code.  There are no .type
> and .size directives for os_hpmc_size.

Fixed as well.

> I think we should investigate further as I have never seen hpmc
> handler entered on rp3440 or c8000.  On rp3440, there are messages
> about the branch failing in the SL log.  However, this might have been
> fixed by your alignment fix. 

No, the problem still exists in existing code.

Below patch is build-tested only.


[PATCH] Fix HPMC handler by increasing size to multiple of 16 bytes

Make sure that the HPMC handler is 16-byte aligned and that it's length
in the IVT is a multiple of 16 bytes. Otherwise PDC may decide not
to jump to HPMC handler.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 8d072c44f300..f09f54f8042e 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -84,6 +84,7 @@ END(hpmc_pim_data)
 	.text
 
 	.import intr_save, code
+	.align 16
 ENTRY_CFI(os_hpmc)
 .os_hpmc:
 
@@ -305,7 +306,9 @@ ENDPROC_CFI(os_hpmc)
 
 
 	__INITRODATA
+.globl os_hpmc_size
 	.align 4
-	.export os_hpmc_size
+	.type   os_hpmc_size, @object
+	.size   os_hpmc_size, 4
 os_hpmc_size:
 	.word .os_hpmc_end-.os_hpmc
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index c919e6c0a687..ca6e8722fffb 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -837,8 +837,8 @@ void __init initialize_ivt(const void *iva)
 		ivap[0] = instr;
 
 	/* Compute Checksum for HPMC handler */
-	length = os_hpmc_size;
-	ivap[7] = length;
+	length = ALIGN(os_hpmc_size, 16);
+	ivap[7] = length; /* length needs to be multiple of 16. */
 
 	hpmcp = (u32 *)os_hpmc;
 

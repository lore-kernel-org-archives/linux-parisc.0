Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB1194854
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 21 Apr 2004 04:10:39 -0600 (MDT)
Date: Wed, 21 Apr 2004 12:08:41 +0200
Message-ID: <40711E560000A21D@ocpmta1.freegates.net>
In-Reply-To: <1082306164.2195.27.camel@mulgrave>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20Re=3A=20kernel=3E=3D2=2E6=2E4=2Drc3=20hung=20or=20panic=20on=20C1=5B18=5D0=09=5Bwas=3A=202=2E6=2E5=2Drc2=2Dpa2=20boot=20panic=20on=20c110=20=3A=28=5D?=
To: "James Bottomley" <James.Bottomley@steeleye.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="========/40711E560000A21D/mail.tiscali.be"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	Andy Walker <ajwalker@broadpark.no>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--========/40711E560000A21D/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

> > 
> > On Sun, 2004-04-18 at 09:39, Joel Soete wrote:
> > I presume that wrong stuff come from the ccio_fill_pdir() or ccio_coalesce_chunks()
merge with lba one?
> > But I don't have yet more accurate idea on what went wrong here (difference
between functions are important).

My abd: I effectively analyse the differences between those function and
their nes release and there are few

> > 
> > (would it help to rebuild this same kernel tree with gcc-3.0 32bit would
help? right now is was build with latest gcc-3.3.3.)
> > 

> Well, actually, the problem can't be in the code you cite, otherwise my
> raven wouldn't work either and it's been fine.
> 

So why reverting only this stuff make kernel works? The idea is in this hunck:
@@ -1708,6 +1556,7 @@
                                        proc_runway_root, ccio_resource_map,
NULL);
         }
         parisc_vmerge_boundary = IOVP_SIZE;
+ parisc_vmerge_max_size = BITS_PER_LONG * IOVP_SIZE;
         ioc_count++;
         return 0;
  }

Reverting this, let parisc_vmerge_max_size = 0 as initialized in gsc.c (it
is confirm by adding some printk() in ll_rw_blk and bio code) this btw confirms
your idea.

Learning so ncr53c8xx code, I found small trivial patches:
diff -NaurX dontdiff linux-2.6.6-rc1-pa0.orig/drivers/parisc/ccio-dma.c linux-2.6.6-rc1-pa0/drivers/parisc/ccio-dma.c
--- linux-2.6.6-rc1-pa0.orig/drivers/parisc/ccio-dma.c	2004-03-16 16:40:23.000000000
+0100
+++ linux-2.6.6-rc1-pa0/drivers/parisc/ccio-dma.c	2004-04-21 10:32:11.000000000
+0200
@@ -441,7 +447,7 @@
 	BUG_ON((pages_mapped * IOVP_SIZE) > DMA_CHUNK_SIZE);
 	BUG_ON(pages_mapped > BITS_PER_LONG);
 
-	DBG_RES("%s():  res_idx: %d pages_mapped %d\n", 
+	DBG_RES("%s():  res_idx: %d pages_mapped %ld\n", 
 		__FUNCTION__, res_idx, pages_mapped);
 
 #ifdef CCIO_MAP_STATS
@@ -766,7 +772,7 @@
 
 	pdir_start = &(ioc->pdir_base[idx]);
 
-	DBG_RUN("%s() 0x%p -> 0x%lx size: %0x%x\n",
+	DBG_RUN("%s() 0x%p -> 0x%lx size: 0x%x\n",
 		__FUNCTION__, addr, (long)iovp | offset, size);
 
 	/* If not cacheline aligned, force SAFE_DMA on the whole mess */
diff -NaurX dontdiff linux-2.6.6-rc1-pa0.orig/drivers/parisc/iommu-helpers.h
linux-2.6.6-rc1-pa0/drivers/parisc/iommu-helpers.h
--- linux-2.6.6-rc1-pa0.orig/drivers/parisc/iommu-helpers.h	2004-03-12 17:37:31.000000000
+0100
+++ linux-2.6.6-rc1-pa0/drivers/parisc/iommu-helpers.h	2004-04-21 10:46:33.000000000
+0200
@@ -22,14 +22,15 @@
 	/* Horrible hack.  For efficiency's sake, dma_sg starts one 
 	 * entry below the true start (it is immediately incremented
 	 * in the loop) */
-	 dma_sg--;
+	dma_sg--;
 
 	while (nents-- > 0) {
 		unsigned long vaddr;
 		long size;
 
 		DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
-			   (unsigned long)sg_dma_address(startsg), cnt,
+			   (unsigned long)sg_dma_address(startsg),
+			   sg_dma_len(startsg),
 			   sg_virt_addr(startsg), startsg->length
 		);
 
diff -NaurX dontdiff linux-2.6.6-rc1-pa0.orig/drivers/scsi/ncr53c8xx.c linux-2.6.6-rc1-pa0/drivers/scsi/ncr53c8xx.c
--- linux-2.6.6-rc1-pa0.orig/drivers/scsi/ncr53c8xx.c	2004-03-16 16:40:24.000000000
+0100
+++ linux-2.6.6-rc1-pa0/drivers/scsi/ncr53c8xx.c	2004-04-21 11:11:06.855459160
+0200
@@ -3710,11 +3710,11 @@
 **
 **==========================================================
 */
-static int ncr_queue_command (struct ncb *np, struct scsi_cmnd *cmd)
+static int ncr_queue_command(struct ncb *np, struct scsi_cmnd *cmd)
 {
 /*	struct scsi_device        *device    = cmd->device; */
-	struct tcb *tp                      = &np->target[cmd->device->id];
-	struct lcb *lp		      = tp->lp[cmd->device->lun];
+	struct tcb *tp		= &np->target[cmd->device->id];
+	struct lcb *lp		= tp->lp[cmd->device->lun];
 	struct ccb *cp;
 
 	int	segments;
@@ -8604,8 +8604,8 @@
 					int unit, struct ncr_device *device)
 {
 	struct host_data *host_data;
-	struct ncb *np = 0;
-	struct Scsi_Host *instance = 0;
+	struct ncb *np = NULL;
+	struct Scsi_Host *instance = NULL;
 	u_long flags = 0;
 	int i;
================================================================================

Is that possible that you ci (i don't have cvs write access).

Thanks in advance,
    Joel

PS: As usual because of wrapping pb of my interface, I also attached the
diff file ;)


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr




--========/40711E560000A21D/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="2.6.6-rc1-pa0.diff"

ZGlmZiAtTmF1clggZG9udGRpZmYgbGludXgtMi42LjYtcmMxLXBhMC5vcmlnL2RyaXZlcnMvcGFy
aXNjL2NjaW8tZG1hLmMgbGludXgtMi42LjYtcmMxLXBhMC9kcml2ZXJzL3BhcmlzYy9jY2lvLWRt
YS5jCi0tLSBsaW51eC0yLjYuNi1yYzEtcGEwLm9yaWcvZHJpdmVycy9wYXJpc2MvY2Npby1kbWEu
YwkyMDA0LTAzLTE2IDE2OjQwOjIzLjAwMDAwMDAwMCArMDEwMAorKysgbGludXgtMi42LjYtcmMx
LXBhMC9kcml2ZXJzL3BhcmlzYy9jY2lvLWRtYS5jCTIwMDQtMDQtMjEgMTA6MzI6MTEuMDAwMDAw
MDAwICswMjAwCkBAIC00NDEsNyArNDQ3LDcgQEAKIAlCVUdfT04oKHBhZ2VzX21hcHBlZCAqIElP
VlBfU0laRSkgPiBETUFfQ0hVTktfU0laRSk7CiAJQlVHX09OKHBhZ2VzX21hcHBlZCA+IEJJVFNf
UEVSX0xPTkcpOwogCi0JREJHX1JFUygiJXMoKTogIHJlc19pZHg6ICVkIHBhZ2VzX21hcHBlZCAl
ZFxuIiwgCisJREJHX1JFUygiJXMoKTogIHJlc19pZHg6ICVkIHBhZ2VzX21hcHBlZCAlbGRcbiIs
IAogCQlfX0ZVTkNUSU9OX18sIHJlc19pZHgsIHBhZ2VzX21hcHBlZCk7CiAKICNpZmRlZiBDQ0lP
X01BUF9TVEFUUwpAQCAtNzY2LDcgKzc3Miw3IEBACiAKIAlwZGlyX3N0YXJ0ID0gJihpb2MtPnBk
aXJfYmFzZVtpZHhdKTsKIAotCURCR19SVU4oIiVzKCkgMHglcCAtPiAweCVseCBzaXplOiAlMHgl
eFxuIiwKKwlEQkdfUlVOKCIlcygpIDB4JXAgLT4gMHglbHggc2l6ZTogMHgleFxuIiwKIAkJX19G
VU5DVElPTl9fLCBhZGRyLCAobG9uZylpb3ZwIHwgb2Zmc2V0LCBzaXplKTsKIAogCS8qIElmIG5v
dCBjYWNoZWxpbmUgYWxpZ25lZCwgZm9yY2UgU0FGRV9ETUEgb24gdGhlIHdob2xlIG1lc3MgKi8K
ZGlmZiAtTmF1clggZG9udGRpZmYgbGludXgtMi42LjYtcmMxLXBhMC5vcmlnL2RyaXZlcnMvcGFy
aXNjL2lvbW11LWhlbHBlcnMuaCBsaW51eC0yLjYuNi1yYzEtcGEwL2RyaXZlcnMvcGFyaXNjL2lv
bW11LWhlbHBlcnMuaAotLS0gbGludXgtMi42LjYtcmMxLXBhMC5vcmlnL2RyaXZlcnMvcGFyaXNj
L2lvbW11LWhlbHBlcnMuaAkyMDA0LTAzLTEyIDE3OjM3OjMxLjAwMDAwMDAwMCArMDEwMAorKysg
bGludXgtMi42LjYtcmMxLXBhMC9kcml2ZXJzL3BhcmlzYy9pb21tdS1oZWxwZXJzLmgJMjAwNC0w
NC0yMSAxMDo0NjozMy4wMDAwMDAwMDAgKzAyMDAKQEAgLTIyLDE0ICsyMiwxNSBAQAogCS8qIEhv
cnJpYmxlIGhhY2suICBGb3IgZWZmaWNpZW5jeSdzIHNha2UsIGRtYV9zZyBzdGFydHMgb25lIAog
CSAqIGVudHJ5IGJlbG93IHRoZSB0cnVlIHN0YXJ0IChpdCBpcyBpbW1lZGlhdGVseSBpbmNyZW1l
bnRlZAogCSAqIGluIHRoZSBsb29wKSAqLwotCSBkbWFfc2ctLTsKKwlkbWFfc2ctLTsKIAogCXdo
aWxlIChuZW50cy0tID4gMCkgewogCQl1bnNpZ25lZCBsb25nIHZhZGRyOwogCQlsb25nIHNpemU7
CiAKIAkJREJHX1JVTl9TRygiICVkIDogJTA4bHgvJTA1eCAlMDhseC8lMDV4XG4iLCBuZW50cywK
LQkJCSAgICh1bnNpZ25lZCBsb25nKXNnX2RtYV9hZGRyZXNzKHN0YXJ0c2cpLCBjbnQsCisJCQkg
ICAodW5zaWduZWQgbG9uZylzZ19kbWFfYWRkcmVzcyhzdGFydHNnKSwKKwkJCSAgIHNnX2RtYV9s
ZW4oc3RhcnRzZyksCiAJCQkgICBzZ192aXJ0X2FkZHIoc3RhcnRzZyksIHN0YXJ0c2ctPmxlbmd0
aAogCQkpOwogCmRpZmYgLU5hdXJYIGRvbnRkaWZmIGxpbnV4LTIuNi42LXJjMS1wYTAub3JpZy9k
cml2ZXJzL3Njc2kvbmNyNTNjOHh4LmMgbGludXgtMi42LjYtcmMxLXBhMC9kcml2ZXJzL3Njc2kv
bmNyNTNjOHh4LmMKLS0tIGxpbnV4LTIuNi42LXJjMS1wYTAub3JpZy9kcml2ZXJzL3Njc2kvbmNy
NTNjOHh4LmMJMjAwNC0wMy0xNiAxNjo0MDoyNC4wMDAwMDAwMDAgKzAxMDAKKysrIGxpbnV4LTIu
Ni42LXJjMS1wYTAvZHJpdmVycy9zY3NpL25jcjUzYzh4eC5jCTIwMDQtMDQtMjEgMTE6MTE6MDYu
ODU1NDU5MTYwICswMjAwCkBAIC0zNzEwLDExICszNzEwLDExIEBACiAqKgogKio9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAqLwotc3Rh
dGljIGludCBuY3JfcXVldWVfY29tbWFuZCAoc3RydWN0IG5jYiAqbnAsIHN0cnVjdCBzY3NpX2Nt
bmQgKmNtZCkKK3N0YXRpYyBpbnQgbmNyX3F1ZXVlX2NvbW1hbmQoc3RydWN0IG5jYiAqbnAsIHN0
cnVjdCBzY3NpX2NtbmQgKmNtZCkKIHsKIC8qCXN0cnVjdCBzY3NpX2RldmljZSAgICAgICAgKmRl
dmljZSAgICA9IGNtZC0+ZGV2aWNlOyAqLwotCXN0cnVjdCB0Y2IgKnRwICAgICAgICAgICAgICAg
ICAgICAgID0gJm5wLT50YXJnZXRbY21kLT5kZXZpY2UtPmlkXTsKLQlzdHJ1Y3QgbGNiICpscAkJ
ICAgICAgPSB0cC0+bHBbY21kLT5kZXZpY2UtPmx1bl07CisJc3RydWN0IHRjYiAqdHAJCT0gJm5w
LT50YXJnZXRbY21kLT5kZXZpY2UtPmlkXTsKKwlzdHJ1Y3QgbGNiICpscAkJPSB0cC0+bHBbY21k
LT5kZXZpY2UtPmx1bl07CiAJc3RydWN0IGNjYiAqY3A7CiAKIAlpbnQJc2VnbWVudHM7CkBAIC04
NjA0LDggKzg2MDQsOCBAQAogCQkJCQlpbnQgdW5pdCwgc3RydWN0IG5jcl9kZXZpY2UgKmRldmlj
ZSkKIHsKIAlzdHJ1Y3QgaG9zdF9kYXRhICpob3N0X2RhdGE7Ci0Jc3RydWN0IG5jYiAqbnAgPSAw
OwotCXN0cnVjdCBTY3NpX0hvc3QgKmluc3RhbmNlID0gMDsKKwlzdHJ1Y3QgbmNiICpucCA9IE5V
TEw7CisJc3RydWN0IFNjc2lfSG9zdCAqaW5zdGFuY2UgPSBOVUxMOwogCXVfbG9uZyBmbGFncyA9
IDA7CiAJaW50IGk7CiAK

--========/40711E560000A21D/mail.tiscali.be--

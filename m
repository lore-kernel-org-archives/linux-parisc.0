Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0354F4852
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 17 Mar 2004 07:20:45 -0700 (MST)
Date: Wed, 17 Mar 2004 15:20:38 +0100
Message-ID: <40561E950000172D@ocpmta3.freegates.net>
In-Reply-To: <20040317121538.GE25059@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] SCSI broken in latest CVS changes
To: "Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="========/40561E950000172D/mail.tiscali.be"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--========/40561E950000172D/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

oops my very bad, I just figure out that I also include the following patch
from upstream (which seems to be missed but may be there was a good reason?):
diff -Nru a/include/asm-parisc/dma-mapping.h b/include/asm-parisc/dma-mapping.h
--- a/include/asm-parisc/dma-mapping.h	Mon Mar 15 21:48:01 2004
+++ b/include/asm-parisc/dma-mapping.h	Mon Mar 15 21:48:01 2004
@@ -15,8 +15,10 @@
 	void (*unmap_single)(struct device *dev, dma_addr_t iova, size_t size,
enum dma_data_direction direction);
 	int  (*map_sg)(struct device *dev, struct scatterlist *sg, int nents, enum
dma_data_direction direction);
 	void (*unmap_sg)(struct device *dev, struct scatterlist *sg, int nhwents,
enum dma_data_direction direction);
-	void (*dma_sync_single)(struct device *dev, dma_addr_t iova, unsigned long
offset, size_t size, enum dma_data_direction direction);
-	void (*dma_sync_sg)(struct device *dev, struct scatterlist *sg, int nelems,
enum dma_data_direction direction);
+	void (*dma_sync_single_for_cpu)(struct device *dev, dma_addr_t iova, unsigned
long offset, size_t size, enum dma_data_direction direction);
+	void (*dma_sync_single_for_device)(struct device *dev, dma_addr_t iova,
unsigned long offset, size_t size, enum dma_data_direction direction);
+	void (*dma_sync_sg_for_cpu)(struct device *dev, struct scatterlist *sg,
int nelems, enum dma_data_direction direction);
+	void (*dma_sync_sg_for_device)(struct device *dev, struct scatterlist *sg,
int nelems, enum dma_data_direction direction);
 };
 
 /*
@@ -116,28 +118,53 @@
 
 
 static inline void
-dma_sync_single(struct device *dev, dma_addr_t dma_handle, size_t size,
+dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle, size_t
size,
 		enum dma_data_direction direction)
 {
-	if(hppa_dma_ops->dma_sync_single)
-		hppa_dma_ops->dma_sync_single(dev, dma_handle, 0, size, direction);
+	if(hppa_dma_ops->dma_sync_single_for_cpu)
+		hppa_dma_ops->dma_sync_single_for_cpu(dev, dma_handle, 0, size, direction);
 }
 
 static inline void
-dma_sync_single_range(struct device *dev, dma_addr_t dma_handle,
+dma_sync_single_for_device(struct device *dev, dma_addr_t dma_handle, size_t
size,
+		enum dma_data_direction direction)
+{
+	if(hppa_dma_ops->dma_sync_single_for_device)
+		hppa_dma_ops->dma_sync_single_for_device(dev, dma_handle, 0, size, direction);
+}
+
+static inline void
+dma_sync_single_range_for_cpu(struct device *dev, dma_addr_t dma_handle,
+		      unsigned long offset, size_t size,
+		      enum dma_data_direction direction)
+{
+	if(hppa_dma_ops->dma_sync_single_for_cpu)
+		hppa_dma_ops->dma_sync_single_for_cpu(dev, dma_handle, offset, size, direction);
+}
+
+static inline void
+dma_sync_single_range_for_device(struct device *dev, dma_addr_t dma_handle,
 		      unsigned long offset, size_t size,
 		      enum dma_data_direction direction)
 {
-	if(hppa_dma_ops->dma_sync_single)
-		hppa_dma_ops->dma_sync_single(dev, dma_handle, offset, size, direction);
+	if(hppa_dma_ops->dma_sync_single_for_device)
+		hppa_dma_ops->dma_sync_single_for_device(dev, dma_handle, offset, size,
direction);
+}
+
+static inline void
+dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg, int nelems,
+		 enum dma_data_direction direction)
+{
+	if(hppa_dma_ops->dma_sync_sg_for_cpu)
+		hppa_dma_ops->dma_sync_sg_for_cpu(dev, sg, nelems, direction);
 }
 
 static inline void
-dma_sync_sg(struct device *dev, struct scatterlist *sg, int nelems,
+dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg, int nelems,
 		 enum dma_data_direction direction)
 {
-	if(hppa_dma_ops->dma_sync_sg)
-		hppa_dma_ops->dma_sync_sg(dev, sg, nelems, direction);
+	if(hppa_dma_ops->dma_sync_sg_for_device)
+		hppa_dma_ops->dma_sync_sg_for_device(dev, sg, nelems, direction);
 }
 
 static inline int
@@ -166,14 +193,14 @@
 static inline int
 dma_is_consistent(dma_addr_t dma_addr)
 {
-	return (hppa_dma_ops->dma_sync_single == NULL);
+	return (hppa_dma_ops->dma_sync_single_for_cpu == NULL);
 }
 
 static inline void
 dma_cache_sync(void *vaddr, size_t size,
 	       enum dma_data_direction direction)
 {
-	if(hppa_dma_ops->dma_sync_single)
+	if(hppa_dma_ops->dma_sync_single_for_cpu)
 		flush_kernel_dcache_range((unsigned long)vaddr, size);
 }
========><========

Sorry,
    joel

ps: see attachement if bad wrapping of my webmail

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr




--========/40561E950000172D/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="include_asm-parisc_dma-mapping.h.patch"

ZGlmZiAtTnJ1IGEvaW5jbHVkZS9hc20tcGFyaXNjL2RtYS1tYXBwaW5nLmggYi9pbmNsdWRlL2Fz
bS1wYXJpc2MvZG1hLW1hcHBpbmcuaAotLS0gYS9pbmNsdWRlL2FzbS1wYXJpc2MvZG1hLW1hcHBp
bmcuaAlNb24gTWFyIDE1IDIxOjQ4OjAxIDIwMDQKKysrIGIvaW5jbHVkZS9hc20tcGFyaXNjL2Rt
YS1tYXBwaW5nLmgJTW9uIE1hciAxNSAyMTo0ODowMSAyMDA0CkBAIC0xNSw4ICsxNSwxMCBAQAog
CXZvaWQgKCp1bm1hcF9zaW5nbGUpKHN0cnVjdCBkZXZpY2UgKmRldiwgZG1hX2FkZHJfdCBpb3Zh
LCBzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKTsKIAlpbnQg
ICgqbWFwX3NnKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2csIGlu
dCBuZW50cywgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKTsKIAl2b2lkICgqdW5t
YXBfc2cpKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZywgaW50IG5o
d2VudHMsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbik7Ci0Jdm9pZCAoKmRtYV9z
eW5jX3NpbmdsZSkoc3RydWN0IGRldmljZSAqZGV2LCBkbWFfYWRkcl90IGlvdmEsIHVuc2lnbmVk
IGxvbmcgb2Zmc2V0LCBzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0
aW9uKTsKLQl2b2lkICgqZG1hX3N5bmNfc2cpKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNj
YXR0ZXJsaXN0ICpzZywgaW50IG5lbGVtcywgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0
aW9uKTsKKwl2b2lkICgqZG1hX3N5bmNfc2luZ2xlX2Zvcl9jcHUpKHN0cnVjdCBkZXZpY2UgKmRl
diwgZG1hX2FkZHJfdCBpb3ZhLCB1bnNpZ25lZCBsb25nIG9mZnNldCwgc2l6ZV90IHNpemUsIGVu
dW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbik7CisJdm9pZCAoKmRtYV9zeW5jX3Npbmds
ZV9mb3JfZGV2aWNlKShzdHJ1Y3QgZGV2aWNlICpkZXYsIGRtYV9hZGRyX3QgaW92YSwgdW5zaWdu
ZWQgbG9uZyBvZmZzZXQsIHNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJl
Y3Rpb24pOworCXZvaWQgKCpkbWFfc3luY19zZ19mb3JfY3B1KShzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBzY2F0dGVybGlzdCAqc2csIGludCBuZWxlbXMsIGVudW0gZG1hX2RhdGFfZGlyZWN0
aW9uIGRpcmVjdGlvbik7CisJdm9pZCAoKmRtYV9zeW5jX3NnX2Zvcl9kZXZpY2UpKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZywgaW50IG5lbGVtcywgZW51bSBkbWFf
ZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKTsKIH07CiAKIC8qCkBAIC0xMTYsMjggKzExOCw1MyBA
QAogCiAKIHN0YXRpYyBpbmxpbmUgdm9pZAotZG1hX3N5bmNfc2luZ2xlKHN0cnVjdCBkZXZpY2Ug
KmRldiwgZG1hX2FkZHJfdCBkbWFfaGFuZGxlLCBzaXplX3Qgc2l6ZSwKK2RtYV9zeW5jX3Npbmds
ZV9mb3JfY3B1KHN0cnVjdCBkZXZpY2UgKmRldiwgZG1hX2FkZHJfdCBkbWFfaGFuZGxlLCBzaXpl
X3Qgc2l6ZSwKIAkJZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQogewotCWlmKGhw
cGFfZG1hX29wcy0+ZG1hX3N5bmNfc2luZ2xlKQotCQlocHBhX2RtYV9vcHMtPmRtYV9zeW5jX3Np
bmdsZShkZXYsIGRtYV9oYW5kbGUsIDAsIHNpemUsIGRpcmVjdGlvbik7CisJaWYoaHBwYV9kbWFf
b3BzLT5kbWFfc3luY19zaW5nbGVfZm9yX2NwdSkKKwkJaHBwYV9kbWFfb3BzLT5kbWFfc3luY19z
aW5nbGVfZm9yX2NwdShkZXYsIGRtYV9oYW5kbGUsIDAsIHNpemUsIGRpcmVjdGlvbik7CiB9CiAK
IHN0YXRpYyBpbmxpbmUgdm9pZAotZG1hX3N5bmNfc2luZ2xlX3JhbmdlKHN0cnVjdCBkZXZpY2Ug
KmRldiwgZG1hX2FkZHJfdCBkbWFfaGFuZGxlLAorZG1hX3N5bmNfc2luZ2xlX2Zvcl9kZXZpY2Uo
c3RydWN0IGRldmljZSAqZGV2LCBkbWFfYWRkcl90IGRtYV9oYW5kbGUsIHNpemVfdCBzaXplLAor
CQllbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pCit7CisJaWYoaHBwYV9kbWFfb3Bz
LT5kbWFfc3luY19zaW5nbGVfZm9yX2RldmljZSkKKwkJaHBwYV9kbWFfb3BzLT5kbWFfc3luY19z
aW5nbGVfZm9yX2RldmljZShkZXYsIGRtYV9oYW5kbGUsIDAsIHNpemUsIGRpcmVjdGlvbik7Cit9
CisKK3N0YXRpYyBpbmxpbmUgdm9pZAorZG1hX3N5bmNfc2luZ2xlX3JhbmdlX2Zvcl9jcHUoc3Ry
dWN0IGRldmljZSAqZGV2LCBkbWFfYWRkcl90IGRtYV9oYW5kbGUsCisJCSAgICAgIHVuc2lnbmVk
IGxvbmcgb2Zmc2V0LCBzaXplX3Qgc2l6ZSwKKwkJICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rp
b24gZGlyZWN0aW9uKQoreworCWlmKGhwcGFfZG1hX29wcy0+ZG1hX3N5bmNfc2luZ2xlX2Zvcl9j
cHUpCisJCWhwcGFfZG1hX29wcy0+ZG1hX3N5bmNfc2luZ2xlX2Zvcl9jcHUoZGV2LCBkbWFfaGFu
ZGxlLCBvZmZzZXQsIHNpemUsIGRpcmVjdGlvbik7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZAor
ZG1hX3N5bmNfc2luZ2xlX3JhbmdlX2Zvcl9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2LCBkbWFf
YWRkcl90IGRtYV9oYW5kbGUsCiAJCSAgICAgIHVuc2lnbmVkIGxvbmcgb2Zmc2V0LCBzaXplX3Qg
c2l6ZSwKIAkJICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQogewotCWlm
KGhwcGFfZG1hX29wcy0+ZG1hX3N5bmNfc2luZ2xlKQotCQlocHBhX2RtYV9vcHMtPmRtYV9zeW5j
X3NpbmdsZShkZXYsIGRtYV9oYW5kbGUsIG9mZnNldCwgc2l6ZSwgZGlyZWN0aW9uKTsKKwlpZiho
cHBhX2RtYV9vcHMtPmRtYV9zeW5jX3NpbmdsZV9mb3JfZGV2aWNlKQorCQlocHBhX2RtYV9vcHMt
PmRtYV9zeW5jX3NpbmdsZV9mb3JfZGV2aWNlKGRldiwgZG1hX2hhbmRsZSwgb2Zmc2V0LCBzaXpl
LCBkaXJlY3Rpb24pOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQKK2RtYV9zeW5jX3NnX2Zvcl9j
cHUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnLCBpbnQgbmVsZW1z
LAorCQkgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQoreworCWlmKGhw
cGFfZG1hX29wcy0+ZG1hX3N5bmNfc2dfZm9yX2NwdSkKKwkJaHBwYV9kbWFfb3BzLT5kbWFfc3lu
Y19zZ19mb3JfY3B1KGRldiwgc2csIG5lbGVtcywgZGlyZWN0aW9uKTsKIH0KIAogc3RhdGljIGlu
bGluZSB2b2lkCi1kbWFfc3luY19zZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzY2F0dGVy
bGlzdCAqc2csIGludCBuZWxlbXMsCitkbWFfc3luY19zZ19mb3JfZGV2aWNlKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZywgaW50IG5lbGVtcywKIAkJIGVudW0gZG1h
X2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbikKIHsKLQlpZihocHBhX2RtYV9vcHMtPmRtYV9zeW5j
X3NnKQotCQlocHBhX2RtYV9vcHMtPmRtYV9zeW5jX3NnKGRldiwgc2csIG5lbGVtcywgZGlyZWN0
aW9uKTsKKwlpZihocHBhX2RtYV9vcHMtPmRtYV9zeW5jX3NnX2Zvcl9kZXZpY2UpCisJCWhwcGFf
ZG1hX29wcy0+ZG1hX3N5bmNfc2dfZm9yX2RldmljZShkZXYsIHNnLCBuZWxlbXMsIGRpcmVjdGlv
bik7CiB9CiAKIHN0YXRpYyBpbmxpbmUgaW50CkBAIC0xNjYsMTQgKzE5MywxNCBAQAogc3RhdGlj
IGlubGluZSBpbnQKIGRtYV9pc19jb25zaXN0ZW50KGRtYV9hZGRyX3QgZG1hX2FkZHIpCiB7Ci0J
cmV0dXJuIChocHBhX2RtYV9vcHMtPmRtYV9zeW5jX3NpbmdsZSA9PSBOVUxMKTsKKwlyZXR1cm4g
KGhwcGFfZG1hX29wcy0+ZG1hX3N5bmNfc2luZ2xlX2Zvcl9jcHUgPT0gTlVMTCk7CiB9CiAKIHN0
YXRpYyBpbmxpbmUgdm9pZAogZG1hX2NhY2hlX3N5bmModm9pZCAqdmFkZHIsIHNpemVfdCBzaXpl
LAogCSAgICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pCiB7Ci0JaWYoaHBw
YV9kbWFfb3BzLT5kbWFfc3luY19zaW5nbGUpCisJaWYoaHBwYV9kbWFfb3BzLT5kbWFfc3luY19z
aW5nbGVfZm9yX2NwdSkKIAkJZmx1c2hfa2VybmVsX2RjYWNoZV9yYW5nZSgodW5zaWduZWQgbG9u
Zyl2YWRkciwgc2l6ZSk7CiB9CiAK

--========/40561E950000172D/mail.tiscali.be--

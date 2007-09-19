From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] pdc.h header export
Date: Wed, 19 Sep 2007 15:35:28 -0700
Message-ID: <5b2e36650709191535m138a3398n7fe054b896c5bded__19501.1390060701$1416624443$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="----=_Part_22710_773733.1190241328928"
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

------=_Part_22710_773733.1190241328928
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Here's a first attempt at making an exported header for parisc, can
folks please look it over and tell me what other sorts of things I
should look for in cleaning a header up?

In this particular case, this is a header that has been cached inside
palo.  I've wrapped things that were in #ifndef __ASSEMBLER__ also in
#ifdef __KERNEL__ so that they don't get exported.  The exceptions
were things that palo was actually using.

Also, given that I don't use git that often, if there's something I
should be doing other than git diff and attaching the file, please let
me know. =)

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/

------=_Part_22710_773733.1190241328928
Content-Type: text/x-patch; name="pdc-header-parisc.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="pdc-header-parisc.diff"
X-Attachment-Id: f_f6sevgi2

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLXBhcmlzYy9LYnVpbGQgYi9pbmNsdWRlL2FzbS1wYXJp
c2MvS2J1aWxkCmluZGV4IGM2OGUxNjguLmY4OGIyNTIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNt
LXBhcmlzYy9LYnVpbGQKKysrIGIvaW5jbHVkZS9hc20tcGFyaXNjL0tidWlsZApAQCAtMSArMSwz
IEBACiBpbmNsdWRlIGluY2x1ZGUvYXNtLWdlbmVyaWMvS2J1aWxkLmFzbQorCit1bmlmZGVmLXkg
Kz0gcGRjLmgKZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLXBhcmlzYy9wZGMuaCBiL2luY2x1ZGUv
YXNtLXBhcmlzYy9wZGMuaAppbmRleCA4NzZmZDgxLi43NzU3MjZkIDEwMDY0NAotLS0gYS9pbmNs
dWRlL2FzbS1wYXJpc2MvcGRjLmgKKysrIGIvaW5jbHVkZS9hc20tcGFyaXNjL3BkYy5oCkBAIC0x
NDMsMTQgKzE0MywxNSBAQAogI2RlZmluZSBQRENfTUVNX1JFVF9QRFRfRlVMTAkJLTExCiAjZGVm
aW5lIFBEQ19NRU1fUkVUX0lOVkFMSURfUEhZU0lDQUxfTE9DQVRJT04gfjBVTEwKIAotI2lmbmRl
ZiBfX0FTU0VNQkxZX18KKyNpZmRlZiBfX0tFUk5FTF9fCisjIGlmbmRlZiBfX0FTU0VNQkxZX18K
IHR5cGVkZWYgc3RydWN0IHsKICAgICB1bnNpZ25lZCBsb25nIGxvbmcJYmFzZUFkZHI7CiAgICAg
dW5zaWduZWQgaW50CXBhZ2VzOwogICAgIHVuc2lnbmVkIGludAlyZXNlcnZlZDsKIH0gTWVtQWRk
clRhYmxlX3Q7Ci0jZW5kaWYKLQorIyBlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KKyNlbmRpZiAv
KiBfX0tFUk5FTF9fICovCiAKICNkZWZpbmUgUERDX1BTVwkJMjEJCS8qIEdldC9TZXQgZGVmYXVs
dCBTeXN0ZW0gTWFzayAgKi8KICNkZWZpbmUgUERDX1BTV19NQVNLCQkwCS8qIFJldHVybiBtYXNr
ICAgICAgICAgICAgICAgICAgKi8KQEAgLTI5Niw4ICsyOTcsMTEgQEAgdHlwZWRlZiBzdHJ1Y3Qg
ewogI2RlZmluZSBPU1RBVF9PTgkJNwogCiAjaWZuZGVmIF9fQVNTRU1CTFlfXwotCiAjaW5jbHVk
ZSA8bGludXgvdHlwZXMuaD4KKyNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KKworI2lmZGVmIF9f
S0VSTkVMX18KKyMgaWZuZGVmIF9fQVNTRU1CTFlfXwogCiBleHRlcm4gaW50IHBkY190eXBlOwog
CkBAIC01NTgsNyArNTYyLDggQEAgc3RydWN0IHBkY19ocG1jX3BpbV8yMCB7IC8qIFBEQ19QSU0g
Ki8KIAlfX3U2NCBmclszMl07CiB9OwogCi0jZW5kaWYgLyogX19BU1NFTUJMWV9fICovCisjIGVu
ZGlmIC8qIF9fQVNTRU1CTFlfXyAqLworI2VuZGlmIC8qIF9fS0VSTkVMX18gKi8KIAogLyogZmxh
Z3Mgb2YgdGhlIGRldmljZV9wYXRoIChzZWUgYmVsb3cpICovCiAjZGVmaW5lCVBGX0FVVE9CT09U
CTB4ODAKQEAgLTcwNyw2ICs3MTIsNyBAQCBzdHJ1Y3QgemVyb3BhZ2UgewogI2RlZmluZSBCT09U
X0NPTlNPTEVfU1BBX09GRlNFVCAgMHgzYzQKICNkZWZpbmUgQk9PVF9DT05TT0xFX1BBVEhfT0ZG
U0VUIDB4M2E4CiAKKyNpZmRlZiBfX0tFUk5FTF9fCiAjaWZuZGVmIF9fQVNTRU1CTFlfXwogdm9p
ZCBwZGNfY29uc29sZV9pbml0KHZvaWQpOwkvKiBpbiBwZGNfY29uc29sZS5jICovCiB2b2lkIHBk
Y19jb25zb2xlX3Jlc3RhcnQodm9pZCk7CkBAIC03ODYsNiArNzkyLDcgQEAgc3RhdGljIGlubGlu
ZSBjaGFyICogb3NfaWRfdG9fc3RyaW5nKHUxNiBvc19pZCkgewogCWRlZmF1bHQ6CXJldHVybiAi
VW5rbm93biI7CiAJfQogfQotI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLworIyBlbmRpZiAvKiBf
X0FTU0VNQkxZX18gKi8KKyNlbmRpZiAvKiBfX0tFUk5FTF9fICovCiAKICNlbmRpZiAvKiBfUEFS
SVNDX1BEQ19IICovCg==
------=_Part_22710_773733.1190241328928
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
------=_Part_22710_773733.1190241328928--

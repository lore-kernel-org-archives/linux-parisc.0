From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: PCI patch breaks boot on rp2470 (2xPA8700)
Date: Mon, 22 Feb 2010 18:25:59 -0500
Message-ID: <119aab441002221525m4595b37w875891cd8f95e633@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016e6d78553816212048038c137
Cc: Grant Grundler <grundler@google.com>,
	Matthew Wilcox <matthew@wil.cx>
To: Kyle McMartin <kyle@redhat.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--0016e6d78553816212048038c137
Content-Type: text/plain; charset=ISO-8859-1

Kyle,

I spent the weekend bisecting to determine which patch broke booting
from scsi on my rp2470.

This patch is the culprit:
~~~
ac1aa47b131416a6ff37eb1005a0a1d2541aad6c is the first bad commit
commit ac1aa47b131416a6ff37eb1005a0a1d2541aad6c
Author: Jesse Barnes <jbarnes@virtuousgeek.org>
Date:   Mon Oct 26 13:20:44 2009 -0700

    PCI: determine CLS more intelligently

    Till now, CLS has been determined either by arch code or as
    L1_CACHE_BYTES.  Only x86 and ia64 set CLS explicitly and x86 doesn't
    always get it right.  On most configurations, the chance is that
    firmware configures the correct value during boot.

    This patch makes pci_init() determine CLS by looking at what firmware
    has configured.  It scans all devices and if all non-zero values
    agree, the value is used.  If none is configured or there is a
    disagreement, pci_dfl_cache_line_size is used.  arch can set the dfl
    value (via PCI_CACHE_LINE_BYTES or pci_dfl_cache_line_size) or
    override the actual one.

    ia64, x86 and sparc64 updated to set the default cls instead of the
    actual one.

    While at it, declare pci_cache_line_size and pci_dfl_cache_line_size
    in pci.h and drop private declarations from arch code.

    Signed-off-by: Tejun Heo <tj@kernel.org>
    Acked-by: David Miller <davem@davemloft.net>
    Acked-by: Greg KH <gregkh@suse.de>
    Cc: Ingo Molnar <mingo@elte.hu>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Cc: Tony Luck <tony.luck@intel.com>
    Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>

:040000 040000 8b20ad60ed3e273b74bfb588dbea6948547e8de1
92498585770ca360c2716c0d3c55d5f4a37356a1 M     arch
:040000 040000 56d1abd61286dd303bb37c2002b699e526988f85
3f20bba2d1e107a80a738e3561fc0fa92e0c4024 M     drivers
:040000 040000 26d85393248c542ca2cea0e3ac4ceabd0ea659aa
326cbb98321cd4e490d888f48bc584b3662c8f06 M     include
~~~

Removing this patch allows my system to boot again.

The patch does something which is wrong IMO. It changes *when*
pci_cache_line_size is set from (a) initialized data to (b) a call to
pci_apply_final_quirks(...). There are several drivers which call
pci_try_set_mwi(...) and pci_set_mwi(...) which indirectly use of the
value of pci_cache_line_size, and the author of the patch doesn't make
any mention of having verified that the drivers don't call
pci_*_set_mwi(...) *before* pci_apply_final_quirks(...) is called.

Case in point the sym53c8xx driver does this:
~~~ drivers/scsi/sym53c8xx_2/sym_glue.c
static int __devinit sym_set_workarounds(struct sym_device *device)
        ...
        /* If the chip can do Memory Write Invalidate, enable it */
        if (chip->features & FE_WRIE) {
                if (pci_set_mwi(pdev))
                        return -ENODEV;
        }
        ...
~~~ drivers/pci/pci.c
int
pci_set_mwi(struct pci_dev *dev)
{
        int rc;
        u16 cmd;

        rc = pci_set_cacheline_size(dev);
        if (rc)
                return rc;
...
~~~ driver/pci/pci.c
int pci_set_cacheline_size(struct pci_dev *dev)
{
        u8 cacheline_size;

        if (!pci_cache_line_size)
                return -EINVAL;
...
~~~
Which means that if the driver calls pci_set_mwi() *before*
pci_apply_final_quirks() sets pci_cache_line_size, that it would
appear as if there are no devices.

To verify this I instrumented the PCI subsystem but my assumption
turns out not to be true:
~~~
PCI: pcibios_init set CLS.
...
PCI: CLS 64 bytes
...
pci_set_mwi begin
pci_set_cacheline_size: PCI_CLS is 16
pci_set_cacheline_size: Read CLS is 16
pci_set_mwi end
...
~~~
The ordering is correct.

The attached patch allows me to boot again by setting the PCI CLS to
64 early-on in pcibios_init().

I don't know *why* it works, what a shame, can anyone see something I've missed?

Cheers,
Carlos.

--0016e6d78553816212048038c137
Content-Type: text/x-diff; charset=US-ASCII; name="pcifix.diff"
Content-Disposition: attachment; filename="pcifix.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g5zwaw7h0

U3ViamVjdDogW1BBVENIXSBocHBhOiBTZXQgUENJIENMUyBlYXJseSBpbiBib290LgpGcm9tOiBD
YXJsb3MgTydEb25lbGwgPGNhcmxvc0Bjb2Rlc291cmNlcnkuY29tPgoKU2V0IHRoZSBQQ0kgQ0xT
IGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MgdG8gcHJldmVudApkZXZpY2UgZmFpbHVyZXMuIElu
IHBjaWJpb3Nfc2V0X21hc3RlciB1c2UgdGhlIG5ldyAKcGNpX2NhY2hlX2xpbmVfc2l6ZSBpbnN0
ZWFkIG9mIGEgaGFyZC1jb2RlZCB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IENhcmxvcyBPJ0RvbmVs
bCA8Y2FybG9zQGNvZGVzb3VyY2VyeS5jb20+CgotLS0KIGFyY2gvcGFyaXNjL2tlcm5lbC9wY2ku
YyB8ICAgIDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2tlcm5lbC9wY2kuYyBiL2FyY2gv
cGFyaXNjL2tlcm5lbC9wY2kuYwppbmRleCBmNzA2NGFiLi40Zjg0OTkxIDEwMDY0NAotLS0gYS9h
cmNoL3BhcmlzYy9rZXJuZWwvcGNpLmMKKysrIGIvYXJjaC9wYXJpc2Mva2VybmVsL3BjaS5jCkBA
IC0xOCw3ICsxOCw2IEBACiAKICNpbmNsdWRlIDxhc20vaW8uaD4KICNpbmNsdWRlIDxhc20vc3lz
dGVtLmg+Ci0jaW5jbHVkZSA8YXNtL2NhY2hlLmg+CQkvKiBmb3IgTDFfQ0FDSEVfQllURVMgKi8K
ICNpbmNsdWRlIDxhc20vc3VwZXJpby5oPgogCiAjZGVmaW5lIERFQlVHX1JFU09VUkNFUyAwCkBA
IC0xMjMsNiArMTIyLDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IHBjaWJpb3NfaW5pdCh2b2lkKQog
CX0gZWxzZSB7CiAJCXByaW50ayhLRVJOX1dBUk5JTkcgInBjaV9iaW9zICE9IE5VTEwgYnV0IGlu
aXQoKSBpcyFcbiIpOwogCX0KKworCS8qIFNldCB0aGUgQ0xTIGZvciBQQ0kgYXMgZWFybHkgYXMg
cG9zc2libGUuICovCisJcGNpX2NhY2hlX2xpbmVfc2l6ZSA9IHBjaV9kZmxfY2FjaGVfbGluZV9z
aXplOworIAogCXJldHVybiAwOwogfQogCkBAIC0xNzAsOCArMTczLDggQEAgdm9pZCBwY2liaW9z
X3NldF9tYXN0ZXIoc3RydWN0IHBjaV9kZXYgKmRldikKIAkqKiBIUCBnZW5lcmFsbHkgaGFzIGZl
d2VyIGRldmljZXMgb24gdGhlIGJ1cyB0aGFuIG90aGVyIGFyY2hpdGVjdHVyZXMuCiAJKiogdXBw
ZXIgYnl0ZSBpcyBQQ0lfTEFURU5DWV9USU1FUi4KIAkqLwotCXBjaV93cml0ZV9jb25maWdfd29y
ZChkZXYsIFBDSV9DQUNIRV9MSU5FX1NJWkUsCi0JCQkJKDB4ODAgPDwgOCkgfCAoTDFfQ0FDSEVf
QllURVMgLyBzaXplb2YodTMyKSkpOworCXBjaV93cml0ZV9jb25maWdfd29yZChkZXYsIFBDSV9D
QUNIRV9MSU5FX1NJWkUsIAorCQkJICAgICAgKDB4ODAgPDwgOCkgfCBwY2lfY2FjaGVfbGluZV9z
aXplKTsKIH0KIAogCg==
--0016e6d78553816212048038c137--

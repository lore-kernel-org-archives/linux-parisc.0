From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [PATCH] Document LWS ABI.
Date: Tue, 15 Jul 2008 08:33:38 -0400
Message-ID: <119aab440807150533y2b56f612w6f6fa12ed28b45fe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_6813_2174491.1216125218592"
To: "Kyle McMartin" <kyle@mcmartin.ca>, "Helge Deller" <deller@gmx.de>,
	"John David Anglin" <dave.anglin@nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

------=_Part_6813_2174491.1216125218592
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Helge,

The LWS interface *already* has a 64-bit runtime entry point, see
arch/parisc/kernel/syscall.S:
~~~
        .align PAGE_SIZE
        /* Light-weight-syscall table */
        /* Start of lws table. */
ENTRY(lws_table)
        LWS_ENTRY(compare_and_swap32)   /* 0 - ELF32 Atomic compare and swap */
        LWS_ENTRY(compare_and_swap64)   /* 1 - ELF64 Atomic compare and swap */
END(lws_table)
        /* End of lws table */
~~~

The entry path unconditionally clips the LWS # to 32-bits.

On a 32-bit kernel, calling LWS entry #0 carries out the CAS on the
untouched 32-bit registers.
On a 32-bit kernel, calling LWS entry #1 returns ENOSYS.

On a 64-bit kernel, calling LWS entry #0 clips all register to 32-bits
and carries out the CAS.
On a 64-bit kernel, calling LWS entry #1 carries out the CAS on the
untouched 64-bit registers.

Patch attached.

John, could you comment on the ABI wrt the 64-bit runtime?

Helge, please review. I rolled in your fix for the superfluous .align
16. I would like your signed-off-by if you think the patch is good.

[PARISC] Document LWS ABI and LWS cleanups.

Document the LWS ABI including implementation notes for
userspace, and comment cleanup.

Remove extraneous .align 16 after lws_lock_start.

Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

------=_Part_6813_2174491.1216125218592
Content-Type: text/x-diff; name=syscall.S.diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fiohinzi1
Content-Disposition: attachment; filename=syscall.S.diff

ZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2tlcm5lbC9zeXNjYWxsLlMgYi9hcmNoL3BhcmlzYy9r
ZXJuZWwvc3lzY2FsbC5TCmluZGV4IDY5YjZlZWIuLjNmYzczYWQgMTAwNjQ0Ci0tLSBhL2FyY2gv
cGFyaXNjL2tlcm5lbC9zeXNjYWxsLlMKKysrIGIvYXJjaC9wYXJpc2Mva2VybmVsL3N5c2NhbGwu
UwpAQCAtMzY1LDE3ICszNjUsNTEgQEAgdHJhY2VzeXNfc2lnZXhpdDoKIAogCiAJLyoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgotCQlMaWdo
dC13ZWlnaHQtc3lzY2FsbCBjb2RlCisJCTMyLzY0LWJpdCBMaWdodC1XZWlnaHQtU3lzY2FsbCBB
QkkKIAotCQlyMjAgLSBsd3MgbnVtYmVyCi0JCXIyNixyMjUscjI0LHIyMyxyMjIgLSBJbnB1dCBy
ZWdpc3RlcnMKLQkJcjI4IC0gRnVuY3Rpb24gcmV0dXJuIHJlZ2lzdGVyCi0JCXIyMSAtIEVycm9y
IGNvZGUuCisJCSogLSBJbmRpY2F0ZXMgYSBoaW50IGZvciB1c2Vyc3BhY2UgaW5saW5lIGFzbQor
CQlpbXBsZW1lbnRhdGlvbnMuCiAKLQkJU2NyYWN0aDogQW55IG9mIHRoZSBhYm92ZSB0aGF0IGFy
ZW4ndCBiZWluZwotCQljdXJyZW50bHkgdXNlZCwgaW5jbHVkaW5nIHIxLiAKKwkJU3lzY2FsbCBu
dW1iZXIgKGNhbGxlci1zYXZlcykKKwkgICAgICAgIC0gJXIyMAorCSAgICAgICAgKiBJbiBhc20g
Y2xvYmJlci4KIAotCQlSZXR1cm4gcG9pbnRlcjogcjMxIChOb3QgdXNhYmxlKQorCQlBcmd1bWVu
dCByZWdpc3RlcnMgKGNhbGxlci1zYXZlcykKKwkgICAgICAgIC0gJXIyNiwgJXIyNSwgJXIyNCwg
JXIyMywgJXIyMgorCSAgICAgICAgKiBJbiBhc20gaW5wdXQuCisKKwkJUmV0dXJuIHJlZ2lzdGVy
cyAoY2FsbGVyLXNhdmVzKQorCSAgICAgICAgLSAlcjI4IChyZXR1cm4pLCAlcjIxIChlcnJubykK
KwkgICAgICAgICogSW4gYXNtIG91dHB1dC4KKworCQlDYWxsZXItc2F2ZXMgcmVnaXN0ZXJzCisJ
ICAgICAgICAtICVyMSwgJXIyNywgJXIyOQorCSAgICAgICAgLSAlcjIgKHJldHVybiBwb2ludGVy
KQorCSAgICAgICAgLSAlcjMxIChibGUgbGluayByZWdpc3RlcikKKwkgICAgICAgICogSW4gYXNt
IGNsb2JiZXIuCisKKwkJQ2FsbGVlLXNhdmVzIHJlZ2lzdGVycworCSAgICAgICAgLSAlcjMtJXIx
OAorCSAgICAgICAgLSAlcjMwIChzdGFjayBwb2ludGVyKQorCSAgICAgICAgKiBOb3QgaW4gYXNt
IGNsb2JiZXIuCisKKwkJSWYgdXNlcnNwYWNlIGlzIDMyLWJpdDoKKwkJQ2FsbGVlLXNhdmVzIHJl
Z2lzdGVycworCSAgICAgICAgLSAlcjE5ICgzMi1iaXQgUElDIHJlZ2lzdGVyKQorCisJCURpZmZl
cmVuY2VzIGZyb20gMzItYml0IGNhbGxpbmcgY29udmVudGlvbjoKKwkJLSBTeXNjYWxsIG51bWJl
ciBpbiAlcjIwCisJCS0gQWRkaXRpb25hbCBhcmd1bWVudCByZWdpc3RlciAlcjIyIChhcmc0KQor
CQktIENhbGxlZS1zYXZlcyAlcjE5LgorCisJCUlmIHVzZXJzcGFjZSBpcyA2NC1iaXQ6CisJCUNh
bGxlZS1zYXZlcyByZWdpc3RlcnMKKwkJLSAlcjI3ICg2NC1iaXQgUElDIHJlZ2lzdGVyKQorCisJ
CURpZmZlcmVuY2VzIGZyb20gNjQtYml0IGNhbGxpbmcgY29udmVudGlvbjoKKwkJLSBTeXNjYWxs
IG51bWJlciBpbiAlcjIwCisJCS0gQWRkaXRpb25hbCBhcmd1bWVudCByZWdpc3RlciAlcjIyIChh
cmc0KQorCQktIENhbGxlZS1zYXZlcyAlcjI3LgogCiAJCUVycm9yIGNvZGVzIHJldHVybmVkIGJ5
IGVudHJ5IHBhdGg6CiAKQEAgLTQ3Myw3ICs1MDcsOCBAQCBsd3NfY29tcGFyZV9hbmRfc3dhcDY0
OgogCWIsbglsd3NfY29tcGFyZV9hbmRfc3dhcAogI2Vsc2UKIAkvKiBJZiB3ZSBhcmUgbm90IGEg
NjQtYml0IGtlcm5lbCwgdGhlbiB3ZSBkb24ndAotCSAqIGltcGxlbWVudCBoYXZpbmcgNjQtYml0
IGlucHV0IHJlZ2lzdGVycworCSAqIGhhdmUgNjQtYml0IGlucHV0IHJlZ2lzdGVycywgYW5kIGNh
bGxpbmcKKwkgKiB0aGUgNjQtYml0IExXUyBDQVMgcmV0dXJucyBFTk9TWVMuCiAJICovCiAJYixu
CWx3c19leGl0X25vc3lzCiAjZW5kaWYKQEAgLTYzNSwxMiArNjcwLDE1IEBAIEVORChzeXNfY2Fs
bF90YWJsZTY0KQogCS8qCiAJCUFsbCBsaWdodC13ZWlnaHQtc3lzY2FsbCBhdG9taWMgb3BlcmF0
aW9ucyAKIAkJd2lsbCB1c2UgdGhpcyBzZXQgb2YgbG9ja3MgCisKKwkJTk9URTogVGhlIGx3c19s
b2NrX3N0YXJ0IHN5bWJvbCBtdXN0IGJlIAorCQlhdCBsZWFzdCAxNi1ieXRlIGFsaWduZWQgZm9y
IHNhZmUgdXNlCisJCXdpdGggbGRjdy4KIAkqLwogCS5zZWN0aW9uIC5kYXRhCiAJLmFsaWduCVBB
R0VfU0laRQogRU5UUlkobHdzX2xvY2tfc3RhcnQpCiAJLyogbHdzIGxvY2tzICovCi0JLmFsaWdu
IDE2CiAJLnJlcHQgMTYKIAkvKiBLZWVwIGxvY2tzIGFsaWduZWQgYXQgMTYtYnl0ZXMgKi8KIAku
d29yZCAxCg==
------=_Part_6813_2174491.1216125218592--

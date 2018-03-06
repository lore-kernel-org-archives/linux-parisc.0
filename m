From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 02/10] include: Move compat_timespec/ timeval
	to compat_time.h
Date: Tue, 6 Mar 2018 13:46:30 +0100
Message-ID: <CAK8P3a0Gm1L70EaFzJBk0drRNKtX0FE22BHOSrXBgH1wNfKZ5A@mail.gmail.com>
References: <20180116021818.24791-1-deepa.kernel@gmail.com>
 <20180116021818.24791-3-deepa.kernel@gmail.com>
 <c6fb6676-a8d3-8893-660c-2b9899c5d5ab@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>, devel@driverdev.osuosl.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 y2038 Mailman List <y2038@lists.linaro.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>, sebott@linux.vnet.ibm.com,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>,
 oprofile-list@lists.sf.net, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>,
 Robert Richter <rric@kernel.org>, Chris Metcalf <cmetcalf@mellanox.com>,
 Will Deacon <will.deacon@arm.com>, Arnaldo Carvalho de Mel
To: Christian Borntraeger <borntraeger@de.ibm.com>
Return-path: <y2038-bounces@lists.linaro.org>
In-Reply-To: <c6fb6676-a8d3-8893-660c-2b9899c5d5ab@de.ibm.com>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/y2038/>
List-Post: <mailto:y2038@lists.linaro.org>
List-Help: <mailto:y2038-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=subscribe>
Errors-To: y2038-bounces@lists.linaro.org
List-ID: <linux-parisc.vger.kernel.org>

T24gTW9uLCBNYXIgNSwgMjAxOCBhdCAxMDozMCBBTSwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyCjxi
b3JudHJhZWdlckBkZS5pYm0uY29tPiB3cm90ZToKPiBPbiAwMS8xNi8yMDE4IDAzOjE4IEFNLCBE
ZWVwYSBEaW5hbWFuaSB3cm90ZToKPj4gQWxsIHRoZSBjdXJyZW50IGFyY2hpdGVjdHVyZSBzcGVj
aWZpYyBkZWZpbmVzIGZvciB0aGVzZQo+PiBhcmUgdGhlIHNhbWUuIFJlZmFjdG9yIHRoZXNlIGNv
bW1vbiBkZWZpbmVzIHRvIGEgY29tbW9uCj4+IGhlYWRlciBmaWxlLgo+Pgo+PiBUaGUgbmV3IGNv
bW1vbiBsaW51eC9jb21wYXRfdGltZS5oIGlzIGFsc28gdXNlZnVsIGFzIGl0Cj4+IHdpbGwgZXZl
bnR1YWxseSBiZSB1c2VkIHRvIGhvbGQgYWxsIHRoZSBkZWZpbmVzIHRoYXQKPj4gYXJlIG5lZWRl
ZCBmb3IgY29tcGF0IHRpbWUgdHlwZXMgdGhhdCBzdXBwb3J0IG5vbiB5MjAzOAo+PiBzYWZlIHR5
cGVzLiBOZXcgYXJjaGl0ZWN0dXJlcyBuZWVkIG5vdCBoYXZlIHRvIGRlZmluZSB0aGVzZQo+PiBu
ZXcgdHlwZXMgYXMgdGhleSB3aWxsIG9ubHkgdXNlIG5ldyB5MjAzOCBzYWZlIHN5c2NhbGxzLgo+
PiBUaGlzIGZpbGUgY2FuIGJlIGRlbGV0ZWQgYWZ0ZXIgeTIwMzggd2hlbiB3ZSBzdG9wIHN1cHBv
cnRpbmcKPj4gbm9uIHkyMDM4IHNhZmUgc3lzY2FsbHMuCj4KPiBZb3UgYXJlIG5vdyBpbmNsdWRl
IGEgPGxpbnV4LyouaD4gZnJvbSBzZXZlcmFsIGFzbSBmaWxlcwo+ICgKPiAgYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9zdGF0LmgKPiAgYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2VsZi5oCj4gIGFyY2gv
eDg2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3N5c19pYTMy
LmgKPiApCj4gSXQgd29ya3MsIGFuZCBpdCBpcyBkb25lIGluIG1hbnkgcGxhY2VzLCBidXQgaXQg
bG9va3Mgc29tZXdoYXQgd2VpcmQuCj4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBoYXZlIGFuIGFz
bS1nZW5lcmljL2NvbXBhdGUtdGltZS5oIGluc3RlYWQ/IEFza2luZyBmb3IKPiBvcGluaW9ucyBo
ZXJlLgoKSSBkb24ndCB0aGluayB3ZSBoYXZlIHN1Y2ggYSBydWxlLiBJZiBhIGhlYWRlciBmaWxl
IGlzIGNvbW1vbiB0byBhbGwKYXJjaGl0ZWN0dXJlcyAoaS5lLiBubyBhcmNoaXRlY3R1cmUgdXNl
cyBhIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiksCml0IHNob3VsZCBiZSBpbiBpbmNsdWRlL2xp
bnV4IHJhdGhlciB0aGFuIGluY2x1ZGUvYXNtLWdlbmVyaWMsIHJlZ2FyZGxlc3MKb2Ygd2hldGhl
ciBpdCBjYW4gYmUgdXNlZCBieSBhc3NlbWJsZXIgZmlsZXMgb3Igbm90LgoKPj4gLS0tIGEvZHJp
dmVycy9zMzkwL25ldC9xZXRoX2NvcmVfbWFpbi5jCj4+ICsrKyBiL2RyaXZlcnMvczM5MC9uZXQv
cWV0aF9jb3JlX21haW4uYwo+PiBAQCAtMzIsNyArMzIsNyBAQAo+PiAgI2luY2x1ZGUgPGFzbS9j
aHBpZC5oPgo+PiAgI2luY2x1ZGUgPGFzbS9pby5oPgo+PiAgI2luY2x1ZGUgPGFzbS9zeXNpbmZv
Lmg+Cj4+IC0jaW5jbHVkZSA8YXNtL2NvbXBhdC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2NvbXBh
dC5oPgo+PiAgI2luY2x1ZGUgPGFzbS9kaWFnLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2Npby5oPgo+
PiAgI2luY2x1ZGUgPGFzbS9jY3dkZXYuaD4KPgo+IENhbiB5b3UgbW92ZSB0aGF0IGludG8gdGhl
IG90aGVyIGluY2x1ZGVzICh3aGVyZSBhbGwgdGhlIG90aGVyIDxsaW51eC8qPiBpbmNsdWRlcyBh
cmUuCgpHb29kIGNhdGNoLCB0aGlzIGlzIGRlZmluaXRlbHkgYSBydWxlIHdlIGhhdmUgOy0pCgog
ICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpZMjAzOCBtYWlsaW5nIGxpc3QKWTIwMzhAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby95MjAzOAo=

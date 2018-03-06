From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v3 02/10] include: Move compat_timespec/ timeval
 to compat_time.h
Date: Tue, 6 Mar 2018 13:48:22 +0100
Message-ID: <d8480da9-afe9-8a43-9c47-50919215a2de@de.ibm.com>
References: <20180116021818.24791-1-deepa.kernel@gmail.com>
 <20180116021818.24791-3-deepa.kernel@gmail.com>
 <c6fb6676-a8d3-8893-660c-2b9899c5d5ab@de.ibm.com>
 <CAK8P3a0Gm1L70EaFzJBk0drRNKtX0FE22BHOSrXBgH1wNfKZ5A@mail.gmail.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Return-path: <y2038-bounces@lists.linaro.org>
In-Reply-To: <CAK8P3a0Gm1L70EaFzJBk0drRNKtX0FE22BHOSrXBgH1wNfKZ5A@mail.gmail.com>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/y2038/>
List-Post: <mailto:y2038@lists.linaro.org>
List-Help: <mailto:y2038-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=subscribe>
Errors-To: y2038-bounces@lists.linaro.org
List-ID: <linux-parisc.vger.kernel.org>

CgpPbiAwMy8wNi8yMDE4IDAxOjQ2IFBNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IE9uIE1vbiwg
TWFyIDUsIDIwMTggYXQgMTA6MzAgQU0sIENocmlzdGlhbiBCb3JudHJhZWdlcgo+IDxib3JudHJh
ZWdlckBkZS5pYm0uY29tPiB3cm90ZToKPj4gT24gMDEvMTYvMjAxOCAwMzoxOCBBTSwgRGVlcGEg
RGluYW1hbmkgd3JvdGU6Cj4+PiBBbGwgdGhlIGN1cnJlbnQgYXJjaGl0ZWN0dXJlIHNwZWNpZmlj
IGRlZmluZXMgZm9yIHRoZXNlCj4+PiBhcmUgdGhlIHNhbWUuIFJlZmFjdG9yIHRoZXNlIGNvbW1v
biBkZWZpbmVzIHRvIGEgY29tbW9uCj4+PiBoZWFkZXIgZmlsZS4KPj4+Cj4+PiBUaGUgbmV3IGNv
bW1vbiBsaW51eC9jb21wYXRfdGltZS5oIGlzIGFsc28gdXNlZnVsIGFzIGl0Cj4+PiB3aWxsIGV2
ZW50dWFsbHkgYmUgdXNlZCB0byBob2xkIGFsbCB0aGUgZGVmaW5lcyB0aGF0Cj4+PiBhcmUgbmVl
ZGVkIGZvciBjb21wYXQgdGltZSB0eXBlcyB0aGF0IHN1cHBvcnQgbm9uIHkyMDM4Cj4+PiBzYWZl
IHR5cGVzLiBOZXcgYXJjaGl0ZWN0dXJlcyBuZWVkIG5vdCBoYXZlIHRvIGRlZmluZSB0aGVzZQo+
Pj4gbmV3IHR5cGVzIGFzIHRoZXkgd2lsbCBvbmx5IHVzZSBuZXcgeTIwMzggc2FmZSBzeXNjYWxs
cy4KPj4+IFRoaXMgZmlsZSBjYW4gYmUgZGVsZXRlZCBhZnRlciB5MjAzOCB3aGVuIHdlIHN0b3Ag
c3VwcG9ydGluZwo+Pj4gbm9uIHkyMDM4IHNhZmUgc3lzY2FsbHMuCj4+Cj4+IFlvdSBhcmUgbm93
IGluY2x1ZGUgYSA8bGludXgvKi5oPiBmcm9tIHNldmVyYWwgYXNtIGZpbGVzCj4+ICgKPj4gIGFy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vc3RhdC5oCj4+ICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vZWxm
LmgKPj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4+ICBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9zeXNfaWEzMi5oCj4+ICkKPj4gSXQgd29ya3MsIGFuZCBpdCBpcyBkb25lIGluIG1hbnkg
cGxhY2VzLCBidXQgaXQgbG9va3Mgc29tZXdoYXQgd2VpcmQuCj4+IFdvdWxkIGl0IG1ha2Ugc2Vu
c2UgdG8gaGF2ZSBhbiBhc20tZ2VuZXJpYy9jb21wYXRlLXRpbWUuaCBpbnN0ZWFkPyBBc2tpbmcg
Zm9yCj4+IG9waW5pb25zIGhlcmUuCj4gCj4gSSBkb24ndCB0aGluayB3ZSBoYXZlIHN1Y2ggYSBy
dWxlLiBJZiBhIGhlYWRlciBmaWxlIGlzIGNvbW1vbiB0byBhbGwKPiBhcmNoaXRlY3R1cmVzIChp
LmUuIG5vIGFyY2hpdGVjdHVyZSB1c2VzIGEgZGlmZmVyZW50IGltcGxlbWVudGF0aW9uKSwKPiBp
dCBzaG91bGQgYmUgaW4gaW5jbHVkZS9saW51eCByYXRoZXIgdGhhbiBpbmNsdWRlL2FzbS1nZW5l
cmljLCByZWdhcmRsZXNzCj4gb2Ygd2hldGhlciBpdCBjYW4gYmUgdXNlZCBieSBhc3NlbWJsZXIg
ZmlsZXMgb3Igbm90Lgo+IAo+Pj4gLS0tIGEvZHJpdmVycy9zMzkwL25ldC9xZXRoX2NvcmVfbWFp
bi5jCj4+PiArKysgYi9kcml2ZXJzL3MzOTAvbmV0L3FldGhfY29yZV9tYWluLmMKPj4+IEBAIC0z
Miw3ICszMiw3IEBACj4+PiAgI2luY2x1ZGUgPGFzbS9jaHBpZC5oPgo+Pj4gICNpbmNsdWRlIDxh
c20vaW8uaD4KPj4+ICAjaW5jbHVkZSA8YXNtL3N5c2luZm8uaD4KPj4+IC0jaW5jbHVkZSA8YXNt
L2NvbXBhdC5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9jb21wYXQuaD4KPj4+ICAjaW5jbHVkZSA8
YXNtL2RpYWcuaD4KPj4+ICAjaW5jbHVkZSA8YXNtL2Npby5oPgo+Pj4gICNpbmNsdWRlIDxhc20v
Y2N3ZGV2Lmg+Cj4+Cj4+IENhbiB5b3UgbW92ZSB0aGF0IGludG8gdGhlIG90aGVyIGluY2x1ZGVz
ICh3aGVyZSBhbGwgdGhlIG90aGVyIDxsaW51eC8qPiBpbmNsdWRlcyBhcmUuCj4gCj4gR29vZCBj
YXRjaCwgdGhpcyBpcyBkZWZpbml0ZWx5IGEgcnVsZSB3ZSBoYXZlIDstKQoKRldJVywgdGhpcyB3
YXMgYWxzbyBicm9rZW4gZm9yIAphcmNoL3g4Ni9pbmNsdWRlL2FzbS9zeXNfaWEzMi5oCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpZMjAzOCBtYWlsaW5n
IGxpc3QKWTIwMzhAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFp
bG1hbi9saXN0aW5mby95MjAzOAo=

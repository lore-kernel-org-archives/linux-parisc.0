Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id C64E24878
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 15 Apr 2004 20:26:53 -0600 (MDT)
Date: Fri, 16 Apr 2004 03:26:37 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] B1000/C3000
In-Reply-To: <20040415233515.GB12667@colo.lackof.org>
Message-ID: <Pine.LNX.4.58.0404160323390.31354@sal.ucc.ie>
References: <200404142051.i3EKpfQX018442@hiauly1.hia.nrc.ca>
	<Pine.LNX.4.58.0404142155100.8626@sal.ucc.ie>
	<20040414232833.GQ31873@tausq.org>
	<Pine.LNX.4.58.0404150125020.28713@sal.ucc.ie>
	<20040415154811.GA3514@colo.lackof.org>
	<Pine.LNX.4.58.0404152036190.30237@sal.ucc.ie>
	<20040415233515.GB12667@colo.lackof.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-275789367-1519371959-1082082397=:31354"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---275789367-1519371959-1082082397=:31354
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 15 Apr 2004, Grant Grundler wrote:

> > 2. It should be "Which non-HP PCI graphic cards *work* with PA-RISC Linux"
>
> Patches would be alot easier...

Here you go ...

I attached a 'cvs diff -u src/faq/graphics-howto.x', I hope that's the
normal way to prepare do a CVS patch.


Greetings,
  Max
---275789367-1519371959-1082082397=:31354
Content-Type: TEXT/plain; charset=US-ASCII; name="graphics-faq.diff"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.58.0404160326370.31354@sal.ucc.ie>
Content-Description: 
Content-Disposition: attachment; filename="graphics-faq.diff"

SW5kZXg6IHNyYy9mYXEvZ3JhcGhpY3MtaG93dG8ueA0KPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KUkNTIGZpbGU6IC92YXIvY3ZzL3dlYi9zcmMvZmFxL2dy
YXBoaWNzLWhvd3RvLngsdg0KcmV0cmlldmluZyByZXZpc2lvbiAxLjINCmRp
ZmYgLXUgLXIxLjIgZ3JhcGhpY3MtaG93dG8ueA0KLS0tIGEvc3JjL2ZhcS9n
cmFwaGljcy1ob3d0by54CTE1IEFwciAyMDA0IDE2OjA4OjAyIC0wMDAwCTEu
Mg0KKysrIGIvc3JjL2ZhcS9ncmFwaGljcy1ob3d0by54CTE2IEFwciAyMDA0
IDAyOjIzOjIwIC0wMDAwDQpAQCAtMzMsMTAgKzMzLDkgQEANCiANCiBVbmZv
cnR1bmF0ZWx5IG5vIDJEIG9yIDNEIGFjY2VsZXJhdGlvbiBzdXBwb3J0IGlz
IGluIHRoZQ0KIFgxMSBkcml2ZXJzLiBPbmx5IHJhdyBmcmFtZSBidWZmZXIg
aXMgc3VwcG9ydGVkLg0KLQ0KLTxoMj5XaGljaCBub24tSFAgUENJIGdyYXBo
aWMgY2FyZHMgd2l0aCBQQS1SSVNDIExpbnV4PzwvaDI+DQotPGJyPg0KLURl
cGVuZHMgb24gd2hpY2ggZ3JhcGhpY3MgY2FyZCB5b3UgYXJlIHVzaW5nLg0K
Kzxicj48YnI+DQorPGgyPldoaWNoIG5vbi1IUCBQQ0kgZ3JhcGhpYyBjYXJk
cyB3b3JrIHdpdGggUEEtUklTQyBMaW51eD88L2gyPg0KK0RlcGVuZHMgb24g
d2hpY2ggZ3JhcGhpY3MgY2FyZCB5b3UgYXJlIHVzaW5nLjxicj48YnI+DQog
TW9zdCBncmFwaGljcyBjYXJkIGhhdmUgdG8gYmUgaW5pdGlhbGl6ZWQgYnkg
ZmlybXdhcmUgYmVmb3JlDQogdGhlIE9TIGRyaXZlciBjYW4gdXNlIHRoZSBj
YXJkLg0KIFVzdWFsbHkgdGhpcyBpcyBkb25lIGJ5IHRoZSBCSU9TIG9uIChp
eDg2LVBDcyksDQpAQCAtNDQsMTEgKzQzLDExIEBADQogaW5pdGlhbGl6YXRp
b24gcHJvZ3JhbSBzdG9yZWQgb24gdGhlIGdyYXBoaWNzIGNhcmQuDQogPGJy
Pg0KIFVuZm9ydHVuYXRlbHkgZWFjaCBvZiB0aGVzZSBmaXJtd2FyZSBpcyBp
bmNvbXBhdGlibGUgd2l0aCBvdGhlcg0KLWNvbXB1dGVycy4gUEEtUklTQyBQ
REMgY2Fubm90IGluaXRpYWxpemUgYSBQQyBncmFwaGljcyBjYXJkLg0KK2Nv
bXB1dGVycy4gRm9yIGV4YW1wbGUsIGEgUEEtUklTQyBQREMgY2Fubm90IGlu
aXRpYWxpemUgYSBQQyBncmFwaGljcyBjYXJkLg0KIFRoZXJlZm9yZSB0aGUg
Z3JhcGhpYyBjYXJkIHZlbmRvcnMgcHJvZHVjZSBkaWZmZXJlbnQgdmVyc2lv
bnMgZm9yDQogZWFjaCBwbGF0Zm9ybSAoZS5nLiBBVEkgcHJvZHVjZXMgZGlm
ZmVyZW50ICdGaXJlIEdMJyBncmFwaGljcyBjYXJkcyBmb3INCiBQQywgTUFD
IGFuZCBQQS1SSVNDKS4NCi08YnI+DQorPGJyPjxicj4NCiBUaGlzIGxlYWRz
IHRvIHRoZSBmb2xsb3dpbmcgcHJvYmxlbXM6DQogPGJyPg0KIDx1bD4NCkBA
IC01OCwxMSArNTcsOSBAQA0KIAlwcm9ibGVtLCBzaW5jZSB0aGlzIHdvdWxk
IHJlcXVpcmUgcGF0Y2hpbmcgdGhlIFBEQyBmaXJtd2FyZS4NCiAJVXNlIHNl
cmlhbCBjb25zb2xlIHRvIGFjY2VzcyB0aGUgUERDIGJvb3QgbWVudS4NCiAN
Ci0JPGxpPiBZb3UgaGF2ZSB0byBpbml0aWFsaXplIGEgbm9uLUhQIGdyYXBo
aWNzIGNhcmQgc29tZWhvdw0KLTwvdWw+DQorCTxsaT4gWW91IGhhdmUgdG8g
aW5pdGlhbGl6ZSBhIG5vbi1IUCBncmFwaGljcyBjYXJkIHNvbWVob3c6DQog
DQotPGgyPkxpbnV4IGZyYW1lYnVmZmVyIGRyaXZlcjwvaDI+DQotPGJyPg0K
KzxoMz5MaW51eCBmcmFtZWJ1ZmZlciBkcml2ZXI8L2gzPg0KIFNvbWUgZ3Jh
cGhpYyBjYXJkcyBjYW4gYmUgaW5pdGlhbGl6ZWQgYnkgdGhlIGxpbnV4IGZy
YW1lYnVmZmVyDQogZHJpdmVycyBkaXJlY3RseSwgYW5kIG1pZ2h0IHdvcmsg
b24gUEEtUklTQyBMaW51eC4NCiBUaGlzIGlzIGFuIGluY29tcGxldGUgbGlz
dDoNCkBAIC03MywxMCArNzAsOSBAQA0KIDwvdWw+DQogVG8gZGF0ZSwgVm9v
ZG9vMiBhbmQgQVRJIFJhZ2UgWEwgY2FyZCBhcmUgcmVwb3J0ZWQgdG8gaGF2
ZSB3b3JrZWQuDQogSW4gY29tYmluYXRpb24gd2l0aCB0aGUgZmJkZXYgWC1z
ZXJ2ZXIgZnJvbSBYRnJlZTg2L1gub3JnDQoteW91IHNob3VsZCBhYmxlIHRv
IGhhdmUgYSBuaWNlIFgxMSBkZXNrdG9wLg0KK3lvdSBzaG91bGQgYWJsZSB0
byBoYXZlIGEgbmljZSAoYWxiZWl0IHVuYWNjZWxlcmF0ZWQpIFgxMSBkZXNr
dG9wLg0KIA0KLTxoMj5YRnJlZTg2L1gub3JnIGRyaXZlcjwvaDI+DQotPGJy
Pg0KKzxoMz5YRnJlZTg2L1gub3JnIGRyaXZlcjwvaDM+DQogQW5vdGhlciBh
cHByb2FjaCBpcyB0byB1c2UgdGhlIFhGcmVlODYvWC5vcmcgZ3JhcGhpYyBj
YXJkIGRyaXZlcnMuDQogPGJyPg0KIFRoZSBYRnJlZTg2L1gub3JnIHNlcnZl
ciBjb250YWlucyBhIHNtYWxsIGl4ODYtRW11bGF0b3IgdGhhdCBpcyBhYmxl
DQpAQCAtODcsNiArODMsNyBAQA0KIEFuIGFkdmFudGFnZSBvZiB0aGlzIGFw
cHJvYWNoIHdvdWxkIGJlIHRoZSBhYmlsaXR5IHRvIHVzZQ0KIGFkdmFuY2Vk
IGZlYXR1cmVzIG9mIHRoZSBncmFwaGljcyBjYXJkLCBsaWtlIDJELzNEDQog
YWNjZWxlcmF0aW9uLCBncmFwaGljcyBvdmVybGF5IGV0Yy4NCis8L3VsPg0K
IDxicj4NCiA8aHI+DQogPHA+PGk+TGFzdCByZXZpc2VkOiBUaHUgQXByIDE1
IDA5OjA2OjI5IFBEVCAyMDA0PC9pPjwvcD4NCg==

---275789367-1519371959-1082082397=:31354--

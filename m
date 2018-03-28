From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Thu, 29 Mar 2018 00:07:35 +0300
Message-ID: <B26CA69E-B804-4607-9697-853DFE24C616@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <CAGXu5j+XXufprMaJ9GbHxD3mZ7iqUuu60-tTMC6wo2x1puYzMQ@mail.gmail.com>
 <20180327234904.GA27734@bombadil.infradead.org>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: text/plain; charset="utf-8"
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 Rich Felker <dalias@libc.org>, Jan Kara <jack@suse.cz>,
 linux-sh <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bhupesh Sharma <bhsharma@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Russell King <linu
To: Matthew Wilcox <willy@infradead.org>
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180327234904.GA27734@bombadil.infradead.org>
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org

Cj4gT24gMjggTWFyIDIwMTgsIGF0IDAyOjQ5LCBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFk
ZWFkLm9yZz4gd3JvdGU6Cj4gCj4gT24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDM6NTM6NTNQTSAt
MDcwMCwgS2VlcyBDb29rIHdyb3RlOgo+PiBJIGFncmVlOiBwdXNoaW5nIHRoaXMgb2ZmIHRvIGxp
YmMgbGVhdmVzIGEgbG90IG9mIHRoaW5ncyB1bnByb3RlY3RlZC4KPj4gSSB0aGluayB0aGlzIHNo
b3VsZCBsaXZlIGluIHRoZSBrZXJuZWwuIFRoZSBxdWVzdGlvbiBJIGhhdmUgaXMgYWJvdXQKPj4g
bWFraW5nIGl0IG1haW50YWluYWJsZS9yZWFkYWJsZS9ldGMuCj4+IAo+PiBUaGUgc3RhdGUtb2Yt
dGhlLWFydCBmb3IgQVNMUiBpcyBtb3ZpbmcgdG8gZmluZXIgZ3JhbnVsYXJpdHkgKG92ZXIKPj4g
anVzdCBiYXNlLWFkZHJlc3Mgb2Zmc2V0KSwgc28gSSdkIHJlYWxseSBsaWtlIHRvIHNlZSB0aGlz
IHN1cHBvcnRlZCBpbgo+PiB0aGUga2VybmVsLiBXZSdsbCBiZSBnZXR0aW5nIHRoZXJlIGZvciBv
dGhlciB0aGluZ3MgaW4gdGhlIGZ1dHVyZSwgYW5kCj4+IEknZCBsaWtlIHRvIGhhdmUgYSB3b3Jr
aW5nIHByb2R1Y3Rpb24gZXhhbXBsZSBmb3IgcmVzZWFyY2hlcnMgdG8KPj4gc3R1ZHksIGV0Yy4K
PiAKPiBPbmUgdGhpbmcgd2UgbmVlZCBpcyB0byBsaW1pdCB0aGUgZnJhZ21lbnRhdGlvbiBvZiB0
aGlzIGFwcHJvYWNoLgo+IEV2ZW4gb24gNjQtYml0IHN5c3RlbXMsIHdlIGNhbiBlYXNpbHkgZ2V0
IGludG8gYSBzaXR1YXRpb24gd2hlcmUgdGhlcmUgaXNuJ3QKPiBzcGFjZSB0byBtYXAgYSBjb250
aWd1b3VzIHRlcmFieXRlLgoKQXMgSSB3cm90ZSBiZWZvcmUsIHNoaWZ0X3JhbmRvbSBpcyBpbnRy
b2R1Y2VkIHRvIGJlIGZyYWdtZW50YXRpb24gbGltaXQuIEV2ZW4gCndpdGhvdXQgaXQsIHRoZSBt
YWluIHF1ZXN0aW9uIGhlcmUgaXMg4oCYaWYgd2UgY2Fu4oCZdCBhbGxvY2F0ZSBtZW1vcnkgd2l0
aCBOIHNpemUgCmJ5dGVzLCBob3cgbWFueSBieXRlcyB3ZSBhbHJlYWR5IGFsbG9jYXRlZD/igJku
IEZyb20gdGhlc2UgcG9pbnQgb2YgdmlldyBJIAphbHJlYWR5IHNob3dlZCBpbiBwcmV2aW91cyB2
ZXJzaW9uIG9mIHBhdGNoIHRoYXQgaWYgYXBwbGljYXRpb24gdXNlcyBub3Qgc28gYmlnIAptZW1v
cnkgYWxsb2NhdGlvbnMsIGl0IHdpbGwgaGF2ZSBlbm91Z2ggbWVtb3J5IHRvIHVzZS4gSWYgaXQg
dXNlcyBYWCBHaWdhYnl0ZXMgCm9yIFRlcmFieXRlcyBtZW1vcnksIHRoaXMgYXBwbGljYXRpb24g
aGFzIGFsbCBjaGFuY2VzIHRvIGJlIGV4cGxvaXRlZCB3aXRoIApmdWxseSByYW5kb21pemF0aW9u
IG9yIHdpdGhvdXQuIFNpbmNlIGl0IGlzIG11Y2ggZWFzaWVyIHRvIGZpbmQob3IgZ3Vlc3MpIGFu
eSAKdXNhYmxlIHBvaW50ZXIsIGV0Yy4gRm9yIHRoZSBpbnN0YW5jZSB5b3UgaGF2ZSBvbmx5IDEy
OCB0ZXJhYnl0ZXMgb2YgbWVtb3J5IGZvciAKdXNlciBzcGFjZSwgc28gcHJvYmFiaWxpdHkgdG8g
ZXhwbG9pdCB0aGlzIGFwcGxpY2F0aW9uIGlzIDEvMTI4IHdoYXQgaXMgbm90IApzZWN1cmUgYXQg
YWxsLiBUaGlzIGlzIHZlcnkgcm91Z2ggZXN0aW1hdGUgYnV0IEkgdHJ5IHRvIG1ha2UgdGhpbmdz
IGVhc2llciB0byAKdW5kZXJzdGFuZC4KCkJlc3QgcmVnYXJkcywKSWx5YQoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj

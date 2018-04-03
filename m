From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Tue, 3 Apr 2018 03:11:50 +0300
Message-ID: <D9173B50-39D6-4EE5-AF8B-3EB50D0C9A3B@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <CAGXu5j+XXufprMaJ9GbHxD3mZ7iqUuu60-tTMC6wo2x1puYzMQ@mail.gmail.com>
 <20180327234904.GA27734@bombadil.infradead.org>
 <20180328000025.GM1436@brightrain.aerifal.cx>
 <3908561D78D1C84285E8C5FCA982C28F7B3B8BC5@ORSMSX110.amr.corp.intel.com>
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
 sparclinux <sparclinux@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Hugh Dickins <hu
To: "Luck, Tony" <tony.luck@intel.com>
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F7B3B8BC5@ORSMSX110.amr.corp.intel.com>
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org

PiBPbiAyOSBNYXIgMjAxOCwgYXQgMDA6MDcsIEx1Y2ssIFRvbnkgPHRvbnkubHVja0BpbnRlbC5j
b20+IHdyb3RlOgo+IAo+PiBUaGUgZGVmYXVsdCBsaW1pdCBvZiBvbmx5IDY1NTM2IFZNQXMgd2ls
bCBhbHNvIHF1aWNrbHkgY29tZSBpbnRvIHBsYXkKPj4gaWYgY29uc2VjdXRpdmUgYW5vbiBtbWFw
cyBkb24ndCBnZXQgbWVyZ2VkLiBPZiBjb3Vyc2UgdGhpcyBjYW4gYmUKPj4gcmFpc2VkLCBidXQg
aXQgaGFzIHNpZ25pZmljYW50IHJlc291cmNlIGFuZCBwZXJmb3JtYW5jZSAoZm9yaykgY29zdHMu
Cj4gCj4gQ291bGQgdGhlIHJhbmRvbSBtbWFwIGFkZHJlc3MgY2hvb3NlciBsb29rIGZvciBob3cg
bWFueSBleGlzdGluZwo+IFZNQXMgaGF2ZSBzcGFjZSBiZWZvcmUvYWZ0ZXIgYW5kIHRoZSByaWdo
dCBhdHRyaWJ1dGVzIHRvIG1lcmdlIHdpdGggdGhlCj4gbmV3IG9uZSB5b3Ugd2FudCB0byBjcmVh
dGU/IElmIHRoaXMgaXMgYWJvdmUgc29tZSB0aHJlc2hvbGQgKDEwMD8pIHRoZW4KPiBwaWNrIG9u
ZSBvZiB0aGVtIHJhbmRvbWx5IGFuZCBhbGxvY2F0ZSB0aGUgbmV3IGFkZHJlc3Mgc28gdGhhdCBp
dCB3aWxsCj4gbWVyZ2UgZnJvbSBiZWxvdy9hYm92ZSB3aXRoIGFuIGV4aXN0aW5nIG9uZS4KPiAK
PiBUaGF0IHNob3VsZCBzdGlsbCBnaXZlIHlvdSBhIHZlcnkgaGlnaCBkZWdyZWUgb2YgcmFuZG9t
bmVzcywgYnV0IHByZXZlbnQKPiBvdXQgb2YgY29udHJvbCBudW1iZXJzIG9mIFZNQXMgZnJvbSBi
ZWluZyBjcmVhdGVkLgoKSSB0aGluayB0aGlzIHdvdWxkbuKAmXQgd29yay4gRm9yIGV4YW1wbGUg
dGhlc2UgMTAwIGFsbG9jYXRpb24gbWF5IGhhcHBlbmVkIG9uIApwcm9jZXNzIGluaXRpYWxpemF0
aW9uLiBCdXQgd2hlbiBhdHRhY2tlciBjb21lIHRvIHRoZSBzZXJ2ZXIgYWxsIGhpcyAKYWxsb2Nh
dGlvbnMgd291bGQgYmUgbWFkZSBvbiB0aGUgcHJlZGljdGFibGUgb2Zmc2V0cyBmcm9tIGVhY2gg
b3RoZXIuIFNvIGluIApyZXN1bHQgd2UgZGlkIG5vdGhpbmcganVzdCBkZWNyZWFzZSBwZXJmb3Jt
YW5jZSBvZiBmaXJzdCAxMDAgYWxsb2NhdGlvbnMuIEkgCnRoaW5rIEkgY2FuIG1ha2UgaW9jdGwg
dG8gdHVybiBvZmYgdGhpcyByYW5kb21pemF0aW9uIHBlciBwcm9jZXNzIGFuZCBpdCBjb3VsZCAK
YmUgdXNlZCBpZiBuZWVkZWQuIEZvciBleGFtcGxlIGlmIGFwcGxpY2F0aW9uIGdvaW5nIHRvIGFs
bG9jYXRlIGJpZyBjaHVuayBvciAKbWFrZSBiaWcgbWVtb3J5IHByZXNzdXJlLCBldGMuCgpCZXN0
IHJlZ2FyZHMsCklseWEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmM=

From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 1/2] parisc: use the asm-generic version for writeX()
Date: Mon, 16 Apr 2018 19:09:42 -0400
Message-ID: <a727e74f-610c-4722-76e9-c1aca2f9e9bd@bell.net>
References: <1523916078-23049-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Cc: linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 Helge Deller <deller@gmx.de>, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 linux-kernel@vger.kernel.org, Philippe Ombredanne <pombredanne@nexb.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
To: Sinan Kaya <okaya@codeaurora.org>, linux-parisc@linux-mips.org,
 arnd@arndb.de, timur@codeaurora.org, sulrich@codeaurora.org
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1523916078-23049-1-git-send-email-okaya@codeaurora.org>
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org

T24gMjAxOC0wNC0xNiA2OjAxIFBNLCBTaW5hbiBLYXlhIHdyb3RlOgo+IHBhcmlzYyBhcmNoaXRl
Y3R1cmUgc2VlbXMgdG8gYmUgbWFwcGluZyB3cml0ZVgoKSBhbmQgd3JpdGVYX3JlbGF4ZWQoKSBB
UElzCj4gdG8gX19yYXdfd3JpdGVYKCkgQVBJLgo+Cj4gX19yYXdfd3JpdGVYKCkgQVBJIGRvZXNu
J3QgcHJvdmlkZSBhbnkga2luZCBvZiBvcmRlcmluZyBndWFyYW50ZWVzLgo+IGNvbW1pdCA3NTVi
ZDA0YWFmNGIgKCJpbzogZGVmaW5lIHN0cm9uZ2VyIG9yZGVyaW5nIGZvciB0aGUgZGVmYXVsdCB3
cml0ZVgoKQo+IGltcGxlbWVudGF0aW9uIikgY2hhbmdlZCBhc20tZ2VuZXJpYyBpbXBsZW1lbnRh
dGlvbiB0byB1c2UgYSBtb3JlCj4gY29uc2VydmF0aXZlIGFwcHJvYWNoIHRvd2FyZHMgdGhlIHdy
aXRlWCgpIEFQSS4KPgo+IERyb3AgdGhlIGFyY2ggc3BlY2lmaWMgdmVyc2lvbiBhbmQgcmVseSBv
biB0aGUgYXNtLWdlbmVyaWMgdmVyc2lvbiBmb3IKPiBwYXJpc2Mgc2luY2UgcGFyaXNjIHZlcnNp
b24gZG9lc24ndCBzZWVtIHRvIGRvIGFueXRoaW5nIHNwZWNpYWwgd2l0aCB0aGVzZQo+IG1hY3Jv
cy4KIMKgIEhPU1RMRMKgIHNjcmlwdHMvbW9kL21vZHBvc3QKSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC4vYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vaGFyZGlycS5oOjEzOjAsCiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vaW5jbHVkZS9saW51eC9oYXJkaXJxLmg6OSwKIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gYXJjaC9wYXJpc2Mva2VybmVsL2Fz
bS1vZmZzZXRzLmM6MzQ6Ci4vaW5jbHVkZS9saW51eC9pcnEuaDogSW4gZnVuY3Rpb24gJ2lycV9y
ZWdfd3JpdGVsJzoKLi9pbmNsdWRlL2xpbnV4L2lycS5oOjExMTQ6MzogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIAond3JpdGVsJyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5j
dGlvbi1kZWNsYXJhdGlvbl0KIMKgwqAgd3JpdGVsKHZhbCwgZ2MtPnJlZ19iYXNlICsgcmVnX29m
ZnNldCk7CiDCoMKgIF5+fn5+fgouL2luY2x1ZGUvbGludXgvaXJxLmg6IEluIGZ1bmN0aW9uICdp
cnFfcmVnX3JlYWRsJzoKLi9pbmNsdWRlL2xpbnV4L2lycS5oOjExMjM6MTA6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAKJ3JlYWRsJyBbLVdlcnJvcj1pbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KIMKgwqAgcmV0dXJuIHJlYWRsKGdjLT5yZWdfYmFzZSArIHJl
Z19vZmZzZXQpOwogwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+CmNjMTogc29tZSB3YXJuaW5ncyBi
ZWluZyB0cmVhdGVkIGFzIGVycm9ycwptYWtlWzFdOiAqKiogW0tidWlsZDo1ODogYXJjaC9wYXJp
c2Mva2VybmVsL2FzbS1vZmZzZXRzLnNdIEVycm9yIDEKCkRhdmUKCi0tIApKb2huIERhdmlkIEFu
Z2xpbiAgZGF2ZS5hbmdsaW5AYmVsbC5uZXQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

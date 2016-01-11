From: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4 01/13] tty: serial: 8250: Fix whitespace errors
Date: Mon, 11 Jan 2016 13:03:27 +0000
Message-ID: <1452517435.26146.24.camel@intel.com>
References: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
	 <1452275039-18787-2-git-send-email-anton.wuerfel@fau.de>
	 <1452515294.26146.10.camel@linux.intel.com>
	 <1452516646.26146.22.camel@intel.com> <yw1x7fjgxonh.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: "anton.wuerfel@fau.de" <anton.wuerfel@fau.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
	"desmondl@broadcom.com" <desmondl@broadcom.com>,
	"Zha, Qipeng" <qipeng.zha@intel.com>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"long.wanglong@huawei.com" <long.wanglong@huawei.com>,
	"soeren.grunewald@desy.de" <soeren.grunewald@desy.de>,
	"deller@gmx.de" <deller@gmx.de>,
	"jslaby@suse.com" <jslaby@suse.com>,
	"phillip.raffeck@fau.de" <phillip.raffeck@fau.de>,
	"paul.burton@imgtec.com" <paul.burton@imgtec.com>,
	"hpeter@gmail.com" <hpeter@gmail.com>,
	"ralf@linux-mips.org" <ralf@linux-mips.org>,
	"linux-kernel@i4.cs.fau.de" <linux-kernel@i4.cs.fau.de>,
	"adam.lee@canonical.com" <adam.lee@canonical.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"jejb@parisc-linux.or
To: "mans@mansr.com" <mans@mansr.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <yw1x7fjgxonh.fsf@unicorn.mansr.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

T24gTW9uLCAyMDE2LTAxLTExIGF0IDEyOjU0ICswMDAwLCBNw6VucyBSdWxsZ8OlcmQgd3JvdGU6
DQo+ICJTaGV2Y2hlbmtvLCBBbmRyaXkiIDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHdy
aXRlczoNCj4gDQo+ID4gT24gTW9uLCAyMDE2LTAxLTExIGF0IDE0OjI4ICswMjAwLCBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6DQo+ID4gPiBPbiBGcmksIDIwMTYtMDEtMDggYXQgMTg6NDMgKzAxMDAs
IEFudG9uIFd1ZXJmZWwgd3JvdGU6DQo+ID4gPiA+IFRoaXMgcGF0Y2ggZml4ZXMgd2hpdGVzcGFj
ZSBlcnJvcnMgcmVwb3J0ZWQgYnkgY2hlY2twYXRjaCB0bw0KPiA+ID4gPiBpbmNyZWFzZQ0KPiA+
ID4gPiByZWFkYWJpbGl0eS4gTWFpbiBmb2N1cyBpcyBvbiBtaXNzaW5nIHNwYWNlcyBhZnRlciBj
b21tYXMgaW4NCj4gPiA+ID4gZnVuY3Rpb24gaGVhZGVycyBhbmQgbWFjcm9zIChsaWtlIGZvbyxi
YXIgZWRpdGVkIHRvIGZvbywgYmFyKS4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEFudG9uIFfDvHJmZWwgPGFudG9uLnd1ZXJmZWxAZmF1LmRlPg0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBQaGlsbGlwIFJhZmZlY2sgPHBoaWxsaXAucmFmZmVja0BmYXUuZGU+DQo+ID4gPiA+IEND
OiBsaW51eC1rZXJuZWxAaTQuY3MuZmF1LmRlDQo+ID4gPiANCj4gPiA+IENjOiBsb29rcyBtb3Jl
IHN0YW5kYXJkLg0KPiA+ID4gDQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUw
LzgyNTBfYWNjZW50LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1
MF9hY2NlbnQuYw0KPiA+ID4gPiBAQCAtMTAsNyArMTAsNyBAQA0KPiA+ID4gPiDCoCNpbmNsdWRl
IDxsaW51eC9pbml0Lmg+DQo+ID4gPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3NlcmlhbF84MjUwLmg+
DQo+ID4gPiA+IMKgDQo+ID4gPiA+IC0jZGVmaW5lIFBPUlQoX2Jhc2UsX2lycSkJCQkJXA0KPiA+
ID4gPiArI2RlZmluZSBQT1JUKF9iYXNlLCBfaXJxKQkJCQlcDQo+ID4gPiA+IMKgCXsJCQkJCQlc
DQo+ID4gPiA+IMKgCQkuaW9iYXNlCQk9IF9iYXNlLAkJDQo+ID4gPiA+IFwNCj4gPiA+ID4gwqAJ
CS5pcnEJCT0gX2lycSwJCQkNCj4gPiA+ID4gXA0KPiA+IA0KPiA+IDgyNTBfUE9SVCgpDQo+ID4g
DQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBXaGlsZSB0aG9zZSBhcmUgb2theSwgSSB3b3VsZCBz
dWdnZXN0IHRvIG1ha2UgYSBtYWNybyBpbg0KPiA+ID4gZHJpdmVycy/igKYvODI1MC5oIG9uZSBm
b3IgYWxsLCBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPiA+ID4gDQo+ID4gPiAjZGVmaW5lIDgyNTBf
UE9SVF9GTEFHUyhfYmFzZSwgX2lycSwgX2ZsYWdzKQ0KPiA+ID4g4oCmDQo+ID4gPiAJLmZsYWdz
wqDCoMKgwqDCoMKgwqDCoMKgwqA9IFVQRl9CT09UX0FVVE9DT05GIHwgKF9mbGFncykgXA0KPiA+
ID4gDQo+ID4gPiAjZGVmaW5lIDgyNTBfUE9SVChfYmFzZSwgX2lycSkJODI1MF9QT1JUX0ZMQUdT
KF9iYXNlLA0KPiA+ID4gX2lycSwgMCkNCj4gPiA+IA0KPiA+ID4gQW5kIHVzZSBpdC4NCj4gPiAN
Cj4gPiAjZGVmaW5lIDgyNTBfRk9VUlBPUlQoX2Jhc2UsIF9pcnEpCTgyNTBfUE9SVF9GTEFHUyhf
YmFzZSwNCj4gPiBfaXJxLA0KPiA+IFVQRl9GT1VSUE9SVCkNCj4gDQo+IE1hY3JvIG5hbWVzIGNh
bid0IHN0YXJ0IHdpdGggYSBudW1iZXIuDQoNCk9oLCByaWdodCwgdGhhbmtzLg0KDQpTRVJJQUw4
MjUwX1BPUlQqIHdpbGwgd29yay4NCg0KLS0gDQpBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2
Y2hlbmtvQGludGVsLmNvbT4NCkludGVsIEZpbmxhbmQgT3kNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBG
aW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVz
aW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAK
ClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFs
IG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4g
QW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0
IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=


Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D838484B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 06:41:42 -0700 (MST)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id C0B3616FB
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 14:41:35 +0100 (MET)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id OAA26187 for <parisc-linux@lists.parisc-linux.org>; Thu, 5 Dec 2002 14:39:40 +0100 (MET)
Message-ID: <3DEF578D.97EB4A73@admin.france.hp.com>
Date: Thu, 05 Dec 2002 14:41:33 +0100
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] panic while "set serial" with 2.4.20-pa9
References: <3DEF1B6F.1573C841@admin.france.hp.com>
Content-Type: multipart/mixed;
 boundary="------------55C7F9ECC99E2F5FC3E3B5CB"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This is a multi-part message in MIME format.
--------------55C7F9ECC99E2F5FC3E3B5CB
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: base64

ICAgIEhpDQoNCldoZW4gYm9vdCBpcyBzdWNjZXNzZnVsbCAod2l0aCAyLjQuMTktcGEyMiks
IGl0IGRpc2NvdmVyIDUgc2VyaWFsIGJvYXJkDQouLi4uDQouLi4uDQpSZWR1bmRhbnQgZW50
cnkgaW4gc2VyaWFsIHBjaV90YWJsZS4gIFBsZWFzZSBzZW5kIHRoZSBvdXRwdXQgb2YNCmxz
cGNpIC12diwgdGhpcyBtZXNzYWdlICgxMDNjLDEwNDgsMTAzYywxMDQ5KQ0KYW5kIHRoZSBt
YW51ZmFjdHVyZXIgYW5kIG5hbWUgb2Ygc2VyaWFsIGJvYXJkIG9yIG1vZGVtIGJvYXJkDQp0
byBzZXJpYWwtcGNpLWluZm9AbGlzdHMuc291cmNlZm9yZ2UubmV0Lg0KdHR5UzAwIGF0IGlv
bWVtIDB4ZmZmZmZmZmZmODAwMDAwMCAoaXJxID0gMTMyKSBpcyBhIDE2NTUwQQ0KdHR5UzAx
IGF0IGlvbWVtIDB4ZmZmZmZmZmZmODAwMDAwOCAoaXJxID0gMTMyKSBpcyBhIDE2NTUwQQ0K
dHR5UzAyIGF0IGlvbWVtIDB4ZmZmZmZmZmZmODAwMDAxMCAoaXJxID0gMTMyKSBpcyBhIDE2
NTUwQQ0KUmVkdW5kYW50IGVudHJ5IGluIHNlcmlhbCBwY2lfdGFibGUuICBQbGVhc2Ugc2Vu
ZCB0aGUgb3V0cHV0IG9mDQpsc3BjaSAtdnYsIHRoaXMgbWVzc2FnZSAoMTAzYywxMDQ4LDEw
M2MsMTA0YSkNCmFuZCB0aGUgbWFudWZhY3R1cmVyIGFuZCBuYW1lIG9mIHNlcmlhbCBib2Fy
ZCBvciBtb2RlbSBib2FyZA0KdG8gc2VyaWFsLXBjaS1pbmZvQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldC4NCnR0eVMwMyBhdCBpb21lbSAweGZmZmZmZmZmZjgwMDUwMDAgKGlycSA9IDEzMykg
aXMgYSAxNjU1MEENCnR0eVMwNCBhdCBpb21lbSAweGZmZmZmZmZmZjgwMDUwMDggKGlycSA9
IDEzMykgaXMgYSAxNjU1MEENCi4uLi4NCi4uLi4NCg0KTm93IHdoZW4gYm9vdGluZyB0aGUg
bGF0ZXN0IGtlcm5lbCAyLjQuMjAtcGExMA0KDQpLZXJuZWwgRmF1bHQ6IENvZGU9MjYgcmVn
cz0wMDAwMDAwMDRmYmIxMWMwIChBZGRyPTAwMDAwMDAwMDAwMDAwMDgpDQoNCklmIEkgdHJ5
IHRvIGRvIHNvbWUgc3RhY2sgdW53aW5kIGl0IGdpdmVzOg0KMHgxMDEzYzVjNCAgICBjYWxs
X2NvbnNvbGVfZHJpdmVycysweGM0DQoweDEwMTNjYzhjICAgIHJlbGVhc2VfY29uc29sZV9z
ZW0rMHgxNjQNCjB4MTAyN2IzZTQgICAgc3RhcnRfcGNpX3BucF9ib2FyZCsweGE0DQoweDEw
MjdiZDY0ICAgIHNlcmlhbF9pbml0X29uZSsweGFjDQoNCkl0IGlzIGEgdHJhcCAyNiAtPiBE
YXRhIE1lbW9yeSBBY2Nlc3MgcmlnaHQgdHJhcCBpbiBjYWxsX2NvbnNvbGVfZHJpdmVycygp
Lg0KV2hlbiBkaXNzYW1ibGU6DQoNCiAgYjg6ICAgMzcgZGQgM2YgZTEgICAgIGxkbyAtMTAo
c3ApLHJldDENCiAgYmM6ICAgZTggMDAgYTAgMDAgICAgIGIsbCBjNCA8Y2FsbF9jb25zb2xl
X2RyaXZlcnMrMHhjND4sJXIyDQogIGMwOiAgIDBlIDYwIDEwIDk4ICAgICBsZHcgMChzcjAs
cjE5KSxyMjQNCiAgYzQ6ICAgMDggMDYgMDIgNWIgICAgIGNvcHkgcjYsZHAgICAgLT4gcGFu
aWMgd2hpbGUgYWNjZXNzaW5nIGRwDQogIGM4OiAgIDUzIGMyIDNlIGUxICAgICBsZGQgLTkw
KHNwKSxycA0KDQpJZiBzb21lb25lIGFzIGFueSBpZGVhLi4uLi4uLi4NCg0KVGhhbmtzLg0K
DQoNCi0tDQogICAgICAgIFZpZGFsIEJydW5vLCAoNzcwLTQyNzEpDQogICAgICAgIFNTRC1I
QSBUZWFtLCBIUC1VWCAmIExJTlVYIFN1cHBvcnQNCiAgICAgICAgYnJ1bm9fdmlkYWxAYWRt
aW4uZnJhbmNlLmhwLmNvbQ0KDQoNCg==
--------------55C7F9ECC99E2F5FC3E3B5CB
Content-Type: text/x-vcard; charset=iso-8859-1;
 name="bruno_vidal.vcf"
Content-Transfer-Encoding: base64
Content-Description: Card for Bruno Vidal
Content-Disposition: attachment;
 filename="bruno_vidal.vcf"

YmVnaW46dmNhcmQgCm46QnJ1bm87VklEQUwKdGVsO2ZheDowMS02OS04Mi02MC0xNAp0ZWw7
d29yazowMS02OS0yOS00Mi03MQp4LW1vemlsbGEtaHRtbDpUUlVFCnVybDp3d3cuZnJhbmNl
LmhwLmNvbQpvcmc6U29sdXRpb24gQ2VudGVyCnZlcnNpb246Mi4xCmVtYWlsO2ludGVybmV0
OmJydW5vX3ZpZGFsQGhwLmNvbQp0aXRsZTpFeHBlcnQgTG9naWNpZWwgRW52aXJvbm5lbWVu
dCBIYXV0ZSBEaXNwb25pYmlsaXTpCmFkcjtxdW90ZWQtcHJpbnRhYmxlOjs7SFAgRnJhbmNl
PTBEPTBBO1ouQSBkZSBDb3VydGFib2V1ZjsxIEF2LiBkdSBDYW5hZGE7OTE5NDcgTGVzIFVs
aXMgY2VkZXg7RnJhbmNlCngtbW96aWxsYS1jcHQ6OzI2MjA4CmZuOlZJREFMIEJydW5vCmVu
ZDp2Y2FyZAo=
--------------55C7F9ECC99E2F5FC3E3B5CB--

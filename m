Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76E084829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Dec 2002 20:24:13 -0700 (MST)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id gBB3Om820274
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 03:24:48 GMT
Date: Wed, 11 Dec 2002 03:24:07 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0212110257190.6654-300000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-275789367-1088173175-1039577047=:6654"
Subject: [parisc-linux] Kernel crash when loggin in via ssh
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---275789367-1088173175-1039577047=:6654
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi parisc-linux,

I tried to upgrade my C240 (from old 2.4.19-pa2) to linux-2.4.20-pa10 and
linux-2.4.20-pa13 (compiled with gcc-3.2.2-pre). Both new kernels boot
up fine, all daemons/programms seem to work, even network is up, but the
C240 (beast) instantly hangs after I try to ssh into the beast from my
Intel laptop (bucephalas).
Both systems (PA-RISC and Intel) are debian/sid, apt-get upgraded on Dec 8.
I tried the following on the laptop:

==
bucephalas:/home/xam/parisc# ssh xam@beast
xam@beast's password:
Warning: No xauth data; using fake authentication data for X11 forwarding.
==

The ssh authenification is obviously successful, but I won't get a shell prompt
since the C240 crashes immediately after the login.

It works when booting the old linux-2.4.19-pa2, so there must be a bug
introduced between 2.4.19-pa2 and 2.4.20-pa10.

Attached are the kernel stack/register dump and parts of the System.map
when running linux-2.4.20-pa13.
I didn't include the kernel config since it is quite large, but the only
thing that has changed is that I use SYM2 instead of SYM1 on 2.4.20-pa13.
The config of 2.4.20-pa10 (not working) and 2.4.19-pa7 (working) is the
same, and it hasn't changed for quite a while since before that and always
worked.

greetings max

---275789367-1088173175-1039577047=:6654
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="ssh-kernel-system.map"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.44.0212110324070.6654@sal.ucc.ie>
Content-Description: 
Content-Disposition: attachment; filename="ssh-kernel-system.map"

ZXhjZXJwdCBmcm9tIFN5c3RlbS5tYXAtMi40LjIwLXBhMTM6DQooa2VybmVs
IGNyYXNoZXMgYWZ0ZXIgdHJ5aW5nIHRvIGRvIGEgc3NoIGxvZ2luIGZyb20g
bGFwdG9wIHRvIEMyNDAsDQogYWZ0ZXIgc3VjY2Vzc2Z1bCBhdXRoZW50aWZp
Y2F0aW9uKQ0KDQoxMDEyNmRhOCB0IHNldF91c2VyDQoxMDEyNmU0NCBUIHN5
c19zZXRyZXVpZA0KMTAxMjZmZWMgVCBzeXNfc2V0dWlkDQoxMDEyNzBmOCBU
IHN5c19zZXRyZXN1aWQNCjEwMTI3MmEwIFQgc3lzX2dldHJlc3VpZA0KMTAx
MjczNDAgVCBzeXNfc2V0cmVzZ2lkDQoxMDEyNzQ1MCBUIHN5c19nZXRyZXNn
aWQNCjEwMTI3NGYwIFQgc3lzX3NldGZzdWlkDQoxMDEyNzVkOCBUIHN5c19z
ZXRmc2dpZA0KMTAxMjc2NWMgVCBzeXNfdGltZXMNCjEwMTI3Njk4IFQgc3lz
X3NldHBnaWQNCjEwMTI3NzljIFQgc3lzX2dldHBnaWQNCg0KMTAxOTc5M2Mg
dCBpbml0aWFsaXplX3R0eV9zdHJ1Y3QNCjEwMTk3YTc0IFQgdHR5X2RlZmF1
bHRfcHV0X2NoYXINCjEwMTk3YWE0IFQgdHR5X3JlZ2lzdGVyX2RldmZzDQox
MDE5N2FhOCBUIHR0eV91bnJlZ2lzdGVyX2RldmZzDQoxMDE5N2FhYyBUIHR0
eV9yZWdpc3Rlcl9kcml2ZXINCjEwMTk3Yjk0IFQgdHR5X3VucmVnaXN0ZXJf
ZHJpdmVyDQoxMDE5N2NmYyBUIHR0eV9wYXJhbm9pYV9jaGVjaw0KMTAxOTdk
N2MgdCBkb190dHlfd3JpdGUNCjEwMTk3ZjM0IHQgY2hlY2tfdW50aHJvdHRs
ZQ0KMTAxOTdmOGMgdCByZXNldF9idWZmZXJfZmxhZ3MNCjEwMTk3ZmU0IFQg
bl90dHlfZmx1c2hfYnVmZmVyDQoxMDE5ODAzNCBUIG5fdHR5X2NoYXJzX2lu
X2J1ZmZlcg0KMTAxOTgwNzggdCBvcG9zdA0KMTAxOTgyMzQgdCBvcG9zdF9i
bG9jaw0KMTAxOTg0MjQgdCBlY2hvX2NoYXINCjEwMTk4NGJjIHQgZXJhc2Vy
DQoxMDE5ODhkYyB0IG5fdHR5X3JlY2VpdmVfcm9vbQ0KMTAxOTg5MDggdCBu
X3R0eV93cml0ZV93YWtldXANCjEwMTk4OTU0IHQgbl90dHlfcmVjZWl2ZV9i
dWYNCjEwMTk4ZDM4IFQgaXNfaWdub3JlZA0KMTAxOThkODQgdCBuX3R0eV9z
ZXRfdGVybWlvcw0KMTAxOTkxNzggdCBuX3R0eV9jbG9zZQ0KMTAxOTkxYjQg
dCBuX3R0eV9vcGVuDQoxMDE5OTI1NCB0IHJlYWRfY2hhbg0KMTAxOTk4ZDgg
dCB3cml0ZV9jaGFuDQoxMDE5OWI0NCB0IG5vcm1hbF9wb2xsDQoxMDE5OWNk
YyB0IHB1dF90dHlfcXVldWUNCjEwMTk5ZDI0IHQgbl90dHlfcmVjZWl2ZV9j
aGFyDQoxMDE5YTNkOCB0IGNvcHlfZnJvbV9yZWFkX2J1Zg0KMTAxOWE0YTAg
VCB0dHlfd2FpdF91bnRpbF9zZW50DQoxMDE5YTViNCB0IHVuc2V0X2xvY2tl
ZF90ZXJtaW9zDQoxMDE5YTZhYyB0IGNoYW5nZV90ZXJtaW9zDQoxMDE5YThh
NCB0IHNldF90ZXJtaW9zDQoxMDE5YWE0OCB0IGdldF90ZXJtaW8NCjEwMTlh
YjYwIHQgaW5xX2Nhbm9uDQoxMDE5YWJjYyBUIHNlbmRfcHJpb19jaGFyDQox
MDE5YWM1YyBUIG5fdHR5X2lvY3RsDQoxMDE5YjBkMCBUIHJhd19vcGVuDQox
MDE5YjJiYyBUIHJhd19yZWxlYXNlDQoxMDE5YjM3OCBUIHJhd19pb2N0bA0K
MTAxOWIzZGMgVCByYXdfY3RsX2lvY3RsDQoxMDE5YjY2NCBUIHJhd19yZWFk
DQoxMDE5YjY5OCBUIHJhd193cml0ZQ0KMTAxOWI2Y2MgdCByd19yYXdfZGV2
DQoxMDE5YjlmMCB0IHB0eV9jbG9zZQ0KMTAxOWJiMzAgdCBwdHlfdW50aHJv
dHRsZQ0KMTAxOWJiYTggdCBwdHlfd3JpdGUNCjEwMTliZDU0IHQgcHR5X3dy
aXRlX3Jvb20NCjEwMTliZDk0IHQgcHR5X2NoYXJzX2luX2J1ZmZlcg0KMTAx
OWJkZjggdCBwdHlfZ2V0X2RldmljZV9udW1iZXINCjEwMTliZTQwIHQgcHR5
X3NldF9sb2NrDQoxMDE5YmViNCB0IHB0eV9ic2RfaW9jdGwNCjEwMTliZWZj
IHQgcHR5X3VuaXg5OF9pb2N0bA0KMTAxOWJmNDggdCBwdHlfZmx1c2hfYnVm
ZmVyDQoxMDE5YmZiOCB0IHB0eV9vcGVuDQo=
---275789367-1088173175-1039577047=:6654
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=ssh-kernel-hang
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.44.0212110324071.6654@sal.ucc.ie>
Content-Description: 
Content-Disposition: attachment; filename=ssh-kernel-hang

UElORyBidWNlcGhhbGFzLnVjYy5pZSAoMTQzLjIzOS4yMDEuMjAwKTogNTYg
ZGF0YSBieXRlcw0KNjQgYnl0ZXMgZnJvbSAxNDMuMjM5LjIwMS4yMDA6IGlj
bXBfc2VxPTAgdHRsPTY0IHRpbWU9MC42IG1zDQo2NCBieXRlcyBmcm9tIDE0
My4yMzkuMjAxLjIwMDogaWNtcF9zZXE9MSB0dGw9NjQgdGltZT0wLjEgbXMN
Cg0KLS0tIGJ1Y2VwaGFsYXMudWNjLmllIHBpbmcgc3RhdGlzdGljcyAtLS0N
CjIgcGFja2V0cyB0cmFuc21pdHRlZCwgMiBwYWNrZXRzIHJlY2VpdmVkLCAw
JSBwYWNrZXQgbG9zcw0Kcm91bmQtdHJpcCBtaW4vYXZnL21heCA9IDAuMS8w
LjMvMC42IG1zDQpiZWFzdDovZXRjL3JjUy5kIyANClN0YWNrIER1bXA6DQog
MmQwNzJmYzA6ICAwMDA0MDcwZiA0YzRjNGM0YyA0YzRjNGM0YyA0YzRjNGM0
YyANCiAyZDA3MmZiMDogIDRjNGM0YzRjIDRjNGM0YzRjIDRjNGM0YzRjIDRj
NGM0YzRjIA0KIDJkMDcyZmEwOiAgNGM0YzRjNGMgNGM0YzRjNGMgNGM0YzRj
NGMgNGM0YzRjNGMgDQogMmQwNzJmOTA6ICA0YzRjNGM0YyA0YzRjNGM0YyA0
YzRjNGM0YyA0YzRjNGM0YyANCiAyZDA3MmY4MDogIDRjNGM0YzRjIDRjNGM0
YzRjIDRjNGM0YzRjIDRjNGM0YzRjIA0KIDJkMDcyZjcwOiAgNGM0YzRjNGMg
NGM0YzRjNGMgNGM0YzRjNGMgNGM0YzRjNGMgDQoNCktlcm5lbCBhZGRyZXNz
ZXMgb24gdGhlIHN0YWNrOg0KIFs8MTAxOWJkNGM+XSAgWzwxMDE5N2E5OD5d
ICBbPDEwMTk4MTNjPl0gIFs8MTAxOTg0NzA+XSANCiBbPDEwMTk5ZTQwPl0g
IFs8MTAxOTg5ZWM+XSAgWzwxMDE5YmQ0Yz5dICBbPDEwMTk3YTk4Pl0gDQog
WzwxMDE5ODEzYz5dICBbPDEwMTk4NDcwPl0gIFs8MTAxOTllNDA+XSAgWzwx
MDE5ODllYz5dIA0KIFs8MTAxOWJkNGM+XSAgWzwxMDE5N2E5OD5dICBbPDEw
MTk4MTNjPl0gIFs8MTAxOTg0NzA+XSANCiBbPDEwMTk5ZTQwPl0gIFs8MTAx
OTg5ZWM+XSAgWzwxMDE5YmQ0Yz5dICBbPDEwMTk3YTk4Pl0gDQogWzwxMDE5
ODEzYz5dICBbPDEwMTk4NDcwPl0gIFs8MTAxOTllNDA+XSAgWzwxMDE5ODll
Yz5dIA0KIFs8MTAxOWJkNGM+XSAgWzwxMDE5N2E5OD5dICBbPDEwMTk4MTNj
Pl0gIFs8MTAxOTg0NzA+XSANCiBbPDEwMTk5ZTQwPl0gIFs8MTAxOTg5ZWM+
XSAgWzwxMDE5YmQ0Yz5dICBbPDEwMTk3YTk4Pl0gDQogWzwxMDE5ODEzYz5d
ICBbPDEwMTk4NDcwPl0gIFs8MTAxOTllNDA+XSAgWzwxMDE5ODllYz5dIA0K
IFs8MTAxOWJkNGM+XSANCg0KS2VybmVsIEZhdWx0OiBDb2RlPTYgcmVncz0y
ZDA3MmZjMCAoQWRkcj00YzRjNGM0YykNCg0KICAgICBZWnJ2V0VTVEhMTlhC
Q1ZNY2JjYmNiY2JPR0ZSUVBESQ0KUFNXOiAwMDAwMDAwMDAwMDAwMTAwMDAw
MDAxMTEwMDAwMTExMSBOb3QgdGFpbnRlZA0KcjAwLTAzICAwMDAwMDAwMCAw
MDAwMDAwMCA0YzRjNGM0YyAyZmQ5OTAwMA0KcjA0LTA3ICAyZjFlZTAwMCAw
MDAwMDAwMSAyZDA3MmYwOCAyZmQ5OTAwMA0KcjA4LTExICAwMDAwMDAwMSAw
MDAwMDAwMCAwMDAwMDAwMCAwMDA4YjY2MA0KcjEyLTE1ICAyZmQ5OTk2YyAy
ZDA0YzZkMCAwMDA2OWQ5YyAwMDA2OWQ5Yw0KcjE2LTE5ICAwMDAwMDAwNCAw
MDA2OWQ5YyAwMDAwMDAwNCAwMDAwMDA3Zg0KcjIwLTIzICBmZmZmZmZmZiAw
MDAwMDAwMSAwMDAwMDAwMCAwMDAwMDAwMQ0KcjI0LTI3ICAyZjQ2Yjc0MCAw
MDAwMDAwMCAyZjFlZTAwMCAxMDI3ZTAxMA0KcjI4LTMxICAwMDAwMTAwMCAw
MDAwMDAzMSAyZDA3MmZjMCAxMDE5N2E5OA0Kc3IwLTMgICAwMDAwMDAwMCAw
MDAwMDA3NSAwMDAwMDAwMCAwMDAwMDA3NQ0Kc3I0LTcgICAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMA0KDQpJQVNROiAwMDAwMDAwMCAw
MDAwMDAwMCBJQU9ROiA0YzRjNGM0YyA0YzRjNGM1MA0KIElJUjogNDNmZmZm
ODAgICAgSVNSOiAwODAzMDI1OCAgSU9SOiAzNDAzMDEwMA0KIENQVTogICAg
ICAgIDAgICBDUjMwOiAyZDA0YzAwMCBDUjMxOiAxMDMyMDAwMA0KIE9SSUdf
UjI4OiA2YmQzM2ZjMQ0K
---275789367-1088173175-1039577047=:6654--

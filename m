Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA03912
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 09:27:44 -0700
From: mike_clapper@hp.com
Received: from i3125om3.atl.hp.com (i3125om3.atl.hp.com [15.45.88.72])
	by cosrel2.hp.com (Postfix) with ESMTP id 1D067AB
	for <parisc-linux@thepuffingroup.com>; Tue, 29 Feb 2000 08:28:36 -0700 (MST)
Received: from localhost (root@localhost)
	by i3125om3.atl.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit6.0.6 OpenMail) with SMTP id KAA21480
	for parisc-linux@thepuffingroup.com; Tue, 29 Feb 2000 10:28:41 -0500 (EST)
Date: Tue, 29 Feb 2000 10:28:33 -0500
Message-Id: <H00007e30ee94932@MHS>
Subject: RE: [parisc-linux] zalon
MIME-Version: 1.0
To: gyula_matics@hp.com, parisc-linux@thepuffingroup.com
Content-Type: multipart/alternative; boundary=openmail-part-1f8c2f2f-00000002
List-ID: <linux-parisc.vger.kernel.org>


--openmail-part-1f8c2f2f-00000002
Content-Type: text/plain; charset=ISO-8859-1; name="BDY.RTF"
Content-Disposition: inline; filename="BDY.RTF"
Content-Transfer-Encoding: quoted-printable

I believe Zalon is the chip that drives the f/w scsi on the core io card=

in K series and possible others.

Mike

=2D----Original Message-----
From: gyula_matics@hp.com [mailto:gyula_matics@hp.com]
Sent: Tuesday, February 29, 2000 9:12 AM
To: parisc-linux@thepuffingroup.com
Subject: FW: [parisc-linux] zalon


Hi all,

I'm working on the ncr7xx driver and plan to add support for the
Bluefish GSC SCSI interface. I looked at the Mach kernel and
found that before accessing the c720 it is initializing something
called zalon.

What is that thing? Should one care about it or just blindly do the
same as the Mach kernel does?

Gyula

=2D---------------------------------------------------------------------=
=2D-
=2D--
To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com
with
`unsubscribe' as the subject.


--openmail-part-1f8c2f2f-00000002
Content-Type: application/rtf; name="BDY.RTF"
Content-Disposition: attachment; filename="BDY.RTF"
Content-Transfer-Encoding: base64

e1xydGYxXGFuc2lcYW5zaWNwZzEyNTJcZnJvbXRleHQgXGRlZmYwe1xmb250dGJsDQp7XGYw
XGZzd2lzcyBBcmlhbDt9DQp7XGYxXGZtb2Rlcm4gQ291cmllciBOZXc7fQ0Ke1xmMlxmbmls
XGZjaGFyc2V0MiBTeW1ib2w7fQ0Ke1xmM1xmbW9kZXJuXGZjaGFyc2V0MCBDb3VyaWVyIE5l
dzt9fQ0Ke1xjb2xvcnRibFxyZWQwXGdyZWVuMFxibHVlMDtccmVkMFxncmVlbjBcYmx1ZTI1
NTt9DQpcdWMxXHBhcmRccGxhaW5cZGVmdGFiMzYwIFxmMFxmczIwXGNmMCBJIGJlbGlldmUg
WmFsb24gaXMgdGhlIGNoaXAgdGhhdCBkcml2ZXMgdGhlIGYvdyBzY3NpIG9uIHRoZSBjb3Jl
IGlvIGNhcmQgaW4gSyBzZXJpZXMgYW5kIHBvc3NpYmxlIG90aGVycy5ccGFyDQpccGFyDQpN
aWtlXHBhcg0KXHBhcg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS1ccGFyDQpGcm9tOiBn
eXVsYV9tYXRpY3NAaHAuY29tIFttYWlsdG86Z3l1bGFfbWF0aWNzQGhwLmNvbV1ccGFyDQpT
ZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyOSwgMjAwMCA5OjEyIEFNXHBhcg0KVG86IHBhcmlz
Yy1saW51eEB0aGVwdWZmaW5ncm91cC5jb21ccGFyDQpTdWJqZWN0OiBGVzogW3BhcmlzYy1s
aW51eF0gemFsb25ccGFyDQpccGFyDQpccGFyDQpIaSBhbGwsXHBhcg0KXHBhcg0KSSdtIHdv
cmtpbmcgb24gdGhlIG5jcjd4eCBkcml2ZXIgYW5kIHBsYW4gdG8gYWRkIHN1cHBvcnQgZm9y
IHRoZVxwYXINCkJsdWVmaXNoIEdTQyBTQ1NJIGludGVyZmFjZS4gSSBsb29rZWQgYXQgdGhl
IE1hY2gga2VybmVsIGFuZFxwYXINCmZvdW5kIHRoYXQgYmVmb3JlIGFjY2Vzc2luZyB0aGUg
YzcyMCBpdCBpcyBpbml0aWFsaXppbmcgc29tZXRoaW5nXHBhcg0KY2FsbGVkIHphbG9uLlxw
YXINClxwYXINCldoYXQgaXMgdGhhdCB0aGluZz8gU2hvdWxkIG9uZSBjYXJlIGFib3V0IGl0
IG9yIGp1c3QgYmxpbmRseSBkbyB0aGVccGFyDQpzYW1lIGFzIHRoZSBNYWNoIGtlcm5lbCBk
b2VzP1xwYXINClxwYXINCkd5dWxhXHBhcg0KXHBhcg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
XHBhcg0KVG8gdW5zdWJzY3JpYmU6IHNlbmQgZS1tYWlsIHRvIHBhcmlzYy1saW51eC1yZXF1
ZXN0QHRoZXB1ZmZpbmdyb3VwLmNvbSB3aXRoXHBhcg0KYHVuc3Vic2NyaWJlJyBhcyB0aGUg
c3ViamVjdC5ccGFyDQp9

--openmail-part-1f8c2f2f-00000002--

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from almso2.proxy.att.com (almso2.att.com [192.128.166.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C0A74851
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 09:59:23 -0700 (MST)
Received: from attrh1i.attrh.att.com ([135.71.62.10])
	by almso2.proxy.att.com (AT&T IPNS/MSO-3.0) with ESMTP id g1KGxK915726
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 11:59:21 -0500 (EST)
Received: from occlust04evs1.ugd.att.com (135.71.164.12) by attrh1i.attrh.att.com (5.5.029)
        id 3C62A10C000A9775 for parisc-linux@lists.parisc-linux.org; Wed, 20 Feb 2002 11:59:15 -0500
Date: Wed, 20 Feb 2002 11:59:15 -0500
Message-ID: <28F05913385EAC43AF019413F674A0170148AC2B@OCCLUST04EVS1.ugd.att.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C1BA2F.EDA5BAC2"
From: "Holst, Richard G (Dick), PROSH" <dholst@att.com>
To: "parisc users" <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Parisc linux on a D machine
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

------_=_NextPart_001_01C1BA2F.EDA5BAC2
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When I boot my D server running parisc LInuxLinux .9.3. the graphics =
monitor is the console. I set the hardware path for the console to the =
hardware address of the graphics (vga) card. I get the TUX penguin in =
the upper left of the monitor and all the boot message and all the rc =
startup messages. Just when the system is ready to give me a login =
prompt, the out of the console shift to my serial terminal. I would =
appear that I need a line in my /etc/inittab that will cause the login =
prompt to appear on the graphics monitor. Can someone tell me how to get =
the login prompt to appear on my graphics monitor instead of my serial =
terminal please.


Dick Holst





------_=_NextPart_001_01C1BA2F.EDA5BAC2
Content-Type: text/x-vcard;
	name="Holst, Richard G (Dick), GOVMK.vcf"
Content-Transfer-Encoding: base64
Content-Description: Holst, Richard G (Dick), GOVMK.vcf
Content-Disposition: attachment;
	filename="Holst, Richard G (Dick), GOVMK.vcf"

QkVHSU46VkNBUkQNClZFUlNJT046Mi4xDQpOOkhvbHN0O1JpY2hhcmQNCkZOOkhvbHN0LCBSaWNo
YXJkIEcgKERpY2spLCBHT1ZNSw0KT1JHOkJNIChBVCZUIEJVU0lORVNTIFNFUlZJQ0VTKTtHT1ZN
SyAoQUJTLUdPVkVSTk1FTlQgTUtUUykNClRJVExFOlNFTklPUiBURUNITklDQUwgU1RBRkYgTUVN
QkVSDQpURUw7V09SSztWT0lDRTorMSA3MzIgNDIwLTQ4NDQNClRFTDtDRUxMO1ZPSUNFOiANClRF
TDtQQUdFUjtWT0lDRTogDQpBRFI7V09SSzo7RTUtM0QxODsyMDAgUyBMQVVSRUwgQVZFO01JRERM
RVRPV047Tko7MDc3NDgtMDAwMDtVTklURUQgU1RBVEVTDQpMQUJFTDtXT1JLO0VOQ09ESU5HPVFV
T1RFRC1QUklOVEFCTEU6RTUtM0QxOD0wRD0wQTIwMCBTIExBVVJFTCBBVkU9MEQ9MEFNSURETEVU
T1dOLCBOSiAwNzc0OC0wMDAwPTBEPTBBVU5JVEVEIFNUQT0NClRFUw0KRU1BSUw7UFJFRjtJTlRF
Uk5FVDpkaG9sc3RAYXR0LmNvbQ0KUkVWOjIwMDAxMDIzVDE5NDgzM1oNCkVORDpWQ0FSRA0K

------_=_NextPart_001_01C1BA2F.EDA5BAC2--

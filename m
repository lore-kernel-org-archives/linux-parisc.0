Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ckmso1.proxy.att.com (ckmso1.att.com [12.20.58.69])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6146C4842
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Feb 2002 14:25:53 -0700 (MST)
Received: from attrh1i.attrh.att.com ([135.71.62.10])
	by ckmso1.proxy.att.com (AT&T IPNS/MSO-3.0) with ESMTP id g1DLPjZ27128
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Feb 2002 16:25:45 -0500 (EST)
Received: from occlust04evs1.ugd.att.com (135.71.164.12) by attrh1i.attrh.att.com (5.5.029)
        id 3C62A10C00057E93 for parisc-linux@lists.parisc-linux.org; Wed, 13 Feb 2002 16:25:40 -0500
Date: Wed, 13 Feb 2002 16:25:37 -0500
Message-ID: <28F05913385EAC43AF019413F674A01701380082@OCCLUST04EVS1.ugd.att.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C1B4D4.FADA29B4"
From: "Holst, Richard G (Dick), PROSH" <dholst@att.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] parisc-linux on a D server
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

------_=_NextPart_001_01C1B4D4.FADA29B4
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Folks,

I too have managed to get 0.9.3 ISO image to load and run on my D350 =
thanks to Stephen Roylance a member of this mailing list.

My question and or problem now is trying to get the console to come up =
and run X windows on the VGA graphics card that is installed in my D =
server.

The HP number of the display adapter is A4081-66009, and I have been =
able to locate it on Google.com as a valid HP part. I have set the =
firmware console path to the hardware path displayed by the "in io" =
command (12/10). The system boots, I get the Penguin in the upper left =
corner of the video display followed by some text. The last message I =
see on the VGA display is about start the Gnome mgr. The output then =
reverts back to the serial terminal and I get a login prompt.

I looked at the messages in the dmesg file, and it tells me that it =
can't find the display. Has anyone else run into the problem? Any help =
or a push in the right direction would be greatly appreciated.

Thanks in advance

Dick Holst


 <<Holst, Richard G (Dick), GOVMK.vcf>>=20

------_=_NextPart_001_01C1B4D4.FADA29B4
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

------_=_NextPart_001_01C1B4D4.FADA29B4--

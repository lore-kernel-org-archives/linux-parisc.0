Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6C084878
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 26 Mar 2004 10:19:50 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1B6uzl-0007Do-00
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 26 Mar 2004 18:19:49 +0100
Date: Fri, 26 Mar 2004 18:19:48 +0100
Message-ID: <40561EAF00008738@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="========/40561EAF00008738/mail.tiscali.be"
Subject: [parisc-linux] David S. Miller's patch fix: N4k: failled to mount /
	rw since initscripts-2.85-12
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--========/40561EAF00008738/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi all,

Here is the corresponding patch for 2.6.5-rc2-pa3:
--- linux-2.6.5-rc2-pa3/arch/parisc/kernel/sys_parisc32.c.orig	2004-03-01
07:47:39.000000000 +0100
+++ linux-2.6.5-rc2-pa3/arch/parisc/kernel/sys_parisc32.c	2004-03-26 17:15:41.300604464
+0100
@@ -651,14 +651,13 @@
 	if (err)
 		goto out;
 
-	if (!type_page) {
-		err = -EINVAL;
-		goto out;
+	if (type_page) {
+		is_smb = !strcmp((char *)type_page, SMBFS_NAME);
+		is_ncp = !strcmp((char *)type_page, NCPFS_NAME);
+	} else {
+		is_smb = is_ncp = 0;
 	}
 
-	is_smb = !strcmp((char *)type_page, SMBFS_NAME);
-	is_ncp = !strcmp((char *)type_page, NCPFS_NAME);
-
 	err = copy_mount_stuff_to_kernel((const void *)(unsigned long)data, &data_page);
 	if (err)
 		goto type_out;
==========><=========

hth,
    Joel

PS1: because of bad wraping of my webmail interface I also attach it, sorry.
PS2: let me know if somebody is still interested by the corresponding 2.4
patch?

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr




--========/40561EAF00008738/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="sys_parisc32.c.diff"

LS0tIGxpbnV4LTIuNi41LXJjMi1wYTMvYXJjaC9wYXJpc2Mva2VybmVsL3N5c19wYXJpc2MzMi5j
Lm9yaWcJMjAwNC0wMy0wMSAwNzo0NzozOS4wMDAwMDAwMDAgKzAxMDAKKysrIGxpbnV4LTIuNi41
LXJjMi1wYTMvYXJjaC9wYXJpc2Mva2VybmVsL3N5c19wYXJpc2MzMi5jCTIwMDQtMDMtMjYgMTc6
MTU6NDEuMzAwNjA0NDY0ICswMTAwCkBAIC02NTEsMTQgKzY1MSwxMyBAQAogCWlmIChlcnIpCiAJ
CWdvdG8gb3V0OwogCi0JaWYgKCF0eXBlX3BhZ2UpIHsKLQkJZXJyID0gLUVJTlZBTDsKLQkJZ290
byBvdXQ7CisJaWYgKHR5cGVfcGFnZSkgeworCQlpc19zbWIgPSAhc3RyY21wKChjaGFyICopdHlw
ZV9wYWdlLCBTTUJGU19OQU1FKTsKKwkJaXNfbmNwID0gIXN0cmNtcCgoY2hhciAqKXR5cGVfcGFn
ZSwgTkNQRlNfTkFNRSk7CisJfSBlbHNlIHsKKwkJaXNfc21iID0gaXNfbmNwID0gMDsKIAl9CiAK
LQlpc19zbWIgPSAhc3RyY21wKChjaGFyICopdHlwZV9wYWdlLCBTTUJGU19OQU1FKTsKLQlpc19u
Y3AgPSAhc3RyY21wKChjaGFyICopdHlwZV9wYWdlLCBOQ1BGU19OQU1FKTsKLQogCWVyciA9IGNv
cHlfbW91bnRfc3R1ZmZfdG9fa2VybmVsKChjb25zdCB2b2lkICopKHVuc2lnbmVkIGxvbmcpZGF0
YSwgJmRhdGFfcGFnZSk7CiAJaWYgKGVycikKIAkJZ290byB0eXBlX291dDsK

--========/40561EAF00008738/mail.tiscali.be--

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC5C44829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 05:48:17 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18PMZX-00016Y-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 13:48:11 +0100
Date: Fri, 20 Dec 2002 13:48:00 +0100
Message-ID: <3E0085D0000004FA@ocpmta5.freegates.net>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] 2.4.21-pre2 : sysctl.h pb
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

Hi all,

Merging 2.4.21-pre2 with parisc tree, I notice the following the followin=
g
pb:
diff -urN linux-2.4.21-pre1/include/linux/sysctl.h linux-2.4.21-pre2/incl=
ude/linux/sysctl.h
--- linux-2.4.21-pre1/include/linux/sysctl.h    Thu Nov 28 15:53:15 2002
+++ linux-2.4.21-pre2/include/linux/sysctl.h    Wed Dec 18 14:16:28 2002
@@ -124,6 +124,7 @@
        KERN_CORE_USES_PID=3D52,          /* int: use core or core.%pid *=
/
        KERN_TAINTED=3D53,        /* int: various kernel tainted flags */=

        KERN_CADPID=3D54,         /* int: PID of the process to notify on=

CAD */
+       KERNhttp://webmail.tiscali.be/mail/MessageCompose?sid=3DF39CE574C=
27DDBCF1206D1BB891159045C80B6DB&userid=3Djsoe0708@tiscali.be&seq=3DC&auth=
=3D3WR5O5FJOCJG1FDS&style=3Dfrans&abcompose=3D0
:: envoyer_CORE_PATTERN=3D56,   /* string: pattern for core-files */
 };


into linux-2.4.21-pre1-pa15/include/linux/sysctl.h
        KERN_TAINTED=3D53,        /* int: various kernel tainted flags */=

        KERN_CADPID=3D54,         /* int: PID of the process to notify on=

CAD */
        KERN_HPPA_PWRSW=3D55,     /* int: hppa soft-power enable */
        KERN_HPPA_UNALIGNED=3D56, /* int: hppa unaligned-trap enable */
};
                            ^^^^ same as new KERN_CORE_PATTERN

What should I to do?

Joel



*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be

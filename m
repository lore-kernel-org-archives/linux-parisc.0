Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id CEDDE4829
	for <parisc-linux@parisc-linux.org>; Thu,  2 Jan 2003 10:04:23 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18U8lQ-00040G-00
	for <parisc-linux@parisc-linux.org>; Thu, 02 Jan 2003 18:04:12 +0100
Date: Thu, 2 Jan 2003 18:04:01 +0100
Message-ID: <3DED9BF500003DF9@ocpmta8.freegates.net>
From: jsoe0708@tiscali.be
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] squid-2.xx dpkg failled to fork on pl (follow up)
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

This small mail to mentionned that I reach to make squid operational on
a linux-2.4.20-pa17 thanks to the following tips:

in debian rules replace statement
    ac_cv_func_setresuid=3Dno \
by 
    ac_cv_func_setresuid=3Dyes \

so that function leave_suid() [into src/tools.c] will use setresuid() in
place of seteuid() before launch fork(). 

Is it a know problem on palinux?

Greetings,
    Joel


********************************************
Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation =3D 0 Euro http=
://adsl.tiscali.be

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2B484829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Dec 2002 09:35:04 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18QVXf-0003jV-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Dec 2002 17:34:59 +0100
Date: Mon, 23 Dec 2002 17:34:27 +0100
Message-ID: <3DED9BBD00002FDE@ocpmta7.freegates.net>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] 2.4.20-paxx Config problem (follow-up)
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

The problem I met with arch/parisc/32 on my b2k is due to the CONFIG_SERI=
AL_NONSTANDARD
(or a subselect ??).

Is PDC_console does not work on this model or is there a border effect li=
nk
with this selection?

Can somebody help me to fix it?

Thanks,
    Joel


********************************************
Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation =3D 0 Euro http=
://adsl.tiscali.be

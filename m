Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8057A4829
	for <parisc-linux@parisc-linux.org>; Thu,  9 Jan 2003 04:25:19 -0700 (MST)
Date: Thu, 9 Jan 2003 12:24:39 +0100
Message-ID: <3E082C0A00001EC1@ocpmta4.freegates.net>
In-Reply-To: <3DED9BF500003DF9@ocpmta8.freegates.net>
From: jsoe0708@tiscali.be
To: parisc-linux@parisc-linux.org
Cc: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	"Randolph Chung" <randolph@tausq.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] glibc or kernel problem?
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

Hello Carlos, Dave, Randolph, ...

>-- Original Message --
>From: jsoe0708@tiscali.be
>To: parisc-linux@parisc-linux.org
>Subject: [parisc-linux] squid-2.xx dpkg failled to fork on pl (follow up=
)
>Date: Thu, 2 Jan 2003 18:04:01 +0100
>
>
>Hi all,
>
>This small mail to mentionned that I reach to make squid operational on
>a linux-2.4.20-pa17 thanks to the following tips:
>
>in debian rules replace statement
>    ac_cv_func_setresuid=3Dno \
>by
>    ac_cv_func_setresuid=3Dyes \
>
>so that function leave_suid() [into src/tools.c] will use setresuid() in=

>place of seteuid() before launch fork().
>
>Is it a know problem on palinux?
>
I come back to you with this problem because it just supply a solution fo=
r
this problem and do not explain me the reason.

I do not reach to know if it is a problem with seteuid() (IIRC in glibc)
or a kernel problem.

I already try to get a coredump, but it seems that in this case (fork SEG=
V)
linux (SQUID FAQ) is not able to produce any coredump [what I unfortunalt=
ely
verify during numeruous test].

Is somebody have any better idea to help me to have a better idea of the
actula problem?

Thanks in advance,
    Joel


********************************************
Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation =3D 0 Euro http=
://adsl.tiscali.be

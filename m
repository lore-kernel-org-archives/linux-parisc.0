Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5EACC489B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  5 Feb 2004 08:29:37 -0700 (MST)
Date: Thu, 5 Feb 2004 16:29:34 +0100
Message-ID: <40153061000092CC@ocpmta1.freegates.net>
In-Reply-To: <20040204182455.1CC11494191@palinux.hppa>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org,
	"James Bottomley" <James.Bottomley@steeleye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
Subject: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 jejb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi James,

>-- Original Message --
>To: parisc-linux-cvs@lists.parisc-linux.org
>Date: Wed,  4 Feb 2004 11:24:55 -0700 (MST)
>From: jejb@parisc-linux.org (James Bottomley)
>Reply-To: parisc-linux@lists.parisc-linux.org
>Subject: [parisc-linux-cvs] linux-2.6 jejb
>
>
>CVSROOT:	/var/cvs
>Module name:	linux-2.6
>Changes by:	jejb	04/02/04 11:24:55
>
>Modified files:
>	arch/parisc/kernel: vmlinux.lds.S 
>	include/asm-parisc: uaccess.h 
>
>Log message:
>Make the exception table writeable (so it can actually be sorted)
>and discard the interpreter section

Unfortunately it doesn't help for the pb of 2.6.[12] running 64bits on b2k
as decribe in a early mail (<http://lists.parisc-linux.org/pipermail/parisc-linux/2004-January/022238.html>)
I always have to revert the mentioned patch to make it works??

I sure it is just a work around but I haven't enough knowledge (sorry) to
fix it.

I already test another patch which Randolph suggest me (<http://lists.parisc-linux.org/pipermail/parisc-linux/2004-February/022259.html>)
but it doesn't work?

Any idea?

Thanks in advance for your attention,
    Joel

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr

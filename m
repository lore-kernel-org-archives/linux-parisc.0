Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from orion.netbank.com.br (orion.netbank.com.br [200.203.199.90])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F3E1482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 09:49:41 -0600 (MDT)
Date: Fri, 18 Jul 2003 12:51:29 -0300
From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] arch/parisc/kernel/perf_asm.o not building
Message-ID: <20030718155128.GE1582@conectiva.com.br>
References: <20030718041440.GZ1582@conectiva.com.br> <200307180538.h6I5cdAI024133@hiauly1.hia.nrc.ca> <20030718132619.524d8304.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030718132619.524d8304.varenet@esiee.fr>
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

Em Fri, Jul 18, 2003 at 01:26:19PM +0200, Thibaut VARENE escreveu:
> On Fri, 18 Jul 2003 01:38:39 -0400 (EDT)
> "John David Anglin" <dave@hiauly1.hia.nrc.ca> wrote:
> 
> > > 2.6-bk (i.e. latest linus tree in master.kernel.org), using the
> > > xc-20020118.tar.bz2 cross compiler (latest):
> > 
> > This doesn't work as it doesn't have all the necessary parisc-linux
> > patches.  Use the parisc-linux source.
> > 
> 
> fyi, there's a 3.0.4 xc for i686 (as well as many other platform) on
> pateam:
> http://pateam.esiee.fr/download.html

Thanks, I'm updating it now, just for the record, another thing I've noticed:

===== drivers/char/vt.c 1.53 vs edited =====
--- 1.53/drivers/char/vt.c	Fri Jun 20 17:16:20 2003
+++ edited/drivers/char/vt.c	Fri Jul 18 12:45:57 2003
@@ -2371,7 +2371,7 @@
 /*
  * Turn the Scroll-Lock LED off when the console is started
  */
-static void con_start(struct tty_struct *tty)
+void con_start(struct tty_struct *tty)
 {
 	int console_num;
 	if (!tty)

Will download the diff Willy pointed out and try again with the new xc.

- Arnaldo

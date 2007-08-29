From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [parisc-linux] [PATCH] Prefix each line of multiline
 printk(KERN_<level> "foo\nbar") with KERN_<level>
Date: Wed, 29 Aug 2007 12:22:41 +0100 (BST)
Message-ID: <Pine.LNX.4.64N.0708291205020.26167__22491.8685773902$1416624644$gmane$org@blysk.ds.pg.gda.pl>
References: <1187999098.32738.179.camel@localhost>
	<Pine.LNX.4.64.0708261028120.31149@anakin>
	<8bd0f97a0708260354xb4c8546od0cc19a590820f32@mail.gmail.com>
	<Pine.LNX.4.64.0708261305020.31149@anakin>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: linux-ide@vger.kernel.org,
 discuss@x86-64.org,
 linux-scsi@vger.kernel.org,
 Mike Frysinger <vapier.adi@gmail.com>,
 linux-acpi@vger.kernel.org,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 uclinux-dist-devel@blackfin.uclinux.org,
 cluster-devel@redhat.com,
 blinux-list@redhat.com,
 tpmdd-devel@lists.sourceforge.net,
 linux-mips@linux-mips.org,
 jffs-dev@axis.com,
 mpt_linux_developer@lsi.com,
 Joe Perches <joe@perches.com>,
 linux-mtd@lists.infradead.org,
 osst-users@lists.sourceforge.net,
 linux-mm@kvack.org,
 parisc-linux@parisc-linux.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.64.0708261305020.31149@anakin>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 26 Aug 2007, Geert Uytterhoeven wrote:

> What I mean is that probably there used to be a printk() call starting with
> `\n'. Then someone added a `KERN_ERR' in front of it.

 I gather '\n' at the beginning is to assure the following line is output 
on a separate line rather than as a continuation of another one which may 
have been output without a trailing '\n'.  A situation where printk() is 
called with a string containing no trailing '\n' may be discouraged, but 
there are some more or less justified exceptions.  For example the SCSI 
disk spin-up code is one.

 Therefore it may be reasonable for more critical messages -- perhaps not 
ones at KERN_ERR, but certainly KERN_CRIT and higher ones -- that may 
potentially happen asynchronously to start with '\n'.  In this case a call 
would look like this:

	printk("\n" KERN_CRIT "The actual message.\n");

Of course based on "console_loglevel" and "default_message_level" the 
leading '\n' may still get swallowed from what gets printed to the console 
terminal, but in reality I do not think that poses a problem, as these 
both can be set by a system administrator according to the local policy.

  Maciej
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

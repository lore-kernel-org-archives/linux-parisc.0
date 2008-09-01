From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fix typo in arch/parisc/hpux/fs.c
Date: Mon, 01 Sep 2008 22:28:58 +0200
Message-ID: <48BC508A.8000506@gmx.de>
References: <20080902034327.2c66cda5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Linus <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080902034327.2c66cda5.sfr@canb.auug.org.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Stephen Rothwell wrote:
> A parisc allmodconfig build produces this:
> 
> arch/parisc/hpux/fs.c:107: error: 'buffer' undeclared (first use in this function)
> 
> Introduced by commit da574983de9f9283ba35662c8723627096e160de ("[PATCH]
> fix hpux_getdents()").
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks Stephen.
The same bug/patch is already tracked in bugzilla 11461:

Rafael J. Wysocki wrote:
 > This message has been generated automatically as a part of a report
 > of recent regressions.
 >
 > The following bug entry is on the current list of known regressions
 > from 2.6.26.  Please verify if it still should be listed and let me know
 > (either way).
 >
 >
 > Bug-Entry	: http://bugzilla.kernel.org/show_bug.cgi?id=11461
 > Subject		: build breakage
 > Submitter	: Helge Deller <deller@gmx.de>
 > Date		: 2008-08-30 10:34 (1 days old)
 > References	: http://marc.info/?l=linux-kernel&m=122009254918593&w=4
 > Handled-By	: Helge Deller <deller@gmx.de>
 > Patch		: http://marc.info/?l=linux-kernel&m=122009254918593&w=4

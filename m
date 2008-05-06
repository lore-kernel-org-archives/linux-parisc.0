From: Adrian Bunk <bunk@kernel.org>
Subject: parisc DISCONTIGMEM compile breakage
Date: Tue, 6 May 2008 16:46:48 +0300
Message-ID: <20080506134648.GA30082@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Mel Gorman <mel@csn.ul.ie>, Christoph Lameter <clameter@sgi.com>,
	Lee Schermerhorn <lee.schermerhorn@hp.com>,
	kyle@parisc-linux.org, matthew@wil.cx, grundler@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 54a6eb5c4765aa573a030ceeba2c14e3d2ea5706
(mm: use two zonelist that are filtered by GFP mask)
causes the following build error with CONFIG_DISCONTIGMEM=y
on parisc:

<--  snip  -->

...
  CC      arch/parisc/mm/init.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/arch/parisc/mm/init.c: In function 'show_mem':
/home/bunk/linux/kernel-2.6/git/linux-2.6/arch/parisc/mm/init.c:609: error: too few arguments to function 'node_zonelist'
make[2]: *** [arch/parisc/mm/init.o] Error 1

<--  snip  -->

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


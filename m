From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] 2.6.11-rc1-pa3 rp3440 BUG at kernel/workqueue.c:132
Date: Wed, 19 Jan 2005 00:35:57 -0800
Message-ID: <20050119083556.GF18497@tausq.org>
References: <20050119074927.GB3879@colo.lackof.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050119074927.GB3879@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The odd thing is the "more memory ranges than we support" message
> is out of place since DISCONTIGMEM is enabled.

are you sure you are booting the kernel you think you are booting?
because all the messages you pasted are consistent with a
non-DISCONTIGMEM kernel.

> model 9000/800/rp3440  
> This Machine has more memory ranges than we support!
> Some memory will not be used!
> parisc_cache_init: Only equivalent aliasing supported!
> Total Memory: 1024 Mb
> SMP: bootstrap CPU ID is 0
> Built 1 zonelists
^^^^^^^^^^^^^^^^^^^ <- this means not DISCONTIGMEM

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp009pub.verizon.net (unknown [206.46.170.188])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86C36482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Nov 2001 18:51:05 -0700 (MST)
Received: from verizon.net ([151.201.224.254])
	by smtp009pub.verizon.net  with ESMTP
	for <parisc-linux@lists.parisc-linux.org>; id fAE1pCk05794
	Tue, 13 Nov 2001 19:51:12 -0600 (CST)
Message-ID: <3BF1CE73.40403@verizon.net>
Date: Tue, 13 Nov 2001 20:52:51 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Update: Current kernel from CVS does not build
References: <200111121634.JAA24960@puffin.external.hp.com> <20011114010355.50AD5482C@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Yes the kernel boots, I can see the boot messages, but the STI console 
still does not accept keyboard input at the login prompt at the end.

There is still an inconsistency between the pdc_con.c and printk.c 
files. pdc_cons.c uses the variables log_end and con_start, which are 
declared static in printk.c. Commenting out their use in pdc_con.c lets 
me finish the compilation, but as I said I can't type anything.

By the way, I can see the keyboard interrupts in /proc.
-- 
      Rafael

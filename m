Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2CB4F4843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 22:58:52 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 6F51D29804D
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 22:58:51 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 28479-01 for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 22:58:50 -0700 (MST)
Date: Fri, 16 Jan 2004 22:58:50 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040117055850.GA28550@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] explicitly allocate executable pages?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Could someone explain the following code in arch/parisc/mm/init.c?

The #warning doesn't make sense to me since it's inside !defined()
for the thing it's talking about.

thanks,
grant

...
#if !defined(CONFIG_STI_CONSOLE)
#warning STI console should explicitly allocate executable pages but does not
                                /*
                                 * Map the fault vector writable so we can
                                 * write the HPMC checksum.
                                 */
                                if (address >= ro_start && address < ro_end
                                                        && address != fv_addr
                                                        && address != gw_addr)
                                    pte = __mk_pte(address, PAGE_KERNEL_RO);
                                else
#endif
...

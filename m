Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (unknown [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B47E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 09:17:00 -0600 (MDT)
Date: Thu,  6 Jun 2002 10:15:10 -0500
Message-Id: <200206061015.AA1918763488@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Installing a Second Network Card
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

I may have answered my own questions, do I need to add a line 
to palo.conf analogous to this line for lilo?

Enable multiple ethernet devices on your machine by adding this line to your /etc/lilo.conf, and re-run lilo: append = "ether=0,0,eth1"

---------- Original Message ----------------------------------
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
Date:  Wed,  5 Jun 2002 20:17:01 -0500

>I have another network out of a C180, and I stuck it into mine, but
>I cannot figure out how to get it to show up in Linux.
>
>Thanks,
>-Marc
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

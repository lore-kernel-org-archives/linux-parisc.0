Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id KAA20813
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 10:59:15 -0500
Received: from mailhost.rsn.hp.com (root@idiot.rsn.hp.com [15.99.200.11])
	by palrel3.hp.com (8.8.6 (PHNE_14041)/8.8.5tis) with ESMTP id HAA07484
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 07:59:28 -0800 (PST)
Received: from helgaaspc.rsn.hp.com (root@helgaaspc.rsn.hp.com [15.99.148.145])
	by mailhost.rsn.hp.com (8.8.6 (PHNE_14041)/8.8.6) with ESMTP id JAA04100
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 09:59:01 -0600 (CST)
Received: from helgaaspc.rsn.hp.com (helgaas@localhost [127.0.0.1])
	by helgaaspc.rsn.hp.com (8.8.7/8.8.7) with ESMTP id JAA07530
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 09:59:01 -0600
Message-Id: <199903251559.JAA07530@helgaaspc.rsn.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Qn on PA-RISC Page tables and TLB 
Date: Thu, 25 Mar 1999 09:59:01 -0600
From: Bjorn Helgaas <helgaas@rsn.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

>	Exact form of these tables is s/w convention. 
>
>Q.	If the format is software convention, does that mean
>	the fields within TLB slots are not defined by Hardware ?

There is no architectural definition of hardware TLB miss handling,
and most PA-RISC processors do not implement it.

On the ones that do support hardware TLB miss handling, the hardware
expects a certain format, and it is essentially the one given in the
examples in the architecture books.  The hardware TLB walker expects
a hash table of PDIR entries (indexed by a function of the space and
offset), and it only looks at the entries in the table.  Hash collisions
are resolved by a linked list, and the hardware does not walk the list;
this is left for the software miss handler.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14A346126
	for <parisc-linux@parisc-linux.org>; Wed,  5 Dec 2001 10:49:55 -0700 (MST)
Received: from puffin (IDENT:grundler@localhost [127.0.0.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA19121
	for <parisc-linux@parisc-linux.org>; Wed, 5 Dec 2001 10:45:15 -0700
Message-Id: <200112051745.KAA19121@puffin.external.hp.com>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.16-pa12 broken on c3000 
In-Reply-To: Message from Randolph Chung <randolph@tausq.org>
   of "Mon, 03 Dec 2001 23:17:59 PST." <20011203231759.K944@tausq.org>
Date: Wed, 05 Dec 2001 10:45:15 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

[ old news - cleaning out my inbox ]

Randolph Chung wrote:
> Looks like -pa12 enabled some #if 0 code in arch/parisc/mm/init.c that
> is causing things to die. Both Grant and I saw ifconfig abort when
> the free_initmem code was enabled. Reverting back to 1.43 worked for
> me...

Fixed. my bad. removed __init in PCI config space code path.

FYI, IOAQ pointed at the culprit: lba_device_present()
Should make debugging this kind of problem easy.

grant

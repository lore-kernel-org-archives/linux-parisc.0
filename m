Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from post.webmailer.de (natpost.webmailer.de [192.67.198.65])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D525482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Dec 2001 05:31:39 -0700 (MST)
Received: from computer (pec-89-129.tnt6.b2.uunet.de [149.225.89.129])
	by post.webmailer.de (8.9.3/8.8.7) with ESMTP id NAA02357
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Dec 2001 13:31:37 +0100 (MET)
Date: Sat, 15 Dec 2001 14:43:25 +0100
From: Joerg Hartmann <J.Hartmann@reinarts.de>
Reply-To: Joerg Hartmann <J.Hartmann@reinarts.de>
Message-ID: <561134811041.20011215144325@reinarts.de>
To: PARISC Linux List <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] gcc on 0.9.3 iso problem
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

Hello PARISC-Linux users,

i installed the debian ISO Version 0.9.3 on a hp9000/720
including the gcc (version 3.0.2).

But if i try to use this gcc i always get an error

hp-tux:/usr/src/samba-2.2.2/source# ./configure
creating cache ./config.cache
checking for gcc... gcc
checking whether the C compiler (gcc -O  ) works... no
configure: error: installation or configuration problem:
           C compiler cannot create executables.

Could someone please explains whats wrong here ?
Do i need another gcc ?
But if so, why is this gcc on the cd ?

Thanks .

-- 
Best regards,
 Joerg                          J.Hartmann@reinarts.de

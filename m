Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99629482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 07:10:24 -0700 (MST)
Message-ID: <3BEBE2BF.3B16901A@esiee.fr>
Date: Fri, 09 Nov 2001 15:05:51 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo problems
References: <20011109154525.A7672@dogbert.localdomain>
Content-Type: text/plain; charset=us-ascii
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

Hi Albert,

	Try not define the EARLY_BOOTUP_DEBUG in arch/parisc/kernel/pdc_cons.c 
-If you see anything, it means that you are not in your kernel=> It
could a palo or palo<->kernel. 
-If you see something, try to find a solution ;-)

Regards, Thomas.

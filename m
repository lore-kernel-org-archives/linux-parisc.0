Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id DCD5F482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 14:31:56 -0700 (MST)
Message-Id: <200111132127.OAA01230@puffin.external.hp.com>
To: Phil Anderson <andersop@bob.ncssm.edu>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] First Time Install on 712/80i 
In-Reply-To: Message from Phil Anderson <andersop@bob.ncssm.edu>
   of "Tue, 13 Nov 2001 16:18:49 EST." <Pine.LNX.4.33.0111131610080.9967-100000@bob.ncssm.edu>
Date: Tue, 13 Nov 2001 14:27:20 -0700
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

Phil Anderson wrote:
> "No modules were found in /target/lib/modules/2.4.0-32 that could be
> configured. Please install the kernel modules first, bu running the
> "Configure Device Driver Modules" step"

BTW, this is a bug in the installer. It should say
"Install Kernel Modules" or something like that instead.

...
> Also, I believe that this is a 64 bit machine, am I right?

Sorry - no.
Please install the 32 bit kernel bits and that msg will go away.

grant

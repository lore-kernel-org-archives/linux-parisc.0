Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5271E482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 23:04:56 -0700 (MST)
Message-Id: <200111100600.XAA01455@puffin.external.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: Jochen Friedrich <jochen@scram.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA stuff now in CVS 
In-Reply-To: Message from Helge Deller <deller@gmx.de>
   of "Sat, 10 Nov 2001 00:06:55 +0100." <20011109230724.D0CAF482C@dsl2.external.hp.com>
Date: Fri, 09 Nov 2001 23:00:45 -0700
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

Helge Deller wrote:
> Now I'm wondering myself how it could have worked here. Maybe I just
> was lucky 
> and the PDC in the 715/64 already did the proper initialization itself ?

lucky most likely. PDC/IODC don't  use interrupts.
I've been told all firmware IO is polled.

grant

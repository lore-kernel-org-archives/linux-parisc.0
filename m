Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFDED482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 13:44:22 -0700 (MST)
Message-Id: <200112122039.NAA11818@puffin.external.hp.com>
To: "James P. Kinney III" <jkinney@localnetsolutions.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Firmware upgraded, STI console problem 
In-Reply-To: Message from "James P. Kinney III" <jkinney@localnetsolutions.com>
   of "12 Dec 2001 14:34:35 EST." <1008185675.31094.49.camel@archimedes.localnetsolutions.com>
Date: Wed, 12 Dec 2001 13:39:17 -0700
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

"James P. Kinney III" wrote:
> Also, my processor is listed in firmware and docs as a PA8000. So why
> not 64-bit cpu. If I boot the 2.4.16-64 kernel, it hangs after the
> "branching" messege screen.=20

You need to build your own 64-bit kernel with "NARROW_PDC" support enabled.
But I totally agree with Matthew on this...don't bother.

grant

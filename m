Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id C115F482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 06:20:56 -0600 (MDT)
Date: Wed, 29 May 2002 08:21:07 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Patrick Caulfield <patrick@tykepenguin.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020529082107.A2794@systemhalted>
References: <20020527001321.A6629@systemhalted> <20020528142736.GA9288@tykepenguin.com> <20020528132933.B31214@systemhalted> <20020529075131.GC9919@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020529075131.GC9919@tykepenguin.com>; from patrick@tykepenguin.com on Wed, May 29, 2002 at 08:51:31AM +0100
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

> > Send your .config?
> Attached

Here's your problem:
...
CONFIG_KDB_OFF=y
...

Either set that to 'CONFIG_KDB_OFF=n'
or boot with 'kdb=on' as a kernel paramter.
(Checkout the help text in the kernel hacking option).

Some of this stuff changed in the latest kdb version.

I'm not sure why the kernel can't find the FW scsi controller.
That will be problem number two :)

c.

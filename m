Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 080354834
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 30 Mar 2004 23:27:42 -0700 (MST)
Date: Tue, 30 Mar 2004 23:27:40 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Prakash Shenoy <mpshenoy@vsnl.com>
Subject: Re: [parisc-linux] HP 9000 Visualize C180 Workstation display does
	not appear.
Message-ID: <20040331062740.GA27418@colo.lackof.org>
References: <20040330175157.GA18103@colo.lackof.org>
	<OFEELBIMFFDMJBJFHICCOEMFCEAA.mpshenoy@vsnl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OFEELBIMFFDMJBJFHICCOEMFCEAA.mpshenoy@vsnl.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Mar 30, 2004 at 08:37:22PM -0500, Prakash Shenoy wrote:
> Thanks for all the help. Sorry to bother you again.

np

> I tried
> 
> 	bo fwscsi.6.0.
> 
> I get this error message:
> 
> ISL booting hp/ux.
> 
> exec failed: cannot find /stand/vmunix or /vmunix.

If ISL is still present, it means the boot blocks from HPUX are
still intact. palo should normally overwrite those.

> Please note that I have formatted both the hard disks and 

Low level SCSI format?
I don't think so.

> installed debian on fwscsi.6.0.
> What may be wrong here?

palo was probably invoked against the wrong disk or not invoked at all.
>From the Debian 3.0 install menu, you did "Make System bootable" step?

If you have both fwscsi.5.0 and fwscsi.6.0 present, linux
will find fwscsi.5.0 first and "name" it /dev/sda.
/dev/sdb will be fwscsi.6.0.

HPUX finds fwscsi.6.0 first and name it something like /dev/dsk/c0t6d0.
And thus until told otherwise, firmware will attempt to boot the HPUX disk
by default.

grant

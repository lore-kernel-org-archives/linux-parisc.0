Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cactus.bheadley.org (d248.focal4.interaccess.com [207.208.139.248])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48237482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jan 2002 10:24:10 -0700 (MST)
Message-ID: <3C3C7C09.8060609@interaccess.com>
Date: Wed, 09 Jan 2002 11:21:13 -0600
From: "Bryan W. Headley" <bheadley@interaccess.com>
MIME-Version: 1.0
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] loading the dump modules: will taint the kernel.
References: <3C3C79B1.2D4AF279@admin.france.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Bruno Vidal wrote:

> 	Hi
> I've created a modules for the dump driver. When loading the
> modules I receive the following message:
> #insmod dump
> Using /lib/modules/2.4.17-pa3/kernel/drivers/dump/dump.o
> Warning: loading /lib/modules/2.4.17-pa3/kernel/drivers/dump/dump.o will taint the kernel: no license
> 
> But everything seems okay, the modules is here, everything is here ???
> What means this message ?
> 
> 	thanks.
> 
> 

Did you/Are you releasing this module under a GPL license? Then add to 
the source,

MODULE_AUTHOR("James Bottomley");
MODULE_DESCRIPTION("lasi700 SCSI Driver");
MODULE_LICENSE("GPL");
MODULE_PARM(lasi700, "s");

Of course, change the author, description and parameters. See 
include/linux/modules.h for docs, other macros. The other license types 
are listed in there, too.


-- 
____               .:.                 ____
Bryan W. Headley - bheadley@interaccess.com

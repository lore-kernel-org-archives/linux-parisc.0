Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7ABF6482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 10:53:01 -0700 (MST)
To: Paul Bame <bame@riverrock.org>
Cc: Richard Allen <ra@hp.is>, parisc-linux@lists.parisc-linux.org,
	taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] What does this one mean ? 
In-Reply-To: Your message of "Mon, 19 Nov 2001 10:05:32 MST."
             <m165rrQ-000OrMC@bame.riverrock.org>
References: <20011119163421.A14821@hp.is> <20011119164026.B1835@parcelfarce.linux.theplanet.co.uk> <20011119165320.B14821@hp.is>  <m165rrQ-000OrMC@bame.riverrock.org> 
Date: Mon, 19 Nov 2001 10:52:59 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011119175259.3A21137E86@carmen.fc.hp.com>
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

Paul Bame writes...

> > On Mon, Nov 19, 2001 at 04:40:26PM +0000, Matthew Wilcox wrote:
> > 
> > > On Mon, Nov 19, 2001 at 04:34:22PM +0000, Richard Allen wrote:
> > > > do_page_fault() pid=27461 command='rpm' type=6 address=0x6bc63f53
> > > 
> > > looks like it branched to hyperspace.  "k\AE?S" as a string, so it's
> > > not obviously ascii.  looks like it came from 0x0007c04f, so that might
> > > be a good place to start tracing.
> > 
> > Wow :)   that was fast :)
> > Mmmh.  it doesnt dump core so I can attempt to run it under gdb.
> > or ?    No gdb for parisc ?
> 
> Not sure of the status of core dumps (did you check your shell's 'ulimit'?)
> but gdb works.  Grab sources from http://ftp.parisc-linux.org/cvs/

Or grab a static deb from

ftp://ftp.parisc-linux.org/unofficial-debs/gdb-hppa_5.0-4.pehc.2_hppa.deb

We can't do official debs until gdb is merged up to current upstream cvs.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation

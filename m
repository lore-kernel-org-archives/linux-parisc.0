Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sccrmhc02.attbi.com (sccrmhc02.attbi.com [204.127.202.62])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48AF2482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 09:12:15 -0700 (MST)
Date: Tue, 25 Mar 2003 08:12:07 -0800
From: "H. J. Lu" <hjl@lucon.org>
To: Ryan Bradetich <rbrad@uswest.net>
Cc: Andreas Schwab <schwab@suse.de>, libc-alpha@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] /lib/ld.so.1 (glibc) issues on parisc-linux 2.5 kernel??
Message-ID: <20030325081207.B18730@lucon.org>
References: <1048493134.8777.22.camel@beavis.ybsoft.com> <jeptohumcp.fsf@sykes.suse.de> <20030324184447.GA26572@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030324184447.GA26572@uswest.net>; from rbrad@uswest.net on Mon, Mar 24, 2003 at 11:44:47AM -0700
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

On Mon, Mar 24, 2003 at 11:44:47AM -0700, Ryan Bradetich wrote:
> > hppa is using function descriptors, AFAIK.  So you'll have to do something
> > similar to what ia64 and ppc64 are doing.
> 
> Thanks much for the reply!  I will investigate the function descriptors and
> see if that accounts for the different in offsets.  If so, I just need to
> figure out which side needs to be fixed :)
> 

I posted a patch a long time ago to unify function descriptor handling
such that ia64 and pa-risc don't have to reinvent the wheel.


H.J.

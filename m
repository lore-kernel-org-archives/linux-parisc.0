Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22D1F4843
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  5 May 2004 23:05:19 -0600 (MDT)
Date: Wed, 5 May 2004 22:05:21 -0700
From: Randolph Chung <randolph@tausq.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Message-ID: <20040506050521.GW3965@tausq.org>
References: <20040505204811.27F0C4945E4@palinux.hppa>
	<1083790244.2201.462.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1083790244.2201.462.camel@mulgrave>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > Move to 8 byte Page Table Entries for 32 bit kernels.  This allows us
> > to recover sixteen flag bits (the sixteen bits at the top of the pte for
> > 64 bit - 48 address bits is pretty unlikely to be hit soon) on both 32
> > and 64 bits.

jejb, this seems to have broken the kernel for me. On my c3750, -pa9
doesn't boot (-pa7 is ok). With -pa9 the machine HPMC's very early
during boot (i have early debug turned on, but there was no console
output). 

unfortunately the hpmc data doesn't seem to say very much. iaoq is
pointing to skip_save_ior. rp is 0 :-(

perhaps this is sensitive to amount of physical memory in the system? i
have 1.5GB in my system. 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

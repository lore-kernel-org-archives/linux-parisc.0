Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Fri, 31 May 2002 23:34:59 PDT." <Pine.LNX.4.44.0205312326280.11012-100000@garibaldi.apptechsys.com>
References: <Pine.LNX.4.44.0205312326280.11012-100000@garibaldi.apptechsys.com> 
Date: Sun, 02 Jun 2002 10:32:01 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020602163201.3AE44482A@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> So, at least we can rule out any damage to the box as the cause of this. 

Yup - thanks for trying that.

Offhand, Here are the differences I'm aware of between J5k and c3k:
o 2-CPU vs 1
o cache is 4-way associative vs 1-way (Same PA8500 CPU though!)
o J5K requires newer rev CPU (some SMP-related bugs fixed)
o Same PDC, but probably initializes a few things differently
o Though IO subsystem is identical chip set, J5k has more PCI busses
  and more slots.

Since dirty cache writeback can be sensitive to how busy the system is,
it's possible the HPMC is caused by a similar problem to what we saw
on PA8700 systems. You might try building a kernel with
"ioc_needs_fdc" forced true in arch/parisc/kernel/sba_iommu.c.
If it avoids the HPMC (but we still see other hangs), then it's
a clue we don't have caching working right for that CPU setup.

hth,
grant

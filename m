Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05F4D485C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Jun 2002 20:06:01 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17IgTK-0000M7-00; Fri, 14 Jun 2002 03:05:54 +0100
Date: Fri, 14 Jun 2002 03:05:54 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "Michael S. Zick" <mszick@goquest.com>,
	parisc-linux@lists.parisc-linux.org, mszick@MoreThan.org
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
Message-ID: <20020614030554.I9435@parcelfarce.linux.theplanet.co.uk>
References: <5BA66B90-7D12-11D6-B01F-0030656F07A2@esiee.fr> <20020611145848.GA2796@tausq.org> <02061113393800.04435@localhost.localdomain> <02061208454000.00732@localhost.localdomain> <mszick@goquest.com> <20020613215246.3B1864848@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020613215246.3B1864848@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Jun 13, 2002 at 03:52:46PM -0600
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

On Thu, Jun 13, 2002 at 03:52:46PM -0600, Grant Grundler wrote:
> > Additional note: On the HP models with the worst of the problems;
> > is the physical_cpu_id and the logical_cpu_id a 1:1 mapping as
> > it is on x86 systems?
> 
> Yes. parisc didn't have a concept of physical CPU ID until
> PAT PDC (eg A500, N-class, etc). When we want to support
> CPU addition and removal, we can add physical/logical
> mappings and it will no longer be 1:1.

Actually this came up in an unrelated question today.  I found that
where other architectures use a physical ID, we use an address.  So we
really have no use for logical/physical mappings.  When the CPU hotplug
code is introduced, it will actually remove the logical numbering and
loops over all cpus will be done with loops over all physical cpus and
a check to see whether that cpu is online.

-- 
Revolutions do not require corporate support.

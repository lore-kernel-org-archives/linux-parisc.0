Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAD4B48A0
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 12 Apr 2004 08:29:54 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3CEKPa21034; Mon, 12 Apr 2004 10:20:25 -0400
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20040412043212.GA16377@colo.lackof.org>
References: <200404091438.i39Ec4Q23610@udlkern.fc.hp.com>
	<20040412043212.GA16377@colo.lackof.org>
Content-Type: text/plain
Date: 12 Apr 2004 09:20:25 -0500
Message-Id: <1081779626.2060.14.camel@mulgrave>
Mime-Version: 1.0
Cc: John Marvin <jsm@udlkern.fc.hp.com>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, 2004-04-11 at 23:32, Grant Grundler wrote:
> I was just looking at the pluto "PA_RISC Physical Address Map" and
> all RAM is physically located < 1TB (40 bits).
> Do we have to worry about the GMMIO (MMIO space above 4GB) in
> "F-space" above 1TB?

No, the problem is merely where the page tables go.  They have to be
addressed physically in the page table directories, so if we only allow
for 40 bits of physical addressing, the page tables have to be located
within the first 40 bits of memory.  This doesn't limit the machine
memory size, merely the location of the page tables.

James

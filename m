Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <helge.deller@sap.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: rmmod lasi700 hangs the machine 
In-Reply-To: Message from James Bottomley <James.Bottomley@HansenPartnership.com>
   of "Fri, 28 Dec 2001 21:10:02 CST." <200112290310.fBT3A2x03575@localhost.localdomain>
References: <200112290310.fBT3A2x03575@localhost.localdomain> 
Date: Fri, 28 Dec 2001 22:42:55 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011229054255.0DB8E482A@dsl2.external.hp.com>
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

James Bottomley wrote:
> After applying the kernel down_interruptible fix, the attached should be the 
> final piece of the puzzle.  With it applied (and the previous disable_irq 
> patch discarded), I can insert and remove the module to my heart's content.

Committed both fixes as 2.4.16-pa29.

grant

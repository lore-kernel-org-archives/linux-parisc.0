From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Space registers and how to use them
Date: Wed, 5 Oct 2005 22:59:36 -0600
Message-ID: <20051006045936.GA27034@colo.lackof.org>
References: <20050925173513.GA22786@colo.lackof.org>
	<200509251803.j8PI3tLI014517@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509251803.j8PI3tLI014517@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 25, 2005 at 02:03:55PM -0400, John David Anglin wrote:
> > John was just saying it doesn't matter since parisc-linux uses
> > the same value in all four (sr4-7) space registers.
> 
> It's possible for user code to mess with sr4.  It's not a
> privileged register.

Certainly. But in the kernel those are KERNEL_SPACE (zero).
We save/restore the user space values for sr4-7.
We clear sr4-sr7 in linux_gateway_entry (arch/parisc/kernel/syscall.S)
for syscalls.  We do the same for interrupts in virt_map macro in entry.S.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

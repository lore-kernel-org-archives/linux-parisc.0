From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 11:43:15 -0600
Message-ID: <200408311143.15493.bjorn.helgaas@hp.com>
References: <1093923097.3870.18.camel@mulgrave>
	<200408310913.47637.bjorn.helgaas@hp.com>
	<1093973378.3642.5.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1093973378.3642.5.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tuesday 31 August 2004 11:29 am, James Bottomley wrote:
> On Tue, 2004-08-31 at 11:13, Bjorn Helgaas wrote:
> > You could support 32 (or 64) interrupts per processor if you wanted to,
> > though I think right now it's only 32 or 64 for the whole system.
> 
> Yes, but in order to do the affinity thing, we have to make it appear as
> if a single interrupt vector potentially belongs to all CPUs...

Ah, right.  But for large machines, it might be useful to have multiple
interrupt domains.  We're already pushing the ia64 limit of about 180
available vectors.  All the CPUs in a node could share a vector space,
so you could have affinity at least to CPUs close to the device.  Dunno
how that fits with the current affinity interfaces, though.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

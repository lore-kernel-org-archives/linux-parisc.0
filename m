From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: 31 Aug 2004 13:29:32 -0400
Message-ID: <1093973378.3642.5.camel@mulgrave>
References: <1093923097.3870.18.camel@mulgrave>
	<200408310913.47637.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408310913.47637.bjorn.helgaas@hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2004-08-31 at 11:13, Bjorn Helgaas wrote:
> You could support 32 (or 64) interrupts per processor if you wanted to,
> though I think right now it's only 32 or 64 for the whole system.

Yes, but in order to do the affinity thing, we have to make it appear as
if a single interrupt vector potentially belongs to all CPUs...

> Strictly speaking, iosapics are programmed with a 16-bit ID/EID (not
> an actual EIRR address) and an 8-bit vector (not a 5- or 6-bit bit
> number.)  I think the chipset is responsible for routing the ID/EID
> to the correct processor, and on parisc, probably only 32 (or 64) of
> the 256 possible vectors are usable.  I would guess that in addition
> to routing based on ID/EID, the chipset also translates the vector
> number to a 2^vector mask in the form the EIRR expects.

Yes, I'm sorry, sloppy terminology.  I don't actually have any iosapic
based machines, so I only had to muck with the iosapic once getting an
a500 SMP working...I was going from memory instead of actually looking
in the code.

> I think it would be good if parisc adopted the more generic concepts,
> because it's a shame that ia64 and parisc have such totally different
> code to drive the identical iosapic hardware.

I agree.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 09:13:47 -0600
Message-ID: <200408310913.47637.bjorn.helgaas@hp.com>
References: <1093923097.3870.18.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: James Bottomley <James.Bottomley@SteelEye.com>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1093923097.3870.18.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Monday 30 August 2004 9:31 pm, James Bottomley wrote:
> This arrangement means that parisc has 32 distinct interrupts for a 32
> bit kernel and 64 on a 64 bit kernel. 

You could support 32 (or 64) interrupts per processor if you wanted to,
though I think right now it's only 32 or 64 for the whole system.

> The newer iosapic interrupt controllers don't require
> this because every device attached to the iosapic can be programmed
> directly with a CPU EIRR address and bit number. 

Strictly speaking, iosapics are programmed with a 16-bit ID/EID (not
an actual EIRR address) and an 8-bit vector (not a 5- or 6-bit bit
number.)  I think the chipset is responsible for routing the ID/EID
to the correct processor, and on parisc, probably only 32 (or 64) of
the 256 possible vectors are usable.  I would guess that in addition
to routing based on ID/EID, the chipset also translates the vector
number to a 2^vector mask in the form the EIRR expects.

I think it would be good if parisc adopted the more generic concepts,
because it's a shame that ia64 and parisc have such totally different
code to drive the identical iosapic hardware.

> This scheme should move us entirely over to the use of generic interrupt
> descriptors and allow the affinity setting of those interrupts which are
> susceptible to it (namely only the directly accessible EIRR interrupts).
> Any comments before I actually try this?

I think this is great (though I don't know all the details of parisc
interrupt controllers).
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

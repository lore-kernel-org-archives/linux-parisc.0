From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
	tst-fork1.
Date: Fri, 23 Feb 2007 18:19:08 -0600
Message-ID: <1172276348.3424.80.camel__5861.58105074919$1416624310$gmane$org@mulgrave.il.steeleye.com>
References: <119aab440702201034i501f5986l3381456035de0699@mail.gmail.com>
	<1172265809.3424.75.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172265809.3424.75.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2007-02-23 at 15:23 -0600, James Bottomley wrote:
> Which means that somehow a TLB entry got inserted for address
> 00000000000aac8c in space 00000000000e2800 which didn't have the correct
> Access ID (which for us should have been the space 00000000000e2800).
> 
> Or, that %cr8 somehow doesn't contain the space 00000000000e2800 ... but
> I think that's a bit more unlikely.

Actually, I've changed my mind ... I don't think there's any way we can
get the TLB marked with the wrong Access ID (but if we do there's no way
to get it out of the fault data).  Could you add a printout of %cr8 and
current->comm to the data for the protection id trap in
arch/parisc/kernel/traps.c and tell me what it prints?

Thanks,

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [RFT] Remove {,un}mask_irq()
Date: Mon, 6 Dec 2004 10:46:28 -0700
Message-ID: <20041206174628.GB10915@colo.lackof.org>
References: <20041206041014.GL15450@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041206041014.GL15450@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 06, 2004 at 04:10:14AM +0000, Matthew Wilcox wrote:
> mask_irq/unmask_irq are no longer part of the kernel API.

IIRC, there was a semantic difference between unmask IRQ and enable_irq().
The former preserved pending interrupts and the latter did not.
Did the semantics change or am I not remembering correctly?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] tiny iosapic abstraction
Date: Wed, 30 Jun 2004 23:44:31 -0600
Message-ID: <20040701054431.GA18499@colo.lackof.org>
References: <200406281257.06793.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200406281257.06793.bjorn.helgaas@hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 28, 2004 at 12:57:06PM -0600, Bjorn Helgaas wrote:
> Introduce a tiny bit of abstraction to parisc iosapic.c.
> 
> This makes more obvious the two reads to flush previous writes to the
> hardware in iosapic_wr_irt_entry().  ia64 does neither one (perhaps
> because we don't share vectors yet).  But even if the flush is really
> needed on parisc, wouldn't only the second be needed, i.e.:

Yes. that's correct.
But the flush has nothing to do with sharing vectors.
It's just to guarantee HW sees writes before returning
to the driver. Probably falls into the EIANAL error bucket
but it's not in the performance path.

Patch looks good. I'll apply and commit.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [PATCH] ioremap balanced with iounmap for
	drivers/parisc
Date: Thu, 28 Sep 2006 07:14:52 -0600
Message-ID: <20060928131452.GA5017__43845.4632102095$1416624601$gmane$org@parisc-linux.org>
References: <1159422814.9310.17.camel@amol.verismonetworks.com>
	<20060928125815.GA3507@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>,
 Amol Lad <amol@verismonetworks.com>,
 parisc-linux@parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060928125815.GA3507@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Sep 28, 2006 at 08:58:15AM -0400, Kyle McMartin wrote:
> On Thu, Sep 28, 2006 at 11:23:34AM +0530, Amol Lad wrote:
> > ioremap must be balanced by an iounmap and failing to do so can result
> > in a memory leak.
> > 
> 
> Looks ok. Will merge.

Actually, it shows some areas we need to do better.  It's an
improvement, but look at, eg, the error returns from elroy.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

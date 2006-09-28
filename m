From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] ioremap balanced with iounmap for
	drivers/parisc
Date: Thu, 28 Sep 2006 09:20:35 -0400
Message-ID: <20060928132035.GA3897@athena.road.mcmartin.ca>
References: <1159422814.9310.17.camel@amol.verismonetworks.com>
	<20060928125815.GA3507@athena.road.mcmartin.ca>
	<20060928131452.GA5017@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060928131452.GA5017@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Sep 28, 2006 at 07:14:52AM -0600, Matthew Wilcox wrote:
> Actually, it shows some areas we need to do better.  It's an
> improvement, but look at, eg, the error returns from elroy.
> 

Agreed.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

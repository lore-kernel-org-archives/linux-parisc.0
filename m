From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [PATCH 1/5] Add generic compat_siginfo_t
Date: Tue, 10 Jan 2006 09:39:43 -0700
Message-ID: <20060110163943.GY19769__38986.4748147831$1416623989$gmane$org@parisc-linux.org>
References: <20060108193755.GH3782@tachyon.int.mcmartin.ca>
	<20060109141355.GA22296@lst.de>
	<20060110150141.GE28306@quicksilver.road.mcmartin.ca>
	<20060110151547.GB17621@lst.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org,
 linux-kernel@vger.kernel.org,
 carlos@parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Christoph Hellwig <hch@lst.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060110151547.GB17621@lst.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 10, 2006 at 04:15:47PM +0100, Christoph Hellwig wrote:
> Yes, the is_compat_task helper is a nice thing to have.  I haven't
> needed it for the signal bits I've done yet, but it's also useful
> elsewhere.  But IIRC someone vehemently opposed it in the last round
> of discussion.

Andi's now dropped his opposition, so I think we're fine.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

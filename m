From: Christoph Hellwig <hch@lst.de>
Subject: Re: [parisc-linux] [PATCH 1/5] Add generic compat_siginfo_t
Date: Tue, 10 Jan 2006 16:15:47 +0100
Message-ID: <20060110151547.GB17621__39728.8463580937$1416623989$gmane$org@lst.de>
References: <20060108193755.GH3782@tachyon.int.mcmartin.ca>
	<20060109141355.GA22296@lst.de>
	<20060110150141.GE28306@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 linux-kernel@vger.kernel.org,
 willy@parisc-linux.org,
 carlos@parisc-linux.org,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060110150141.GE28306@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 10, 2006 at 10:01:41AM -0500, Kyle McMartin wrote:
> I agree, I'm really just trying to shepard this home so we don't have
> to maintain it out of tree. I'm not overly attached to the code, if
> I can make parisc64 work with your compat signal bits, I'll be
> just as happy.
> 
> The one thing from this patchset I'd like to keep is the is_compat_task()
> as it does provide nice cleanups 

Yes, the is_compat_task helper is a nice thing to have.  I haven't
needed it for the signal bits I've done yet, but it's also useful
elsewhere.  But IIRC someone vehemently opposed it in the last round
of discussion.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

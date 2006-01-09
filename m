From: Christoph Hellwig <hch@lst.de>
Subject: Re: [parisc-linux] [PATCH 1/5] Add generic compat_siginfo_t
Date: Mon, 9 Jan 2006 15:13:55 +0100
Message-ID: <20060109141355.GA22296__35304.1799543009$1416623987$gmane$org@lst.de>
References: <20060108193755.GH3782@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 willy@parisc-linux.org,
 parisc-linux@lists.parisc-linux.org,
 linux-kernel@vger.kernel.org,
 carlos@parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060108193755.GH3782@tachyon.int.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

-mm already has a much better implementation for compat_sys_timer_create
that doesn't require all the sigevent churn in this patch (which btw
doesn't seem to be mentioned in the changelog at all).  But even with
that remove there seems to be a lot of useless ifdef and indirection
in this patch.  Over the next days I'll send out my generic compat
singal bits which don't require all this, but otoh require every
architecture to supply helpers.  If you can make those generic without
all the ifdef an additional header bits all power to you!

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

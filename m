From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] Security Hole in binfmt_som.c ?
Date: Sun, 31 Aug 2003 00:33:00 +0100
Message-ID: <1062286379.31332.6.camel__16908.7854250849$1416622746$gmane$org@dhcp23.swansea.linux.org.uk>
References: <3F509BBD.2040007@hrzpub.tu-darmstadt.de>
	 <20030830131541.GI13467@parcelfarce.linux.theplanet.co.uk>
	 <1062251389.31150.4.camel@dhcp23.swansea.linux.org.uk>
	 <20030830135933.GJ13467@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030830135933.GJ13467@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sad, 2003-08-30 at 14:59, Matthew Wilcox wrote:
> Um, I can't find it, and neither can Google:
> http://www.google.com/search?q=binfmt_som+security&as_q=%5Bparisc-linux&btnG=Google+Search&as_sitesearch=lists.parisc-linux.org

Humm I thought it was on this list. Maybe lkml then

Whatever the basic problem is we have kernel loaders and
user threads sharing a file table unsafely

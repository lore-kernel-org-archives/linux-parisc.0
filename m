From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Merge status update
Date: Tue, 17 Aug 2004 23:21:00 -0600
Message-ID: <20040818052100.GA4924@colo.lackof.org>
References: <20040814210807.GX12936@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040814210807.GX12936@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Aug 14, 2004 at 10:08:07PM +0100, Matthew Wilcox wrote:
> The remainder:
> -rw-r--r--    1 willy    willy       20803 Aug 14 14:58 one.diff
> is composed of:
...
>  - tulip MII changes that someone needs to engage jgarzik in
>    bare-knuckle boxing over.

akpm (Andrew Morton) said I should send those to him.
My plan was to refresh the two sets of changes I have for tulip that
jgarzik hasn't accepted (because of udelay() calls). Then send those
to akpm + linux-net + jgarzik and ask innocently if there is
a better way to do the udelay() (someone suggested msleep() might be
an option).

> So a lot of minor stuff, but it's still not possible to build parisc
> out of Linus' tree ;-(

Well, don't despair. We really are not that far off.
Just need more time to work on it. I'm starting to feel a need for
another 3month unpaid leave of absence...maybe next summer...

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] NFS problems : kernel panic
Date: Thu, 12 May 2005 09:05:35 -0600
Message-ID: <20050512150535.GB15173@colo.lackof.org>
References: <20050512144617.5b3569d9.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050512144617.5b3569d9.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, May 12, 2005 at 02:46:17PM +0200, Guy Martin wrote:
> 
> Hello guys,
> 
> Many users are reporting me problems with kernel after 2.6.10-pa11.

Just to make sure I understand: 2.6.10-pa11 works fine?
And this NFS problem is with any 2.6.11 kernels?

I ask because 2.6.10-pa11 was the last parisc specific version
and was committed to CVS exactly 4 monthes ago: 2005/01/12

> I've had the problem myself on both my C3600 and my B180L.
> When you upload or download big files via NFS, the kernel crash with no
> more message than :
> Kernel panic - not syncing
> 
> The nfs share can be either udp or tcp. That doesn't matter.
> 
> Is this a know problem ? Is there a workaround (don't tell me samba :) ?

Sorry, I don't.
My advice is to troll for 2.6.11 bug reports on netdev or linux-kernel
mailing lists. Ie. abuse google for "linux 2.6.11 NFS bug" searches
and variants of those (or additional) keywords.

> Feel free to ask if you want more info or if you want me to do some
> tests.

Has anyone tried to reproduce this with 2.6.12-rc3 or -rc4 kernels?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

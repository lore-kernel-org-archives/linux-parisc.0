From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] NFS problems : kernel panic
Date: Thu, 12 May 2005 09:25:37 -0600
Message-ID: <20050512152537.GF15173@colo.lackof.org>
References: <20050512144617.5b3569d9.gmsoft@gentoo.org>
	<20050512150535.GB15173@colo.lackof.org>
	<20050512171404.002d5de6.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050512171404.002d5de6.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, May 12, 2005 at 05:14:04PM +0200, Guy Martin wrote:
> Yes, 2.6.10-pa11 works fine but kernels after this one breaks, up to the
> latest 2.6.12-rc4-pa2 with which I just tried.

ok - that's good to know.

> I should do some test using netcat or any other way to generate a high
> traffic load on the interface. But right now, I only had reports of
> users complaining about NFS.

Yeah, given the samba works, and regular networking I assume works,
someone will have to explain how NFS is different to me.

> Are you able to reproduce the problem ?

I can't try right now. I'm trying to cleanup the uses of RFI
in the asm code and it's working. I should finish that this weekend
and then need to work on mpt/fusion driver HPMC.

If someone else does, please post results.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Thu, 1 Nov 2007 15:21:08 -0600
Message-ID: <20071101212108.GA27994__16356.9280099638$1416624649$gmane$org@colo.lackof.org>
References: <4714E800.50709@scarlet.be>
	<20071017184416.GB11502@fattire.cabal.ca>
	<471A3928.8040603@scarlet.be>
	<20071020172328.GI10429@fattire.cabal.ca>
	<20071022043909.GC11869@colo.lackof.org>
	<472A0A49.8010201@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <472A0A49.8010201@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Nov 01, 2007 at 05:18:01PM +0000, Joel Soete wrote:
> here is short test:
> without udelay:
> # scp vmlinux  jso@patst007:/var/tmp/vmlinux-2.6.23-pa-d32up3

For testing NIC perf, please don't start with scp. Use ftp or something
else that doesn't use encryption. See www.netperf.org and/or iperf.

> Password:
> vmlinux                                                                     
>                100% 4364KB 101.5KB/s   00:43
>
> with udelay:
> # scp vmlinux  jso@patst007:/var/tmp/vmlinux-2.6.23-pa-d32up3
> Password:
> vmlinux                                                                     
>                100% 4364KB 436.4KB/s   00:10
>
> well still far from what we could expect (about 800KB/s) but fwiw something 
> supposing slowdown the kernel improve nic perf?

Yeah, that happens and it's clearly something wrong with the code.
Suggests there is contention either between CPU and IOTLB or between
CPU and IO device for a cacheline(s).

BTW, I'm assuming you have DELAYED_RESOURCE_CNT set to 16 or more.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] SMP kernels for an HP J5600
Date: Mon, 23 Aug 2004 23:01:11 -0600
Message-ID: <20040824050111.GC790@colo.lackof.org>
References: <412A1ACE.3050705@kepier.clara.net> <412A21B9.8070008@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <412A21B9.8070008@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 23, 2004 at 04:56:25PM +0000, Joel Soete wrote:
> >Last week I managed to install debian woody onto an HP J5600, using a 
...
> hmm j5600 is a sister of my b2k (may be can I sent you my .config file to 
> test?)

correct. He should be able to use the linux-2.6 c3000_config file.

> >What is the current recommended stable kernel for this machine, and for 
> >running an smp kernel? Is 2.6.x stable enough on hppa yet?
> >
> A lot of improvement :) (just take care to grab it from 
> <http://cvs.parisc-linux.org/download/>)

2.6 kernels and source tarballs are available here:
	http://cvs.parisc-linux.org/download/linux-2.6/

We currently do not auto-build a 32-bit SMP kernel and that's what
I suggest you try first. Grab the latest source tarball, tweak
arch/parisc/configs/c3000_config to enable SMP, and "make".

Note PARISC SMP support has only recently been fixed in our linux-2.6
tree (thanks jejb, tausq!) and hasn't been broadly tested.

But the same bugs jejb found still exist in 2.4 kernels.
Kyle McMartin is looking at back porting those fixes and could
probably use help with the N4K and "mb() in spinlock()" patches.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Sat, 23 Apr 2005 00:31:39 -0600
Message-ID: <20050423063139.GB857@colo.lackof.org>
References: <20050422063649.GB13389@colo.lackof.org>
	<420889870001E83F@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <420889870001E83F@mail-4-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Apr 22, 2005 at 06:04:03PM +0200, Joel Soete wrote:
> > grundler <509>pwd
> > /usr/src/linux-2.6/arch/parisc/kernel
> > grundler <510>fgrep ssm *.S | fgrep 0,0 | wc -l
> > 337
>
> Do you want I prepare other patches too ?

No, but thanks anyway.

> > My priorities are:
> > o getting pa8800 stable (latest kernels still occasionally segfaults.)
>
> Isn't it related to the generic pb encounter elsewhere?
> (all my system 32bit mainly make from time to time panic: that was in fact
> what I was trying to study, when interruptions are enabled and disabled (PSW
> I bit if I well understand?)...)

I don't know but I'm skeptical it's generic core issue.
If it were generic, I would expect to see similar symptoms on ia64
and x86 and I don't.

> > o get MPT/Fusion driver working on parisc (HPMCs on IOC reset)
> > o MSI support on parisc.
> > o stable ad1889 (workstation audio)
> > o FX-E support (ok, that's wishful thinking now...)
>
> Ah you finaly found some doc ?

No...just the GPL'd FX/5 and FX/10 drivers that have been available
for a long time but don't seem to be sufficient to write a new driver
for parisc.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

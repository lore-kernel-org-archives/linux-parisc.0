From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: HPPA64: badness while freeing init memory
Date: Tue, 30 Sep 2008 11:14:36 -0400
Message-ID: <20080930151436.GB10632@phobos.i.cabal.ca>
References: <Pine.SOC.4.64.0809301312190.18858@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0809301312190.18858@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 30, 2008 at 01:16:34PM +0300, Meelis Roos wrote:
> Just tried 2.6.27-rc8 on a freshly installed HP 9000 L1000-44. With 
> current config it boots fine but emits two badness messages while 
> freeing unused initial memory (dmesg below).
> 
> I'm not subscribed to linux-parisc so please CC: any discussion to me.
> 

It's fine, it's only a warning, and not really any good way to avoid it.
The basic problem is we're firing off an IPI with interrupts off, which
has the possibility of deadlocking, but not in this case.

regards, Kyle

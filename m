From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.10-rc1-pa11 profile data
Date: Thu, 11 Nov 2004 11:36:05 -0700
Message-ID: <20041111183605.GA19327@colo.lackof.org>
References: <20041111075431.GB9768@colo.lackof.org>
	<20041111081154.GR15714@tausq.org>
	<20041111173901.GX2639@baldric.uwo.ca>
	<20041111174258.GT15714@tausq.org>
	<20041111175021.GA26623@parcelfarce.linux.theplanet.co.uk>
	<20041111175933.GU15714@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111175933.GU15714@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Nov 11, 2004 at 09:59:33AM -0800, Randolph Chung wrote:
> sure, we can zero all the call clobbered registers on exit. But not
> having to save all of those pesky floating pointer registers and half a
> dozen general registers should still be a huge win.

Randolph and I talked about this more privately.
In a nutshell, "huge win" is slightly overstating it and we agree
fixing the cache utilization would be a much bigger win.

Randolph thinks we can save 20 load and stores per interrupt
and potential context switches. The thinking is we are saving/restoring
some registers twice and should split the save/restore between
interrupt/trap and context switch code. So if no context switch is
performed, we only save/restore a subset of the registers manually
and the rest are preserved according to the ABI.
Did I get that right?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

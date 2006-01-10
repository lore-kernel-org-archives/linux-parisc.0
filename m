From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Re: [Update] TLS toolchain.
Date: Tue, 10 Jan 2006 10:00:57 -0500
Message-ID: <20060110150057.GD28306@quicksilver.road.mcmartin.ca>
References: <20060108055109.GE17559@baldric.uwo.ca>
	<43C36337.9040202@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
 parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43C36337.9040202@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 10, 2006 at 03:33:11PM +0800, Randolph Chung wrote:
> I don't think we are ready for NPTL yet. Did we settle on how we are
> implementing futexes? Are we going to implement a new kernel fsyscall
> for the compare-and-exchange primitive that NPTL seems to depend on?
>

Has any thought been given to doing this via a VDSO or something that
the kernel links in? Excuse my ignorance, but this seems like a good
way to work around kernel version dependancy using straight LWS would
result in (I believe?).

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

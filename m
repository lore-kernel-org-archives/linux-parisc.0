Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 20 Sep 2003 18:04:47 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] sched_clock implementation
Message-ID: <20030921000447.GC31268@dsl2.external.hp.com>
References: <20030918203510.GD21596@parcelfarce.linux.theplanet.co.uk> <3F6B2199.8050402@tiscali.be> <20030919160035.GG18225@systemhalted> <3F6C9622.60402@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F6C9622.60402@tiscali.be>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Sep 20, 2003 at 06:02:10PM +0000, Joel Soete wrote:
> a quick look into paxx.pdf which about CR16 speak of "peak instruction 
> rate" but do not define anywhere?
> I presume that is the cpu clock but would like somebody confirm.

Read about "Interval Timer" (cr16) in the PA 2.0 Arch book.
PDC provides the exact rate that CR16 is changing.
Looks like PDC_TOD_ITIMER is the call but I'm not sure offhand.
In any case, I've only seen it used as CPU cycle counter.
(ie 1:1 with CPU clock).

hth,
grant

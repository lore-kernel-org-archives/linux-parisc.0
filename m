Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 10 Feb 2003 09:47:42 -0700
To: "Aaron St. Pierre" <asp@ungod.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
Message-ID: <20030210164742.GA26525@dsl2.external.hp.com>
References: <20030208222242.AA3554829@dsl2.external.hp.com> <20030208222746.GB19683@dsl2.external.hp.com> <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <20030209031014.GD19683@dsl2.external.hp.com> <20030209122913.G27544@parcelfarce.linux.theplanet.co.uk> <20030209191441.GA21938@dsl2.external.hp.com> <20030209212454.GB924@hadron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030209212454.GB924@hadron>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Sun, Feb 09, 2003 at 04:24:54PM -0500, Aaron St. Pierre wrote:
> In another life Grant Grundler wrote:
> > if people care about the last 5% performance, they still have several
> > options:
> > o build your own kernel
> 
> 	As far as you know am I the only person, that has reported not being
> 	able to boot a 2.4.20-pa?? kernel compiled either natively or cross ? 

yes. So it's not an option for you.

> > o run HPUX
> > 
> > I've not done or seen any lmbench perf results recently but before hpux
> > was 10x faster on context switch/task related stuff.  And X11 server

Seems I remembered this partially wrong.
Linux was slightly faster in lots of areas, ~5x slower on fork/exec/shi,
and ~10x slower mmap latency.

http://lists.parisc-linux.org/pipermail/parisc-linux/2002-March/015966.html

grant

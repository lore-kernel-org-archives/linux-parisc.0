Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 9 Feb 2003 12:14:41 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030209191441.GA21938@dsl2.external.hp.com>
References: <20030208222242.AA3554829@dsl2.external.hp.com> <20030208222746.GB19683@dsl2.external.hp.com> <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <20030209031014.GD19683@dsl2.external.hp.com> <20030209122913.G27544@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030209122913.G27544@parcelfarce.linux.theplanet.co.uk>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
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

On Sun, Feb 09, 2003 at 12:29:13PM +0000, Matthew Wilcox wrote:
> I'll upload it to unofficial-debs and people will be able to apt-get
> install it from there.

cool - thanks.

> Sure, but there's a measurable performance difference if you compile out
> spinlocks

if people care about the last 5% performance, they still have several
options:
o build your own kernel
o run HPUX

I've not done or seen any lmbench perf results recently but before hpux
was 10x faster on context switch/task related stuff.  And X11 server
takes advantage of HW acceleration.
(I'm associating UP systems with graphics which isn't always true)

grant

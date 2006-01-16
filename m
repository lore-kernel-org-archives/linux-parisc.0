From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] __LP64__ / CONFIG_64BIT?
Date: Mon, 16 Jan 2006 09:54:50 -0700
Message-ID: <20060116165450.GD19769@parisc-linux.org>
References: <43CA9FF8.5070405@tiscali.be>
	<20060116164054.GB4049@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060116164054.GB4049@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 16, 2006 at 11:40:54AM -0500, Kyle McMartin wrote:
> Er, why? One of them is shorter to write, and makes the
> same amount of sense... I have no particularly preference at any
> rate. In fact, using __LP64__ might be preferable, as CONFIG_64BIT
> requires us including <linux/config.h> which means any change
> to the config will cause this file to be rebuilt whether or not
> it is actually required. Then again, it's entirely possible
> my understanding of this config crap is antiquated.

Doubly antiquated, I'm afraid.  Most recently, changes to the build
system mean that including <linux/config.h> is a no-op.  It's
automatically included for the files that need it.

The earlier antiquation happened many, many years ago, and it was
that the dependency writer (back in the days of 'make dep') treated
<linux/config.h> specially.  It scanned the file looking for CONFIG_*
symbols and added dependencies on the autobuilt include/config/ directory
(one file per config symbol).

I don't think we need to change from __LP64__ to CONFIG_64BIT overnight.
I think CONFIG_64IT has meaning to people from a non-HP environment, so
has slight clarity advantages.  If you're touching some code that uses
__LP64__, by all means do the conversion to CONFIG_64BIT, but don't do
it unnecessarily.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

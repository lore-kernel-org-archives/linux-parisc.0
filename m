From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] __LP64__ / CONFIG_64BIT?
Date: Mon, 16 Jan 2006 12:04:08 -0500
Message-ID: <20060116170408.GC4049@quicksilver.road.mcmartin.ca>
References: <43CA9FF8.5070405@tiscali.be>
	<20060116164054.GB4049@quicksilver.road.mcmartin.ca>
	<20060116165450.GD19769@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060116165450.GD19769@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 16, 2006 at 09:54:50AM -0700, Matthew Wilcox wrote:
> Doubly antiquated, I'm afraid.  Most recently, changes to the build
> system mean that including <linux/config.h> is a no-op.  It's
> automatically included for the files that need it.
> 
> The earlier antiquation happened many, many years ago, and it was
> that the dependency writer (back in the days of 'make dep') treated
> <linux/config.h> specially.  It scanned the file looking for CONFIG_*
> symbols and added dependencies on the autobuilt include/config/ directory
> (one file per config symbol).
>

Ok.
 
> I don't think we need to change from __LP64__ to CONFIG_64BIT overnight.
> I think CONFIG_64IT has meaning to people from a non-HP environment, so
> has slight clarity advantages.  If you're touching some code that uses
> __LP64__, by all means do the conversion to CONFIG_64BIT, but don't do
> it unnecessarily.
> 

Fair enough.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

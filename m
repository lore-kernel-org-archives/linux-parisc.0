From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] kernel BUG at include/asm/mmzone.h:74!
Date: Sun, 11 Jul 2004 17:25:27 +0200
Message-ID: <200407111725.27768.deller@gmx.de>
References: <200407101354.12456.deller@gmx.de> <20040710171629.GN546@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040710171629.GN546@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi tausq,

On Saturday 10 July 2004 19:16, Randolph Chung wrote:
> In reference to a message from Helge Deller, dated Jul 10:
> > I'm now running into this problem when trying to start X11, either with the VisEG stifb or sstfb driver.
> 
> this is because mmio space is not handled properly by the discontigmem
> support...
> 
> this patch should "fix" it, but i'm not completely happy with this 
> approach.  will think about it some more. it won't work on 64-bit 
> platforms because pfn_is_io() is wrong there....

The patch you committed for 2.6.7-pa12 worked on my c3k.
Thanks for fixing !

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

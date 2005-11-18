From: Linus Torvalds <torvalds@osdl.org>
Subject: [parisc-linux] Re: [git pull] parisc-linux for 2.6.15
Date: Fri, 18 Nov 2005 14:32:07 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0511181426270.13959@g5.osdl.org>
References: <20051118221601.GD28276@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051118221601.GD28276@tachyon.int.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



On Fri, 18 Nov 2005, Kyle McMartin wrote:
>
> This pull contains the last remnants of parisc divergence in parisc
> specific files up to this point. At least, until someone commits to cvs.
> Remaining changes in CVS are compat_signal and some ALSA stuff that will
> be forwarded along to Jaroslav.

Argh. I was tempted to not merge at this point, but since most of it is in 
the parisc subdirectories, I let it slide.

> Before you consider whether to pull, I'd just like to double check
> whether I made any mistakes in the process:

Ok, it has that unnecessary extra merge, but apart from that there doesn't 
seem to be anything actually _wrong_ with it. 

I don't mind some criss-cross merges, as long as they aren't common enough 
to make the history completely unreadable, and that was certainly not the 
case here.

I just ask for cleanliness - not totally sterile trees ;)

		Linus
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

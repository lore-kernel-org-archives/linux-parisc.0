From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] No 2.6 kernel on 735/125 with CRX24?
Date: Sat, 2 Oct 2004 23:03:35 +0100
Message-ID: <20041002220334.GA24389@ntlworld.com>
References: <200409241533.15399.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409241533.15399.j.raspe@t-online.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 24, 2004 at 03:33:15PM +0200, Johannes Raspe wrote:
> I tried the "official" 2.6.8 Debian-image and 2.6.8.1-pa11-image but none 
> worked.
> After booting, the message "if this is the last..." about graphic and 
> serial-console is printed and after that (I suppose when the kernel tries to 
> initialize the framebuffer) the screen turns blue, no HDD-activity anymore, 
> the system hangs.
> As far as I can see no other messages.
> With 2.4.27-pa4 everything is fine.

[snip]

I have no idea how stifb works, but perhaps this is the same problem:

http://lists.parisc-linux.org/pipermail/parisc-linux/2004-March/022600.html

Does passing "stifb=bpp:8" on the palo command-line make any difference?
Perhaps the 32 bpp code is broken?  I can't find any other dmesgs posted
to the list with stifb using 32 bpp...
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

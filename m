From: Helge Deller <deller@gmx.de>
Subject: Penguin color problems on HCRX-24 (was: [parisc-linux] Re: STI crash
	on B132L with HCRX-24)
Date: Sun, 31 Oct 2004 14:56:50 +0100
Message-ID: <200410311456.50753.deller@gmx.de>
References: <200410292228.14940.j.raspe@t-online.de>
	<200410311312.21653.deller@gmx.de>
	<200410311406.46194.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: parisc-linux@lists.parisc-linux.org
To: Johannes Raspe <j.raspe@t-online.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200410311406.46194.j.raspe@t-online.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Johannes,

On Sunday 31 October 2004 14:06, Johannes Raspe wrote:
> For solving the (cosmetical) penguin-color-problem I took a shot with my 
> digicam and attached it (sorry for poor quality).

I was hoping my last patch would have fixed this too. Oh well :-)

Right now I don't have any real idea why the penguin colors are wrong.
But I have two assumptions:
a) cfb_imageblit() works wrong in the current tree with 24/32bpp output and 8bpp input on big endian
b) fb_set_logo_truepalette() creates a wrong palette for 24bpp output [but this function seems correct IMHO].

Both of those I'm currently lost without any testing possibility, but I'll continue to look into it.

BTW, does everything else seemscorrect wrt. colors on the text console, e.g. does midnight command shows blue background ?

Regards,
Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

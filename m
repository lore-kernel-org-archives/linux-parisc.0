From: Helge Deller <deller@gmx.de>
Subject: Re: Fwd: Re: [parisc-linux] Re: STI crash on B132L with HCRX-24
Date: Sat, 30 Oct 2004 01:25:11 +0200
Message-ID: <200410300125.12145.deller@gmx.de>
References: <200410292228.14940.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: Johannes Raspe <j.raspe@t-online.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200410292228.14940.j.raspe@t-online.de>
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

On Friday 29 October 2004 22:28, Johannes Raspe wrote:
> I just noticed that I lost my text-console. Don't know if this is the patched 
> stifb.c (I cant' check either :-)). 

I don't think so.

> The getty processes are started on tty1  to tty6, but switching to those consoles 
> with "CTRL+ALT+F1-6" only gives a  black screen.

Just tested and this works for me on 8bpp with Artist-gfx on a 715/64.

> After switching system-console to graphics there are no bootmessages, I have 
> to switch back to serial console to see them.
> X-Server still is working fine. 
> 
> Any suggestions?

Do you still boot via serial console or is the cable still connected ? 
If yes, please stop at the IPL and delete the line "console=ttyS0", which is auto-appended by palo if you boot from serial console.

You wrote in another mail:
> The hppa "boot-penguin" looks a little bit psychedlic...

could you describe this more exactly. Does the colors seem exchanged (e.g. red is blue and vice-versa) ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] installation-reports - hppa c3600 graphical/usb
Date: Thu, 6 May 2004 18:37:16 +0100 (IST)
Message-ID: <Pine.LNX.4.58.0405061830070.2414@sal.ucc.ie>
References: <20040506172344.GA12232@colo.lackof.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: submit@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040506172344.GA12232@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 6 May 2004, Grant Grundler wrote:

> Using the HP USB keyboard (Model SK-2502U, P/N A4983-60401) on an HP C3600,
> the regular 4 arrow keys (seperate from the numeric keypad) do NOT work.
> They "select" instead of moving the highlight up/down.

I also have a SK-2502U here (using Voodoo2 as graphics card).

> Use the numeric keypad instead - it has "arrow keys" on it as well.
>
> It's more "natural" to use the regular arrow keys and it should be
> trivial for the right person to fix.  I gather the numeric pad sends
> out a different scan code than the four "arrow" keys.

xev reports the following for the 'regular' arrow keys:

'<-'     keycode 100
'->'     keycode 102
  up     keycode 98
down     keycode 104

and the following for the numpad arrow keys:

'<-'     keycode 83
'->'     keycode 85
  up     keycode 80
down     keycode 88


Unfortunately I can't use 'showkey' since I'm running serial console
instead of fb console ...

Greetings,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] 712/60, 712/80, serial console, firmware update,
	"dagger cards"
Date: Sat, 17 Jul 2004 01:04:07 +0200
Message-ID: <20040717010407.25b64a24@Tatooine.r3z0>
References: <Pine.LNX.4.60.0407161743420.32264@kani.popovich.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: "Peter E. Popovich" <peter@popovich.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.60.0407161743420.32264@kani.popovich.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 16 Jul 2004 17:55:45 -0400 (EDT)
"Peter E. Popovich" <peter@popovich.net> wrote:

> so, i got a 712/60, and got debian installed, and it all seemed to work 
> fine.
> 
> then i tried to use the serial console hack described at:
> http://www.pateam.org/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/consoles.html
> 
> something went wrong, because now, the system doesn't boot.  it appears
> to be dumping 0xNNNN diagnostic codes out the serial port.

This could be normal ;)

Wait a bit, and among the 0xNNN you might eventually see "Starting boot
process" at some point. Then you'll saved. If you followed EXACTLY what
was said in the howto, it should work. We've got several of these tiny
beasts here booted in serial console (even our MySQL server is a 712!) ;)

Besides, it is mentionned that this is a hat trick, and
therefore,_dangerous_...

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

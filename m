From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] suppress led task for KittyHawk's LCD
Date: Sun, 12 Nov 2006 15:04:38 +0100
Message-ID: <200611121504.38965.deller@gmx.de>
References: <20061112014535.f583cc92.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: Guy Martin <gmsoft@tuxicoman.be>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061112014535.f583cc92.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Guy,

On Sunday 12 November 2006 01:45, Guy Martin wrote:
> I've noticed that the LCD on my K410 is filled at a constant rate with black characters.
> After some investigation, it looked like the code updating the led status was filling the LCD.
....

instead of adding:
+               no_led = 1;     /* no led support on KittyHawk */
                goto found;     /* use the preinitialized values of lcd_info */

did you tried to comment out the "goto found" ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] suppress led task for KittyHawk's LCD
Date: Fri, 17 Nov 2006 14:02:46 +0100
Message-ID: <7d01f9f00611170502r7c8e95c3nfef955365987e313@mail.gmail.com>
References: <20061112014535.f583cc92.gmsoft@tuxicoman.be>
	<200611121605.07365.deller@gmx.de>
	<20061113225421.e00e5c4b.gmsoft@tuxicoman.be>
	<200611162155.49380.deller@gmx.de>
	<20061116220426.5941dd16.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Guy Martin" <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061116220426.5941dd16.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 11/16/06, Guy Martin <gmsoft@tuxicoman.be> wrote:
>
> Helge,
>
> I installed HP-UX on that box and it only displayed PCD state codes as linux does when you select only CONFIG_PDC_CHASSIS.
> On that point, I think that CONFIG_PDC_CHASSIS and CONFIG_CHASSIS_LCD_LED should be mutually exclusive.

Certainly not.

> When you select CONFIG_CHASSIS_LCD_LED, you don't see the chassis state anymore but only the text from /proc/pdc/lcd.

Wrong. You see whichever sent the last event. If the system is working
normaly you see the proc text, if it panic'd, you'll see a FLT
message. Besides, CONFIG_CHASSIS_LCD_LED drives the heartbeat, network
and disk symbols on the lcd as you know, so because there's a
"conflict" on the upper part of the lcd doesn't mean that you want to
make those mutually exclusive anyway.

I've coded this that way on purpose, and the wiki and config help are
(imho) explicit enough as to what will happen when you select both.
Selecting both does have a purpose.

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

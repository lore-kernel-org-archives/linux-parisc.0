From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: J5000 LCD heartbeat
Date: Sat, 19 Mar 2005 16:19:11 -0700
Message-ID: <20050319231911.GB21898__49244.3326548257$1416623700$gmane$org@colo.lackof.org>
References: <200503191959.05972.dmp@davidmpye.dyndns.org> <423C8881.6020702@tiscali.be> <200503192233.26991.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200503192233.26991.dmp@davidmpye.dyndns.org>
Resent-Message-ID: <s0UjrC.A.WEE.XMLPCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Sat, Mar 19, 2005 at 10:33:24PM +0000, David Pye wrote:
> The other thing is that the kernel version which is displayed on the lcd by 
> default is overwritten partly by a:
> 
> INI CC01 
> 
> It's not a huge issue for me, as I can overwrite it again by echo'ing my 
> message into /proc/pdc/lcd post boot.

This is the firmware showing the "Chassis Log" as emitted by the kernel.
Some platforms (e.g. A500/rp2470) use chassis logs to set the LED
properly.

> Is it possible to make the write to the display later in the boot process, so 
> it occurs after the INI CC01 is printed?

I would think it's possible.
You want to track down where the CC01 chassis_log is emitted then 
propose a better place to initialize LED display?

Another idea is the chassis log code might want to clear the LED
diplay when displaying a chassis log and then a few seconds later
refresh the LED display with the original contents or something.

> (Incidentally, the INI CC01 is only on the screen - /proc/pdc/led returns the 
> normal kernel version - I assume this is because the message was printed by 
> the hardware, itself?)

The firmware. IIRC, /proc/pdc/led just returns a cached value.

thanks,
grant


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

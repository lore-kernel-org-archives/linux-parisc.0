From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: Issue with =?UTF-8?Q?pata=5Fsil=36=38=30?=
Date: Tue, 21 Jan 2014 08:05:10 +0100
Message-ID: <1f9c0e8de82a46127cbd6b8872526f44@tuxicoman.be>
References: <b1936c5daf63913a0a5d0c37b7ebc425@tuxicoman.be>
 <52DD833B.2010907@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52DD833B.2010907@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

On 2014-01-20 21:12, Helge Deller wrote:
> Hi Guy,
> 
> On 01/20/2014 01:24 PM, Guy Martin wrote:
>> I tried to switch to the ATA drivers but I keep getting a panic
>> whenever I load the pata_sil680 module on my C8000


>> With MMIO, it goes a little bit further as it detects the drive 
>> correctly but eventually fails the same way.
>> 
>> As far as I understand the backtrace, it would seem that an IRQ
>> handler function pointer is set to NULL or some NULL pointer deref
>> occurs in the IRQ handler. Also, this is not the original DVD drive
>> from the C8000. I replaced it with a DVD burner.>
>> How idea what can be the issue ?
> 
> I'm just guessing here since I would need to test myself.
> But James Bottomley found once, that the secondary port of the cmd64x 
> controller
> was not completely wired physically up on parisc.
> He posted a patch series here:
> http://www.spinics.net/lists/linux-ide/msg40816.html
> Maybe there is some similarity for pata_sil680 too, esp. since it seems 
> from
> the log above that you connected your DVD drive to the secondary port 
> (scsi3).
> What happens if you connect it to scsi2/the first pata port instead?

I have not checked how it is connected physically yet. It's probably the 
jumper on the drive set for slave.

However, this drive works fine with the old IDE siimage driver.
Additionally, if I found out that if I hack the driver to only probe the 
first drive,
then unload it, change it to probe both drives and reload it, it is 
detected correctly.


   Guy


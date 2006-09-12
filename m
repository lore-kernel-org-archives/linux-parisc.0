From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] w-a to what [Was: D380 and ext[23] fs grave pb]
Date: Tue, 12 Sep 2006 09:14:07 -0500
Message-ID: <200609120914.08001.mszick@morethan.org>
References: <4506B61C.2000204@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4506B61C.2000204@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue September 12 2006 08:29, Joel wrote:
> Hello Mike,
> 
> Apologies for so late answer but it seems that I never recieved this 
> mail so I am trying to compose a new one from m-l (sorry to breack the 
> thread so sadely):
> 
>  >On Fri September 8 2006 10:31, Joel Soete wrote:
>  >> Hello James, Matthrew,
>  >>
>  >> I come back to you with this pb because as explained in a previous 
> mail:
>  >> 
>  ><http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030152.html>
>  >>
>  >> , it seems to be related to ncr53c720 driver.
>  >>
>  >
>  >That's the second hit on that driver this week:
>  >http://lists.parisc-linux.org/pipermail/parisc-linux/2006-August/030054.html
>  >
>  >In the above mail, the driver was reporting:
>  >
>  >ncr53c720-0: rev 0xf irq 66
>  >ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
>  >scsi0 : ncr53c8xx-3.4.3g
>  >
>  >   Vendor: SEAGATE   Model: ST15150W          Rev: HP07
>  >   Type:   Direct-Access                      ANSI SCSI revision: 02
>  >
>  >Where the model number was single-ended, not: ST15150WD (Differential)
>  >and the problem was that the drive could not be written.
>  >
>  >Joel, what does that part of your dmesg have to say?
> That said on my C110 I got:
> --- snip ---
> ncr53c720-0: rev 0xf irq 66
>

I could not find any code that identifies the actual chip, the "ncr53c720"
seems to be hardcoded in the message.

> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
>

This message is part of the strange SE/DIFF code.

> scsi0 : ncr53c8xx-3.4.3g
>    Vendor: SEAGATE   Model: ST34371W          Rev: HP03
>    Type:   Direct-Access                      ANSI SCSI revision: 02
>

And even though this is a different model drive than Joe's problem,
it is still claiming to be SE:
<http://www.seagate.com/support/disc/scsi/st34371w.html>

Hmm... I forgot to check if the string is long enough for 9 characters,
perhaps just the "D" is getting clipped in the message.

>   target0:0:5: Beginning Domain Validation
>   target0:0:5: asynchronous
>   target0:0:5: wide asynchronous
>   target0:0:5: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
>

And that is just wrong - the drive is a SCSI-3 (Ultra SCSI) (Fast-20)
but this drive can fall back to FAST-10, which may be what is happening.

Hmm... Maybe Joe's drives can't fall back to match the controller.

See page 15 of:
<http://www.seagate.com/support/disc/manuals/scsi/67491d.pdf>

Just more reasons to /dev/null this driver.

Mike
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Sun, 26 Dec 2004 17:37:09 +0000
Message-ID: <20041226173709.GH11543@parcelfarce.linux.theplanet.co.uk>
References: <200412260504.40205.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412260504.40205.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 26, 2004 at 05:04:40AM -0500, Mike Frysinger wrote:
> seems to be a new bug because building a 2.6.8.1-pa7 kernel with same .config 
> works fine while a 2.6.10-pa1 panics ;(

I suspect any 2.6.9 kernel will work fine and some of the earlier
2.6.10-rc too.  At some stage, I may invite you to do a binary search
to figure out what patch caused this problem ... but see below first.

> 2.6.10-pa1-scsi-panic - dmesg output from scsi driver up through panic
> 2.6.8.1-pa11-dmesg - scsi dmesg output from a good kernel

This is good -- very helpful.

> sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
> sym0: No NVRAM, ID 7, Fast-20, SE, parity checking

The 875 only supports wide ultra scsi (ie, FAST-20, 40MB/s).

>  target0:0:6: Beginning Domain Validation
> sym0:6: wide asynchronous.
> sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
>  target0:0:6: Domain Validation skipping write tests
>  target0:0:6: Ending Domain Validation

... successful negotiation with the IBM drive

> sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
>   Vendor: WDIGTL    Model: WDE9150 ULTRA3    Rev: 1.30
>   Type:   Direct-Access                      ANSI SCSI revision: 03
> sym0:9:0: tagged command queuing enabled, command queue depth 16.
>  target0:0:9: Beginning Domain Validation
> sym0:9: asynchronous.
> sym0:9: wide asynchronous.
> Backtrace:
>  [<102a51a8>] sym_ppr_nego+0x44/0xe0
>  [<1029d6ec>] sym53c8xx_intr+0x30/0x80
>  [<10106ca8>] do_irq+0x158/0x160

... we got an interrupt and died processing it.

> Kernel Fault: Code=13 regs=10434640 (Addr=00000000)

 	 13  	 	 	 	 Conditional trap

>  IAOQ[0]: $$divU+0xc/0x210
>  IAOQ[1]: $$divU+0x10/0x210

I guess we tried to divide by zero.

Looking at the stack dump (a couple of layers are missing, is this because
of tail-call optimisations?), we received a PPR message from the device.
Now, devices aren't supposed to send unsolicited PPR messages, so either
we're mistakenly asking it to do PPR or the device is breaking the spec.

Let's find out which; can you enable negotiation debugging by passing:

sym53c8xx.debug=0x200

on the kernel command line?  If it's a module, then do:

modprobe sym53c8xx debug=0x200

[2.6.8.1-pa9 boot log]:
> sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
> sym0: No NVRAM, ID 7, Fast-20, SE, parity checking

> sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
>   Vendor: WDIGTL    Model: WDE9150 ULTRA3    Rev: 1.30
>   Type:   Direct-Access                      ANSI SCSI revision: 03
> sym0:9:0: tagged command queuing enabled, command queue depth 16.
> scsi(0:0:9:0): Beginning Domain Validation
> sym0:9: FAST-20 SCSI 20.0 MB/s ST (50.0 ns, offset 16)
> sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
> scsi(0:0:9:0): Write Buffer failure 8000002
> scsi(0:0:9:0): Domain Validation detected failure, dropping back

Fascinating.  Need to debug why this is going wrong ... but that's
for a later time.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 712/60, 712/80, serial console, firmware update,
	"dagger cards"
Date: Fri, 16 Jul 2004 16:11:06 -0600
Message-ID: <20040716221106.GB14404@colo.lackof.org>
References: <Pine.LNX.4.60.0407161743420.32264@kani.popovich.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

On Fri, Jul 16, 2004 at 05:55:45PM -0400, Peter E. Popovich wrote:
> so, i got a 712/60, and got debian installed, and it all seemed to work 
> fine.
> 
> then i tried to use the serial console hack described at:
> http://www.pateam.org/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/consoles.html
> 
> something went wrong, because now, the system doesn't boot.  it appears to 
> be dumping 0xNNNN diagnostic codes out the serial port.
> 
> "no worries", i say.  "they're cheap.  I'll just buy another..."

You can resurrect the 712's using a dagger card.
Not easy to find one though...

> so, i got a 712/80, but it's running version 1.6 of the firmware. 
> there's a version 2.3 patch, but its instructions tell you to write the 
> patch to tape and boot from the tape.  (boot from tape ?!?)
> http://ftp.parisc-linux.org/kernels/712/PF_C7120023.txt

The lifimage can be booted via the network or hard disk as well.
Just setup a bootp/dhcp server to boot the lifimage.
Or dd the lifimage to the HD and boot from the HD.

> so, i've got some questions.  neither have anything todo with linux, but 
> i'm not sure where else to turn for help with hppa...
> 
> first: reading the history of this list, apparently, i can fix the 712/60 
> with a "dagger card".  for the life of me, i've got no clue what that is, 
> or how i could acquire one.

Yes. It's a special card that can be installed in the 712
and can read/write the main firmware.

> second: is there a way to update the firmware in a 712/80 without a tape 
> drive?  is there a way to update the firmware in a 712/80 without either a 
> tape or floppy drive?  (if i need to slap a floppy drive in, will a 
> standard PC floppy drive work?)
> 
> third: will debian run stably on a 712/80 with firmware version 1.6?

probably. But you'd have to read the 2.3 firmware errata to know
what bugs are fixed.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

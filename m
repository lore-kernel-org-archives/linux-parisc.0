Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 644CD4866
	for <parisc-linux@parisc-linux.org>;
	Thu,  1 Jan 2004 12:51:32 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1Ac8qv-0002nN-V2; Thu, 01 Jan 2004 19:51:29 +0000
Date: Thu, 1 Jan 2004 19:51:29 +0000
From: Matthew Wilcox <willy@debian.org>
To: brianbarber@linux.ca
Message-ID: <20040101195129.GC2620@parcelfarce.linux.theplanet.co.uk>
References: <1072192801.83937480brianbarber@myrealbox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1072192801.83937480brianbarber@myrealbox.com>
Sender: <willy@www.linux.org.uk>
Cc: willy@debian.org, parisc-linux@parisc-linux.org
Subject: [parisc-linux] Re: Installing Debian on an 712/80
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Dec 23, 2003 at 10:20:01AM -0500, Brian Barber wrote:
> Please forgive the intrusion.  If this is not a message to which you wish to reply, please let me know.  I understand.

That's fine; you just mailed me in the middle of my xmas time off ... and
much mail accumulated ;-)

> I've done some more digging and come up with the following obstacles:
> 1) HP machines require active SCSI termination, hence the reason why I could not boot from my (borrowed) external SCSI CD-ROM (passive terminator only)

I'm not sure that's true, but they do require certain CD drives to
boot from.  I forget the details; something to do with 2k vs 512 byte
sector sizes.

> 2) There is no floppy boot support for the 712/80, or any other model for that matter.

Correct; it's not been written.  other things always seem to have a
higher priority ;-)

> 3) There is no rboot support.

Correct.  rboot is for 715/Scorpio and older.

> If I am correct (jump in here), I am left with bootp/tftp as the only
> means of booting the machine.  If I take this route, I copy lifimage
> to the boot directory of my tftp server.  This is where I am stuck.
> There is no documentation I can find (or discern) that walks one through
> an install from a tftp-booted machine.  Is there a way for me to mount
> the Debain CD via nfs and launch the installer from there?

I'd like to just point you at the boot HOWTO [1], but it doesn't seem
to cover this step.  It only covers booting the kernel, not setting up
your NFS root.  I've had mixed success with using debootstrap to populate
a minimal nfsroot, then updating to sid and installing new packages.

I'm cc'ing the mailing lists in the hope somebody will write down how
to do this properly and Thomas or Thibaut can add it.

[1] http://www.pateam.org/parisc-linux-boot/doc.html

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

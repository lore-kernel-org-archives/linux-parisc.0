From: Jeremy Drake <jeremyd@apptechsys.com>
Subject: [parisc-linux] Kernel 2.4.17-32-smp problem
Date: Sat, 23 Mar 2002 20:03:00 -0800 (PST)
Message-ID: <Pine.LNX.4.33L2.0203231953470.13376-100000__821.100609801029$1416621177$gmane$org@eiger.apptechsys.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: <debian-hppa@lists.debian.org>
To: <parisc-linux@parisc-linux.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I have been running debian hppa for a while now without incedent.
Recently, I ran apt-get upgrade, and it upgraded my kernel-image
2.4.17-32-smp.  I rebooted, and the box now crashes periodically.  It has
done this twice.  Since I have not had physical access to the box for a
while, I can't get any logs or even bring the box back up.  Hopefully by
monday I'll be able to be more help.

The box is a J5000 with 512M ram and a 30Gig 15k scsi drive on id6 of the
hotswap scsi.  It is running serial console, but has a hp video card.  I
don't know exactly what that is.  The USB on the back is hosed, so the
firmware can't detect the HP keyboard and it boots serial console.

I would also like to ask you hardware gurus out there if I were to buy and
add a PCI USB controller to the J5000, if the firmware would detect the
keyboard and boot properly.

Thanks for the great work on this port, and hopefully you can help me.
Log files to follow when available.......

-- 
You are as I am with You.

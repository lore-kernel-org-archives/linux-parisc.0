Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beloit.edu (beloit.edu [144.89.40.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72931482C
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Nov 2001 20:21:48 -0700 (MST)
Received: from localhost ([144.89.185.182])
	by beloit.edu (AIX4.3/8.9.3/8.9.0) with ESMTP id VAA24984
	for <parisc-linux@lists.parisc-linux.org>; Thu, 8 Nov 2001 21:16:10 -0600
Date: Thu, 8 Nov 2001 21:21:45 -0600
Mime-Version: 1.0 (Apple Message framework v472)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: Daniel Williams <dan@bigw.org>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <E76C922A-D4C0-11D5-BC47-0030657D1C94@bigw.org>
Subject: [parisc-linux] C110 install and boot part 3...
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

OK, I got a hold of another CD drive, this time a DEC workstation CD 
(its funky in some wierd way), its got parity always on and you can 
switch between DEC workstation and PC mode.  Whatever that is.  The main 
thing is that it works and boots the .9.2 CD I've got.  However, after 
the penguin appears at the top and it does init and stuff, right after 
it lists the CD when its doing SCSi init stuff, it give me:

scsi bus is being reset for host 1 channel 0
ncr53c8xx_reset: pid-0 resetflags=2 serial_number=18 
serial_number_at_timeout=18
ncr53c720-0: restart(scsi reset)
SCSI host 1 abort (pid0) timed out - resetting.

This was with the 2 2.1GB FW differential SCSI drive attached and 
functioning.  When I took both of those drive out and have JUST the CD 
drive in the system, it boots fine and gets to the install program, with 
the welcome screen and the Continue button.  But it froze at this first 
screen for some reason.  Any ideas?

Also, can it boot with FW differential SCSI devices connected?  Or do I 
have to put some narrow drives in there?

Thanks,
Dan

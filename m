Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-2.cisco.com (sj-msg-core-2.cisco.com [171.69.24.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 201FE482B
	for <parisc-linux@parisc-linux.org>; Mon, 21 Jan 2002 18:25:26 -0700 (MST)
Message-Id: <4.3.2.7.2.20020121171503.045ee548@mira-sjc5-9.cisco.com>
Date: Mon, 21 Jan 2002 17:25:06 -0800
To: Matt.VanDeWerken@csiro.au, parisc-linux@parisc-linux.org
From: Christian Suder <csuder@cisco.com>
Subject: Re: [parisc-linux] Trouble installing 0.9.3 on 735/99
In-Reply-To: <A8566E157F5FD411BCFB00D0B7816D51C72CD9@ntexchange.cat.csir
 o.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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


Hmm,

are you able to do a network install, e.g. from NFS ? A while ago when I 
had frequent FS corruptions I had a setup that had vmlinux and the install 
root ramdisk "ready to go" in the f0 partition. Just had to give it the 
correct parameters at the PALO prompt, choose NFS as source and off I was 
leveling the linux partition... ;-)

Basically you should be able to do the same, boot into the installer from 
the second disk and do a regular network install. You would not need to do 
some funky stuff in the shell.

         Christian



At 07:58 AM 1/22/2002 +1000, Matt.VanDeWerken@csiro.au wrote:
>Hi all:
>
>I've successfully installed 0.9.2 on this machine in the past, but I'm
>having trouble installing 0.9.3 on my 735/99.
>
>Here's the steps I went through; note that I don't have a SCSI CDROM to boot
>from, so I had to do a bit of a kludge. Sometimes it worked, sometimes other
>things happened. Anyway, here's the procedure (note I'm typing this from
>memory, so the prompts aren't exact, but the procedure is the same as I used
>- I did it about 10 or 15 times, so I'm well versed in it!):
>
>I have 2 external scsi disks, one of which I'll call /dev/sda and the other
>I'll call /dev/sdb; these names will not change when I transfer the disks to
>the parisc box.
>
>* Put the CD in my i686 Linux box;
>* dd if=/dev/cdrom of=parisc-linux.iso;
>* dd if=parisc-linux.iso of=/dev/sdb;
>* reboot, and removethe external disks, plugging them into the 735/99.
>* start minicom.
>* Boot 735/99, choose 'b p0' at the prompt.
>* Debian installer starts, good.
>* Partition 1.3GB disk /dev/sda, as follows:
>* 32MB /dev/sda1 -> type f0;
>* 960MB /dev/sda2 -> type 83 (ext2fs);
>* the rest /dev/sda3 -> type 82 (swap);
>* make swap, make e2fs, mount /dev/sda2 as /;
>* drop to shell, do "mkdir /inst ; mount /dev/sdb /inst -t iso9660"
>
>Note that this last step only sometimes works. That is, only sometimes does
>the install program see the mounted directory.
>
>Anyway, it then proceeds to the "make boot floppy" section, where it asks to
>list the files. Often (maybe 5 or 6 times out of 7) it will say "Files not
>found in path", where I'll have to drop to the shell, umount the iso image,
>then remount it. If it does find the files (and it lists the exact path), I
>select the 32-bit one, and then it just hangs. I can leave it there for many
>minutes, and it does nothing.
>
>Any ideas? Maybe I should leave it for a half hour or so...
>
>Cheers,
>Matthew van de Werken
>Electronics Engineer
>CSIRO Exploration & Mining - Gravity Group
>1 Technology Court - Pullenvale - Qld - 4069
>ph:  (07) 3327 4685     fax:  (07) 3327 4455
>email:  matt.vandewerken@csiro.au
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

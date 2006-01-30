From: Fabio Bizzi <fbizzi@bizzi.org>
Subject: Re: [parisc-linux] Trying to install ...bian-31r1a-hppa on a C200
Date: Mon, 30 Jan 2006 09:24:09 +0100
Message-ID: <43DDCD29.8080800__7099.90802356533$1416624001$gmane$org@bizzi.org>
References: <004b01c62550$59414920$040aa8c0@local>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: =?UTF-8?B?642w7J207YSw7YWN?= <support@datatek.co.kr>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <004b01c62550$59414920$040aa8c0@local>
Resent-Message-ID: <oe8bV.A.auE.x0c3DB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

데이터텍 wrote:
> I would like to install a debian-31r1a-hppa-netinst.iso, but there's an 
> error while base installation.
> My machine is HP C200 having 256MB with SCSI CD, SCSI HDD(18GB).

Ok, we have worked it out some times ago'! :)

The problem is that the stock sarge kernel is buggy on big disks.
So you have to do a clean installation from 3.1r1a disks, and when the
installer asks to you to reboot, you have to "go back" until the main
menu of the installer will shown.
At this point you have to open a shell, verify that all the partitions
of the target file system are mounted eg:

/dev/sda1 on /target/boot ext2
/dev/sda5 on /target ext3
/none on /target/proc procfs

It's important that proc file system is mounted on the target file
system or the installation of the new kernel will fail.

Now do a chroot to the new system "# chroot /target /bin/bash"
wget to the nwe filesystem the testing kernel images:


# wget
http://ftp.ie.debian.org/debian/pool/main/l/linux-2.6/linux-image-parisc_2.6.12-10_hppa.deb
# wget
http://ftp.ie.debian.org/debian/pool/main/l/linux-2.6/linux-image-2.6-parisc_2.6.12-10_hppa.deb
# wget
http://ftp.ie.debian.org/debian/pool/main/l/linux-2.6/linux-image-2.6.12-1-parisc_2.6.12-10_hppa.deb

And now install them with “#dpkg -i linux-*”, after the installation do
a "# palo" and exit from the shell.

Unmount the proc filesystem from the target filesystem “# unmount
/target/proc” and exit from the shell.

Select the “finish installation” of the installation program’s menù and
reboot the C200, after the reboot continue with base-config and so on.... ;)


If you experience troubles before the "reboot" prompt, power off and try
again... sometime it happens! ;)

Ciao.

	Fabio.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] HP model 612 hard disk not found
Date: Fri, 25 Feb 2005 12:14:15 -0600
Message-ID: <200502251214.15993.mszick@wolfbutter.com>
References: <1109239065.30724.15.camel@base-06.geo.auth.gr>
	<200502240810.19228.mszick@wolfbutter.com>
	<1109322415.32547.5.camel@base-06.geo.auth.gr>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1109322415.32547.5.camel@base-06.geo.auth.gr>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri February 25 2005 03:06, Marios K. wrote:
> 
> > Could be that the installer is only looking for the primary hard disk;
> > which for hp, pa-risc is id 6 (secondary is id 5)...
> > (-- Could by I have those reversed -- Might be pri=5, sec=6 )
> > 
> > Try setting your scsi id numbers, disk=6, cdrom=5.
> > ( Or the reverse of that )
> > 
> > OR
> No, that didn't worked.
> But opening a console and dmesg , i found that the hard disk couldoun't
> be mounted due filesystem something. Unfortunatelly the system is in my
> home and i can't remember the excactly message. I tried to mount it
> manially by using 
> mount /dev/scd0 /target
> /dev/sda
> /dev/sda1
> etc
> But nothing works. 
> How can i mount it. It has a filesystem of HP-UX.
> fdisk command doesn't exist
> 
Hmm...
If you could provide a little more information

I haven't used the new Debian installer, but the following should
work - it is typical of Linux installs.

1) Boot from your cd.

2) If this gives you a choice of kernels, just 'enter' for the default.

3) The installation process will display its first set of questions as
soon as the selected kernel boots.

4) You are now running Linux, only from the cdrom and a ramdisk.

5) Installers normally have multiple consoles enabled...
the keystrokes: 'Alt-Fx' for (usually) F1-F5 will switch to the other
consoles. (Alt-F7 is the console with X on it if that is running.)

6) Switch out of the installer's console into one of the others.

7) You may have to login - not sure about this installer.

8) Linux is similar to HP-UX (any *nix) you should have most of
the commands available that you are used too.

9) try: mount
To get an idea where things are mounted

10) find where: /var/log/dmesg is located.
Find some way to post it on the list.
If you have the machine networked to something else, you
should be able to 'scp' the file to the other machine (if the
other machine is running sshd and the network interface is up).

Mike
> 
> 
>  
> Marios K. <marios_hellas_23@yahoo.gr>
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

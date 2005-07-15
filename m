From: Dirk Van Hertem <dirk.vanhertem@ieee.org>
Subject: Re: [parisc-linux] Debian sarge netinstall hangs after first boot
	on b132l
Date: Fri, 15 Jul 2005 02:20:14 +0200
Message-ID: <42D7013E.2010400@ieee.org>
References: <42BAE85600005DFE@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-15
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42BAE85600005DFE@mail-6-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Joel Soete wrote:

>Hello Dirk,
>  
>
>>Hello,
>>
>>I got an hp b132l to play with :) and decided to put debian sarge on it,
>>
>>downloaded the latest netinstall cd from the web (debian site) and 
>>installed using serial console.
>>
>>    
>>
>Just being curious: didn't you try from sti (i.e. builtin graphical interface)?
>
>  
>
I don't have a screen, so I made a terminal out of my old P1 Linux machine

>>The install went ok, after making the initial ramdisk larger (64k 
>>instead of 16), and gave no errors, but after the copying of the files
>>    
>>
>
>  
>
>>and doing the first reboot. My system hung. I wasn't able to do anything
>>
>>    
>>
>Good to know
>
>  
>
>>(even the power button didn't work).
>>
>>The last message on my console was the following:
>>
>>HP SDC: Spunking the self test register to force PUP on next firmware
>>reset. HP SDC MLC: Registering the System Domain Controller's HIL MLC.
>>
>>    
>>
>Yes there are a lot of report on p-l and debian-hppa ml on this subject :_(
>
>  
>
sorry, i didn't see these messages, I thought that I did a thorough
google search though :(

>>Which is strange because there is no HIL stuff in this machine (this has
>>something to do with the keyboard if I'm correct, but the b132l uses 
>>ps/2 interfaces for mouse and keyboard).
>>
>>    
>>
>Yes but afaik the interface exist on this model (see a hpux ioscan) as well
>as on B160L (but not on B180 or B132L+) and it tried to initialize.
>  
>
>>Another strange thing was that the kernel that was chosen during install
>>was a smp kernel? (2.6.8...smp something, I didn't pay real attention at
>>that time)
>>
>>    
>>
>Yes very strange (but I have no clue about debian installer details :-( )
>  
>
I also have no clue about the debian installer :), but I more or less
tried the method you suggested below (opening a shell) and instead of
downloading a new kernel from the internet, I used an alternative one on
the cdrom disk (the one without smp, since the installed one was
definately the smp version from the cd). Afterwards the pc booted nice.
So the problem is definitely that the netinstall cdrom chooses a wrong
kernel for this machine.

The method I used for people having the same problem (it is a rough list
of things I did, but i guess it will be more than sufficient for most
people owning a hppa ;)).

I booted from cdrom with option ramdisk (don't know if this makes a
difference), with a ramsize of 65536
in the installation i chose the shell (you need to select <<Go Back>>
once or twice in the netinstall boot loader in order to go to the main menu)
look where the kernels are on the cdrom (which is mounted in /cdrom)
This was somewhere like /cdrom/pool/main/k/kernel..../
mkdir /mnt
mount your scsi on mnt: since there where no /dev/sdaX available, this
was for me doing something like:
mount /dev/scsi/..something../..something../target2
cp kernel_from_cdrom_location /mnt
cd /mnt
chroot .
dpkg -i kernel_filename.deb
palo
reboot

>What you coud do also, as the install-cd works fine, is to reboot from this
>cd and look for a sub-menu to enter into a shell script.
>
>Here you can setup your nic (to access the web if possible) and mainly mount
>your boot disk.
>(e.g. # mkdir /mnt/MyBoot ; mount /dev/sda5 /mnt/MyBoot ; mount /dev/sda6
>/mnt/MyBoot/var;...
>according to your slicing: sda5 would be replace by your own root partition
>sda6 your var if there is one, ...)
>
>Then you can chroot to this mount point (e.g. chroot /mnt/MyBoot )
>You would then be able to grab one of prebuild kernel e.g. from:
><http://cvs.parisc-linux.org/download/linux-2.6/> (I would recommended the
>one for b180 for your b132l)
>
>following instructions at the top of this page :-)
>
>To be sure umount your boot disk and try to reboot.
>
>That should work.
>  
>
And it did, thanks for the help

Dirk

-- 
Dirk Van Hertem                       Dirk.VanHertem@esat.kuleuven.be
Electrical Engineering Department  http://www.esat.kuleuven.be/electa
Katholieke Universiteit Leuven, ESAT-ELECTA      tel: +32-16-32.18.95
10, Kasteelpark Arenberg, B-3001 Heverlee        fax: +32-16-32.19.85 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

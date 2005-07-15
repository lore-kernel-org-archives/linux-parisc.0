From: Dirk Van Hertem <dirk.vanhertem@ieee.org>
Subject: Re: [parisc-linux] Debian sarge netinstall hangs after first boot
	on	b132l
Date: Fri, 15 Jul 2005 02:45:23 +0200
Message-ID: <42D70723.7020104@ieee.org>
References: <42BAE85600005DFE@mail-6-bnl.tiscali.it>
	<42D6FBB3.1030003@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-15
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42D6FBB3.1030003@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Kurt,

I didn't read this message before sending mine :), and sorry for sending
 this message first to you directly (this is a strange setting of the
mailing list?)

Kurt Fitzner wrote:

>Joel Soete wrote:
>
>>>I got an hp b132l to play with :) and decided to put debian sarge on it,
>>>downloaded the latest netinstall cd from the web (debian site) and 
>>>installed using serial console.
>>>      
>>Just being curious: didn't you try from sti (i.e. builtin graphical interface)?
>
>Booting with the graphic console on a B132L is difficult.  I just wrote
>about this in my post to the mailing list titled "Infinite error message
> from SDC driver on install".
>
>If you want to use the graphic console on a B132L, I found that if you
>manipulate the mouse continually (a nice even circular motion), that you
>are far less likely to get that infinite loop of SDC error messages.  I
>believe that this is dur to the same reason why installing with a serial
>console works (extra overhead of the mouse/serial interrupts allows the
>SDC driver a chance to time out).  Once you get the error message:
>  "HP SDC: read timeout (999999ms)"
>you are safe to stop moving the mouse.
>
so I'm glad I don't have such a screen :-)

>>>The install went ok, after making the initial ramdisk larger (64k 
>>>instead of 16), and gave no errors, but after the copying of the files
>>>and doing the first reboot. My system hung. I wasn't able to do anything
>
>The SMP kernels hang on a B132L.  You need to install a non-smp one.  In
>order to do this, you have to tell the installer not to make so many
>default decisions on its own.
>
>To do this, hit ESC when you are first asked about what language you
>want.  You'll then be in the main installer menu.  Cursor down to the
>entry "Change debconf priority".  Set it to "low".  After that, you will
>have to select each stage in the installation process manually, and you
>will be asked more questions at each stage, but you should be able to
>install a non-smp kernel now (it will ask you which kernel to install).
>
ok, this method seems a bit more "according to the book" than the one i used

>However, after the install, you still aren't out of the water yet.  The
>problem is the infinite SDC error will still be a problem because all
>the 32 bit kernels have the SDC and HIL drivers built in.  When you
>reboot your machine, you will need to do the mouse trick to get past the
>SDC errors.  
>
Indeed, i get some errors, but without doing anything (there was no
mouse available) it booted, and i was already quite pleased and just
ignored them for the time being :).

>Once your machine is booted up and you go through the
>secondary debian install process, you will need to download and compile
>your own kernel.  There is a good tutorial on this online for newbies
>(like I was) to Debian at:
>http://newbiedoc.sourceforge.net/system/kernel-pkg.html
>  
>Debian has some silliness with using an initrd ramdisk at boot time and
>making EVERYTHING into a module.  I didn't do this with my kernel.  I
>put the scsi drivers right into the kernel.  You end up getting some
>error messages at boot time from discover and hotplug (why Debian
>installs and uses BOTH, I have no idea) because they both try and load
>the scsi modules and there aren't any.  I ended up removing discover and
>configuring hotplug to ignore the SCSI subsystem (let me know if you
>want more info on that).
>
>I'd be very happy to offer you the debian package I compiled for my
>B132L.  It's made of the most recent 2.6.12-pa2 kernel source.
>
>Hope this helps,
>
>	Kurt (another B132L owner)
>
I would be happy to use that package (or if the file is to big and you'd
send me the .config file so that i would be able to compile it myself)

Thanks,

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

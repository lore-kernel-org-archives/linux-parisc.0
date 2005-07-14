From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] Debian sarge netinstall hangs after first boot on
	b132l
Date: Thu, 14 Jul 2005 17:56:35 -0600
Message-ID: <42D6FBB3.1030003@excelcia.org>
References: <42BAE85600005DFE@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-15
To: Joel Soete <soete.joel@tiscali.be>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <42BAE85600005DFE@mail-6-bnl.tiscali.it>
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

>>I got an hp b132l to play with :) and decided to put debian sarge on it,
>>downloaded the latest netinstall cd from the web (debian site) and 
>>installed using serial console.
> 
> Just being curious: didn't you try from sti (i.e. builtin graphical interface)?

Booting with the graphic console on a B132L is difficult.  I just wrote
about this in my post to the mailing list titled "Infinite error message
 from SDC driver on install".

If you want to use the graphic console on a B132L, I found that if you
manipulate the mouse continually (a nice even circular motion), that you
are far less likely to get that infinite loop of SDC error messages.  I
believe that this is dur to the same reason why installing with a serial
console works (extra overhead of the mouse/serial interrupts allows the
SDC driver a chance to time out).  Once you get the error message:
  "HP SDC: read timeout (999999ms)"
you are safe to stop moving the mouse.

>>The install went ok, after making the initial ramdisk larger (64k 
>>instead of 16), and gave no errors, but after the copying of the files
>>and doing the first reboot. My system hung. I wasn't able to do anything

The SMP kernels hang on a B132L.  You need to install a non-smp one.  In
order to do this, you have to tell the installer not to make so many
default decisions on its own.

To do this, hit ESC when you are first asked about what language you
want.  You'll then be in the main installer menu.  Cursor down to the
entry "Change debconf priority".  Set it to "low".  After that, you will
have to select each stage in the installation process manually, and you
will be asked more questions at each stage, but you should be able to
install a non-smp kernel now (it will ask you which kernel to install).

However, after the install, you still aren't out of the water yet.  The
problem is the infinite SDC error will still be a problem because all
the 32 bit kernels have the SDC and HIL drivers built in.  When you
reboot your machine, you will need to do the mouse trick to get past the
SDC errors.  Once your machine is booted up and you go through the
secondary debian install process, you will need to download and compile
your own kernel.  There is a good tutorial on this online for newbies
(like I was) to Debian at:
http://newbiedoc.sourceforge.net/system/kernel-pkg.html

Debian has some silliness with using an initrd ramdisk at boot time and
making EVERYTHING into a module.  I didn't do this with my kernel.  I
put the scsi drivers right into the kernel.  You end up getting some
error messages at boot time from discover and hotplug (why Debian
installs and uses BOTH, I have no idea) because they both try and load
the scsi modules and there aren't any.  I ended up removing discover and
configuring hotplug to ignore the SCSI subsystem (let me know if you
want more info on that).

I'd be very happy to offer you the debian package I compiled for my
B132L.  It's made of the most recent 2.6.12-pa2 kernel source.

Hope this helps,

	Kurt (another B132L owner)


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Richard Hirst <rhirst@linuxcare.com>
Subject: [parisc-linux] Re: if something is not done,
	hppa will not have an installer for sarge
Date: Mon, 12 Apr 2004 12:12:57 +0100
Message-ID: <20040412111257.GS20209__35653.3777936876$1416623361$gmane$org@linuxcare.com>
References: <20040411165459.GB11699@kitenet.net>
	<20040411171831.GA15032@mcmartin.ca>
	<20040411174629.GA12562@kitenet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Kyle McMartin <kyle@mcmartin.ca>, debian-boot@lists.debian.org,
	debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
Return-Path: <richard@sleepie.demon.co.uk>
In-Reply-To: <20040411174629.GA12562@kitenet.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Including parisc-linux@parisc-linux.org as that is where the hppa
developers tend to hang out.

I just had a quick try with 

http://gluck.debian.org/cdimage/testing/daily/hppa/20040411/sarge-hppa-businesscard.iso

I burnt an ISO, and it wouldn't boot on my B180.  It stopped after
'choosing a 32 bit kernel', which I assume indicates some palo
issue.  I believe the ISO was burnt ok, because I later loaded
the udebs from it.

Next I copied the 32 bit kernel and initrd.gz from the ISO and
generated a lifimage, using:

/sbin/palo -k vmlinux-2.4.25-32 -r initrd.gz -c 'ramdisk_size=8192 root=/dev/ram initrd=0/ramdisk devfs=mount,dall' -s di.lifimage -f /dev/null

That netbooted and the kernel started ok, but gave continual segfaults
in frontend, as we saw before.

Next I loopback mounted the initrd and copied the libm-2.3.2.so from
my (not very uptodate) sid system to the initrd overwriting the
libm.so.6 on there (which had been reduced to about 1200 bytes).
A workaround for the glibc issue is to avoid reducing libm to the
point where it has no symbols at all.

I gzipped the initrd again and reran palo.  The new lifimage booted
ok, used framebuffer, and looks fine.  I didn't try modifying any
disk partitions but it found the existing ones ok, including the
palo boot partition which was correctly recognised.

It may be relevant that my palo is 1.3, while the ISO was using
palo 1.4.

It may be relevant that the ISO had a rather long kernel commandline,
relative to the 127 char limit that palo claims.  I'm never sure
whether that 127 char limit is before or after palo adds all the
console and sti related parameters though.

As the ISO I burnt was still in the drive, d-i found that and loaded the
udebs from it.  I then went on to select a remote mirror for loading
the debs.

The install completed successfully, although it installed a 2.4.20
kernel (I guess that is the most recent in testing).

baseconfig worked, although I saw a message in the apt setup stage
briefly that looked like some shell complaint about '['.

Perhaps we should 'fix' mklibs on the system that builds the images to
not reduce libm completely.  Then we need to figure out what the palo
issue is.

This is what i currently have in my mklibs (which I guess worked
round the issue when I last worked on hppa d-i):

    # to be the only one and including it on alpha as well
    # doesn't hurt. I guess all archs can live with this.
    needed_symbols.add(("sys_siglist", 1))
    # This is a hack to stop libm being reduced to nothing
+   # RGH.
+   needed_symbols.add(("log", 1))

    # calculate what symbols are present in small_libs
    present_symbols = Set()

I was surprised to see seperate kernel images, initrd, and iplboot
files on the ISO.  I'd say most people netbooted their hppa boxes,
and we should include a complete lifimage rather than the individual
components.  It may be that this initrd wouldn't have worked if it
had needed to pull udebs from the net though.

Many thanks to the hppa developers that got us a 2.4.25 kernel for
d-i, and to Jeff for the daily images.

Richard


On Sun, Apr 11, 2004 at 01:46:29PM -0400, Joey Hess wrote:
> Kyle McMartin wrote:
> > [Instead of directly CC'ing you Joey, I'm cross-posting to debian-boot]
> > 
> > On Sun, Apr 11, 2004 at 12:54:59PM -0400, Joey Hess wrote:
> > > I just want to make sure that you hppa folk realise that hppa is further
> > > from having a working installer for sarge than any architecture aside
> > > from perhaps s390. AFAIK only one person is working on it at all (and
> > > he's currently away, and his time is split amoung other ports anyway).
> > > The d-i port really needs more than one person working on it, if it's
> > > going to ship with beta 4 of d-i. That's in two weeks.
> > > 
> > > Note that hppa basically worked in mid-January, but it's not been kept
> > > up.
> > > 
> > 
> > The problem with hppa now, seems to be the same as what Richard Hirst
> > reported in January. The initrd issues seem to have been taken care of,
> > and now it's simply a segmentation fault causing problems.
> > 
> > VFS: Mounted root (ext2 filesystem) readonly.                                   
> > Mounted devfs on /dev                                                           
> > Freeing unused kernel memory: 252k freed                                        
> > Setting up filesystem, please wait ...                                          
> > umount: /initrd: Invalid argument                                               
> > Segmentation fault                                                              
> > Segmentation fault
> > [...]
> > 
> > Is what I get when booting the latest netboot build on my 715/100XC.
> 
> There is a patch in the bts for this problem, #228375. I assme that a
> fixed libc6 will be uploaded eventually, but in the meantime I'd hope
> the workaround also in there, which Richard Hirst used, is enough to let
> things be tested and let everything else be gotten working. Basically,
> don't let this issue block you from working on the hppa port!
> 
> -- 
> see shy jo

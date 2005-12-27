From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] nscd: error while loading shared libraries:
	unexpected reloc type 0x42
Date: Tue, 27 Dec 2005 00:14:45 -0500
Message-ID: <200512270014.45080.vapier@gentoo.org>
References: <200512262147.jBQLlKKP018323@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512262147.jBQLlKKP018323@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Monday 26 December 2005 16:47, John David Anglin wrote:
> I'm seeing the following error in the boot log:
>
> Fri Nov 25 04:59:01 2005: Starting Name Service Cache Daemon:
> nscd/usr/sbin/nscd
>
> : error while loading shared libraries: unexpected reloc type 0x42
>
> Fri Nov 25 04:59:02 2005: .
>
> I think this is a R_PARISC_PLABEL21L reloc.  GCC doesn't generate these.
> So they must come from an asm or assembly code.  I think libc used this
> reloc for loading the address of the function descriptor of main.

this is because Redhat forces all network daemons to be built at PIEs ... thus 
glibc will build nscd as a PIE by default ... and since PIE doesnt work on 
parisc just yet, you see fun errors like the above

here's the hack patch i wrote Gentoo/hppa:
http://viewcvs.gentoo.org/sys-libs/glibc/files/2.3.4/hppa-no-pie.patch

good news though, when i mentioned this before:
http://lists.parisc-linux.org/pipermail/parisc-linux/2005-July/026865.html
people said it's in the works to be fixed :)
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

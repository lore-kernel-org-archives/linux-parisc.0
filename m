From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: nscd: error while loading shared libraries:
	unexpected reloc type 0x42
Date: Sat, 7 Jan 2006 18:53:24 -0500
Message-ID: <20060107235323.GT17559@baldric.uwo.ca>
References: <200512262154.jBQLshmK018411@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512262154.jBQLshmK018411@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 26, 2005 at 04:54:42PM -0500, John David Anglin wrote:
> > So they must come from an asm or assembly code.  I think libc used this
> > reloc for loading the address of the function descriptor of main.
> 
> objdump -R nscd
> ...
> 00005970 R_PARISC_PLABEL21L  main
> 00005974 R_PARISC_PLABEL14R  main
> 00005980 R_PARISC_PLABEL21L  __libc_csu_init
> 00005984 R_PARISC_PLABEL14R  __libc_csu_init
> 00005988 R_PARISC_PLABEL21L  __libc_csu_fini
> 0000598c R_PARISC_PLABEL14R  __libc_csu_fini
> 
> If I recall correctly, there was a dynamic loader fix to handle these
> relocations.  However, it doesn't seem to be in libc6 2.3.5-8.

It is in the one I have installed on my system :)

The proper fix was this:
http://cvs.parisc-linux.org/glibc/sysdeps/hppa/elf/start.S?r1=1.2&r2=1.3

Please verify.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

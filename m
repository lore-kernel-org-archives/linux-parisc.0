From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] nscd: error while loading shared libraries:
	unexpected reloc type 0x42
Date: Sat, 7 Jan 2006 18:48:38 -0500
Message-ID: <20060107234838.GR17559@baldric.uwo.ca>
References: <200512262147.jBQLlKKP018323@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
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

On Mon, Dec 26, 2005 at 04:47:20PM -0500, John David Anglin wrote:
> I'm seeing the following error in the boot log:
> 
> Fri Nov 25 04:59:01 2005: Starting Name Service Cache Daemon: nscd/usr/sbin/nscd
> : error while loading shared libraries: unexpected reloc type 0x42
> Fri Nov 25 04:59:02 2005: .
> 
> I think this is a R_PARISC_PLABEL21L reloc.  GCC doesn't generate these.
> So they must come from an asm or assembly code.  I think libc used this
> reloc for loading the address of the function descriptor of main.

This is what happens when GCC starts compiling things with -fpie I
believe. I saw this problem with the -fpie tests.

I have patches for libc to fix this in debian. I'll post these after I
get you to test them ... mmm kay? :)

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

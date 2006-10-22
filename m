From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [patch] Remove magic constant from gas/tc-hppa.c
Date: Sun, 22 Oct 2006 14:13:15 -0400
Message-ID: <20061022181315.GA21547__11638.4289962754$1416624199$gmane$org@hiauly1.hia.nrc.ca>
References: <200610211944.k9LJiE77010509@hiauly1.hia.nrc.ca>
	<1161466446.7854.86.camel@localhost.localdomain>
	<20061021233857.GA12282@hiauly1.hia.nrc.ca>
	<1161537558.5629.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: binutils@sources.redhat.com,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1161537558.5629.15.camel@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Oct 22, 2006 at 01:19:18PM -0400, Jeff Bailey wrote:

> Index: configure

Don't send diff's for generated files.

> +  {"%fr10",  bfd_mach_hppa10,  10 + FP_REG_BASE},
> +  {"%fr10l", bfd_mach_hppa10,  10 + FP_REG_BASE},
> +  {"%fr10r", bfd_mach_hppa10,  10 + FP_REG_BASE + FP_REG_RSEL},

The "fr" entries needs more work now that you have added bfd_mach
values.  bfd_mach_hppa10 only had 16 FP registers (0 to 15) and
the left and right halves were not accessible.  In bfd_mach_hppa11,
16 additional FP registers were added and the left and right
halves became independently accessible.

> +#  ifdef TE_NetBSD
> +#  define ELF_TARGET_FORMAT       "elf32-hppa-netbsd"
> +#  define ELF64_TARGET_FORMAT     "elf64-hppa-linux"

The above line appears to be a typo.  However, the elf64-hppa-netbsd
output format isn't defined yet.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [patch] Remove magic constant from gas/tc-hppa.c
Date: Sat, 21 Oct 2006 12:46:54 -0600
Message-ID: <20061021184654.GC2602__36733.2913367592$1416624198$gmane$org@parisc-linux.org>
References: <1161454639.7854.57.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: binutils <binutils@sources.redhat.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1161454639.7854.57.camel@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 21, 2006 at 02:17:19PM -0400, Jeff Bailey wrote:
> @@ -105,12 +105,6 @@ typedef som_symbol_type obj_symbol_type;
>  #endif
>  #endif /* OBJ_SOM */
>  
> -#if TARGET_ARCH_SIZE == 64
> -#define DEFAULT_LEVEL 25
> -#else
> -#define DEFAULT_LEVEL 10
> -#endif
> -
>  /* Various structures and types used internally in tc-hppa.c.  */
>  
>  /* Unwind table and descriptor.  FIXME: Sync this with GDB version.  */
> @@ -8259,7 +8253,11 @@ md_begin (void)
>    call_info_root = NULL;
>  
>    /* Set the default machine type.  */
> -  if (!bfd_set_arch_mach (stdoutput, bfd_arch_hppa, DEFAULT_LEVEL))
> +#if TARGET_ARCH_SIZE == 64
> +  if (!bfd_set_arch_mach (stdoutput, bfd_arch_hppa, bfd_mach_hppa10))
> +#else
> +  if (!bfd_set_arch_mach (stdoutput, bfd_arch_hppa, bfd_mach_hppa20w))
> +#endif
>      as_warn (_("could not set architecture and machine"));
>  
>    /* Folding of text and data segments fails miserably on the PA.

My personal preference would be to see this patch as:

 #if TARGET_ARCH_SIZE == 64
-#define DEFAULT_LEVEL 25
+#define DEFAULT_LEVEL bfd_mach_hppa20w
 #else
-#define DEFAULT_LEVEL 10
+#define DEFAULT_LEVEL bfd_mach_hppa10
 #endif

... particularly since you seem to have got them the wrong way round in
this patch.

I'd also dearly love it if someone could unify the hppa and hppa64 ports
so we don't have to build two toolchains for one port.  Just like sparc,
mips, s390 and i386.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

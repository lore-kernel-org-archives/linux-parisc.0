From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] parisc,metag: Do not hardcode maximum userspace stack
 size
Date: Thu, 1 May 2014 12:19:22 +0100
Message-ID: <53622DBA.807@imgtec.com>
References: <20140430212602.GA20601@p100.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="1JAMX7Irn0mKLGTxBkM0xOesmL4ArfhjB"
To: Helge Deller <deller@gmx.de>, <linux-kernel@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	<linux-metag@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140430212602.GA20601@p100.fritz.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--1JAMX7Irn0mKLGTxBkM0xOesmL4ArfhjB
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Helge,

On 30/04/14 22:26, Helge Deller wrote:
> This patch affects only architectures where the stack grows upwards
> (currently parisc and metag only). On those do not hardcode the maximum=

> initial stack size to 1GB, but make it configurable via a config option=
=2E
>=20
> The main problem with the hardcoded stack size is, that we have two
> memory regions which grow upwards: stack and heap. To keep most of the
> memory available for heap in a flexmap memoy layout, it makes no sense
> to hard allocate up to 1GB of the memory for stack which can't be used
> as heap then.
>=20
> This patch makes the stack size configurable and uses 80MB as default
> value which has been in use during the last few years on parisc and
> which didn't showed any problems yet.
>=20
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-metag@vger.kernel.org
> Cc: John David Anglin <dave.anglin@bell.net>
>=20
> diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_p=
arisc.c
> index 7d8cbd1..9118f01 100644
> --- a/arch/parisc/kernel/sys_parisc.c
> +++ b/arch/parisc/kernel/sys_parisc.c
> @@ -72,10 +72,10 @@ static unsigned long mmap_upper_limit(void)
>  {
>  	unsigned long stack_base;
> =20
> -	/* Limit stack size to 1GB - see setup_arg_pages() in fs/exec.c */
> +	/* Limit stack size - see setup_arg_pages() in fs/exec.c */
>  	stack_base =3D rlimit_max(RLIMIT_STACK);
> -	if (stack_base > (1 << 30))
> -		stack_base =3D 1 << 30;
> +	if (stack_base > CONFIG_MAX_STACK_SIZE_MB*1024*1024)
> +		stack_base =3D CONFIG_MAX_STACK_SIZE_MB*1024*1024;
> =20
>  	return PAGE_ALIGN(STACK_TOP - stack_base);
>  }
> diff --git a/fs/exec.c b/fs/exec.c
> index 476f3eb..994108c 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -657,10 +657,10 @@ int setup_arg_pages(struct linux_binprm *bprm,
>  	unsigned long rlim_stack;
> =20
>  #ifdef CONFIG_STACK_GROWSUP
> -	/* Limit stack size to 1GB */
> +	/* Limit stack size */
>  	stack_base =3D rlimit_max(RLIMIT_STACK);
> -	if (stack_base > (1 << 30))
> -		stack_base =3D 1 << 30;
> +	if (stack_base > CONFIG_MAX_STACK_SIZE_MB*1024*1024)
> +		stack_base =3D CONFIG_MAX_STACK_SIZE_MB*1024*1024;

When I remove metag's _STK_LIM_MAX override (before your patch) it
panics when I next start a process (since stack_top =3D 0x3ffff000 so the=

1GB default is way too big).

That could actually always have been triggered even with the default
_STK_LIM_MAX override, by just changing it from userland (as root),
e.g.:
# ulimit -H -s unlimited
# cat
BUG: failure at fs/exec.c:589/shift_arg_pages()!
Kernel panic - not syncing: BUG!

I'm guessing this doesn't affect parisc due to stack_top being above
1GB, but since this patch effectively fixes a bug on metag (by changing
the maximum stack size to a smaller/safe value) I'd like to take this
patch and submit upstream for v3.15, and mark for stable. Would that be
okay with you?

A few suggestions below though...

> =20
>  	/* Make sure we didn't let the argument array grow too large. */
>  	if (vma->vm_end - vma->vm_start > stack_base)
> diff --git a/init/Kconfig b/init/Kconfig
> index 9d3585b..436e479 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1862,6 +1862,17 @@ config STOP_MACHINE
>  	help
>  	  Need stop_machine() primitive.
> =20
> +config MAX_STACK_SIZE_MB
> +	int "Default initial maximum stack size"
> +	default 80

can we insert here:
range 8 256 if METAG

> +	range 8 2048
> +	depends on STACK_GROWSUP
> +	help
> +	  This is the default initial stack size in Megabytes in the VM layou=
t of user
> +	  processes when the stack grows upwards (currently only on parisc an=
d matag
> +	  arch).  The stack will be located at the highest memory address min=
us the
> +	  given value. A sane initial value is 80 MB.

This config option appears in the root menu. Can we move it into a
submenu, e.g. mm/Kconfig would seem a good place for it, then it appears
in the "Processor type and features" menu.

Also, technically it's the absolute maximum stack size, which happens to
be the default unless the user reduces the RLIMIT_STACK hard limit.

How does the v2 below look?

=46rom c34f0ec062ae1a2c9fca3eddbc705f6b0faf97ca Mon Sep 17 00:00:00 2001
From: Helge Deller <deller@gmx.de>
Date: Wed, 30 Apr 2014 23:26:02 +0200
Subject: [PATCH v2] parisc,metag: Do not hardcode maximum userspace stack=

 size

This patch affects only architectures where the stack grows upwards
(currently parisc and metag only). On those do not hardcode the maximum
initial stack size to 1GB, but make it configurable via a config option.

The main problem with the hardcoded stack size is, that we have two
memory regions which grow upwards: stack and heap. To keep most of the
memory available for heap in a flexmap memoy layout, it makes no sense
to hard allocate up to 1GB of the memory for stack which can't be used
as heap then.

This patch makes the stack size configurable and uses 80MB as default
value which has been in use during the last few years on parisc and
which didn't showed any problems yet.

This also fixes a BUG on metag if the RLIMIT_STACK hard limit is
increased beyond a safe value by root. E.g. when starting a process
after running "ulimit -H -s unlimited" it will then attempt to use a
stack size of the maximum 1GB which is far too big for metag's limited
user virtual address space (stack_top is usually 0x3ffff000):
BUG: failure at fs/exec.c:589/shift_arg_pages()!

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: linux-parisc@vger.kernel.org
Cc: linux-metag@vger.kernel.org
Cc: John David Anglin <dave.anglin@bell.net>
Cc: stable@vger.kernel.org
---
v2 (James Hogan):
 - updated description to mention BUG on metag.
 - added custom range limit for METAG.
 - moved Kconfig symbol to mm/Kconfig and reworded.
 - fixed "matag" typo.
---
 arch/parisc/kernel/sys_parisc.c |  6 +++---
 fs/exec.c                       |  6 +++---
 mm/Kconfig                      | 15 +++++++++++++++
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_par=
isc.c
index 31ffa9b55322..9f040261151e 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -72,10 +72,10 @@ static unsigned long mmap_upper_limit(void)
 {
 	unsigned long stack_base;

-	/* Limit stack size to 1GB - see setup_arg_pages() in fs/exec.c */
+	/* Limit stack size - see setup_arg_pages() in fs/exec.c */
 	stack_base =3D rlimit_max(RLIMIT_STACK);
-	if (stack_base > (1 << 30))
-		stack_base =3D 1 << 30;
+	if (stack_base > CONFIG_MAX_STACK_SIZE_MB*1024*1024)
+		stack_base =3D CONFIG_MAX_STACK_SIZE_MB*1024*1024;

 	return PAGE_ALIGN(STACK_TOP - stack_base);
 }
diff --git a/fs/exec.c b/fs/exec.c
index 476f3ebf437e..994108cc60f3 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -657,10 +657,10 @@ int setup_arg_pages(struct linux_binprm *bprm,
 	unsigned long rlim_stack;

 #ifdef CONFIG_STACK_GROWSUP
-	/* Limit stack size to 1GB */
+	/* Limit stack size */
 	stack_base =3D rlimit_max(RLIMIT_STACK);
-	if (stack_base > (1 << 30))
-		stack_base =3D 1 << 30;
+	if (stack_base > CONFIG_MAX_STACK_SIZE_MB*1024*1024)
+		stack_base =3D CONFIG_MAX_STACK_SIZE_MB*1024*1024;

 	/* Make sure we didn't let the argument array grow too large. */
 	if (vma->vm_end - vma->vm_start > stack_base)
diff --git a/mm/Kconfig b/mm/Kconfig
index ebe5880c29d6..e80075979530 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -581,3 +581,18 @@ config PGTABLE_MAPPING

 config GENERIC_EARLY_IOREMAP
 	bool
+
+config MAX_STACK_SIZE_MB
+	int "Maximum user stack size (MB)"
+	default 80
+	range 8 256 if METAG
+	range 8 2048
+	depends on STACK_GROWSUP
+	help
+	  This is the maximum stack size in Megabytes in the VM layout of user
+	  processes when the stack grows upwards (currently only on parisc and
+	  metag arch). The stack will be located at the highest memory address
+	  minus the given value, unless the RLIMIT_STACK hard limit is changed
+	  to a smaller value in which case that is used.
+
+	  A sane initial value is 80 MB.
--=20
1.9.2



--1JAMX7Irn0mKLGTxBkM0xOesmL4ArfhjB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTYi3BAAoJEGwLaZPeOHZ6GNkP/0F2iR2GWkGRQj4QRyqqvQjV
vOrKAovimPPkHf+AtVLr883afywDsdYH9MLiS3PAcyAKAu3vCGnsbhtdj3zl/91v
7wpq4FMomgE3bOJVLSSezkELCHeQZjWc0ZZGBhovn45SLKvWEx4ynmjQYorT5bYp
4jT3SRoW5ZDJ4ZecfMGJ42mc2e0+pkL0LdmpFUxE/oPWv1nslNQlhHifnURh3BC9
aN4fDb8lb8WdWXIjyMQrbAvbYkrdAwKjfqga8jy96SPtM/t+X2kISoaawwa7lNl4
Tho219ZtcRnW6RecMdMGUGniG50GuvwFYqXnDQiv8bx47gLaKKpMGDcJGWE7wgO9
eceP/ZYxPc4JzfbugDnG2T1l1joCV6Ks8lws6vOgcRgmPs5RnynBzu+PLgkpWRYA
bSFywDPDXIuqMiLfsqO30pZYmKQAmD7j9f7lGcmg4iLPA/UJYSIdQSVJ54VdGhmt
+m6CKPsxcJqVmvJXypKuRmX7JyGYG4C1x7L2lX+W3oz0pl3gCjAaTnY0j+yOmsog
w/Z3z4WQMwlbqPbmzrkH6hsJbbwX7OvNSbieiZEhGm2OPPPF7LUtzClOJIUCh+Rn
TmlkA+X4q7LFW6VNoVcu70mATEjGbROPttH5DYojPhcu5Gs47Xts/mLJN7qlIN0n
D7hMDAKhKOdr2JOgsU2B
=DZa0
-----END PGP SIGNATURE-----

--1JAMX7Irn0mKLGTxBkM0xOesmL4ArfhjB--

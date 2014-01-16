From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] Make EWOULDBLOCK be equal to EAGAIN on parisc.
Date: Thu, 16 Jan 2014 15:02:02 -0500
Message-ID: <CAE2sS1gmD21qT=UPJEt9VfAnE=e-k=qwkQM0nUO0viMaJSm3ng@mail.gmail.com>
References: <7b86ec9f26dd9a18e7fae7a39e6a3382@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7b86ec9f26dd9a18e7fae7a39e6a3382@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jan 16, 2014 at 11:17 AM, Guy Martin <gmsoft@tuxicoman.be> wrote:
> On Linux, only parisc uses a different value for EWOULDBLOCK which
> causes a lot of troubles for applications not checking for both values.
> Since the hpux compat is long dead, make EWOULDBLOCK behave the same as
> all other architectures.
>
> Signed-off-by: Guy Martin  <gmsoft@tuxicoman.be>
> ---
>  arch/parisc/include/uapi/asm/errno.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/parisc/include/uapi/asm/errno.h
> b/arch/parisc/include/uapi/asm/errno.h
> index f3a8aa5..c0ae625 100644
> --- a/arch/parisc/include/uapi/asm/errno.h
> +++ b/arch/parisc/include/uapi/asm/errno.h
> @@ -106,7 +106,7 @@
>
>  #define        EALREADY        244     /* Operation already in progress */
>  #define        EINPROGRESS     245     /* Operation now in progress */
> -#define        EWOULDBLOCK     246     /* Operation would block (Linux
> returns EAGAIN) */
> +#define        EWOULDBLOCK     EAGAIN  /* Operation would block (Not HPUX
> compliant) */
>  #define        ENOTEMPTY       247     /* Directory not empty */
>  #define        ENAMETOOLONG    248     /* File name too long */
>  #define        ELOOP           249     /* Too many symbolic links
> encountered */

This is an ABI break.

You can't do this without rebuilding userspace.

You need debian an gentoo onboard to do this ABI break.

Cheers,
Carlos.

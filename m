From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] extract-vmlinux: Check for uncompressed image as fallback
Date: Wed, 17 Oct 2018 15:45:42 +0900
Message-ID: <CAK7LNAQgmjZ53x240HH7ktOS0oqPiO5drkN2E74zUkdwuBmybg@mail.gmail.com>
References: <20181016060324.GA10928@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Adam Borowski <kilobyte@angband.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        dave.anglin@bell.net, corentincj@iksaif.net
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016060324.GA10928@ls3530.fritz.box>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,



On Tue, Oct 16, 2018 at 3:06 PM Helge Deller <deller@gmx.de> wrote:
>
> As on x86-64 and other architectures, the boot kernel on parisc (vmlinuz
> and bzImage) contains a full compressed copy of the final kernel
> executable (vmlinux.bin.gz), which one should be able to extract with
> the extract-vmlinux script.
>
> But on parisc extracting the kernel with extract-vmlinux fails.
> Currently the script first checks if the given file is an ELF file
> (which is true on parisc) and if so returns it.  Thus on parisc we
> unexpectedly get back the vmlinuz boot file instead of the uncompressed
> vmlinux image.
>
> This patch fixes this issue by reverting the logic. It now first tries
> to find a compression signature in the given file and if that fails it
> checks the file itself as fallback.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
> index e6239f39abad..85e1f32fb4a0 100755
> --- a/scripts/extract-vmlinux
> +++ b/scripts/extract-vmlinux
> @@ -48,9 +48,6 @@ fi
>  tmp=$(mktemp /tmp/vmlinux-XXX)
>  trap "rm -f $tmp" 0
>
> -# Initial attempt for uncompressed images or objects:
> -check_vmlinux $img
> -

This patch looks good in general,
but, I just wondered why this line is needed.

If I understand this correctly,
when vmlinux itself is passed to this script,
it is returned as-is.
But, we already have what we want in this case.

We can simply drop this code if there is no good reason.

CC'ed the submitter of this script, Corentin Chary
in case he knows something.


>  # That didn't work, so retry after decompression.
>  try_decompress '\037\213\010' xy    gunzip
>  try_decompress '\3757zXZ\000' abcde unxz
> @@ -60,5 +57,8 @@ try_decompress '\211\114\132' xy    'lzop -d'
>  try_decompress '\002!L\030'   xxx   'lz4 -d'
>  try_decompress '(\265/\375'   xxx   unzstd
>
> +# Finally check for uncompressed images or objects:
> +check_vmlinux $img
> +
>  # Bail out:
>  echo "$me: Cannot find vmlinux." >&2




--
Best Regards
Masahiro Yamada

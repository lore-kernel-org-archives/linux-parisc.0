From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Cell support and fix PCI PDC paths
Date: Fri, 29 Dec 2006 04:20:18 +0100
Message-ID: <7d01f9f00612281920y35512sae142aeb431002a__14355.3589623936$1416624633$gmane$org@mail.gmail.com>
References: <20061225231328.GA5741@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061225231328.GA5741@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Barely catching up, a couple of questions ;)

On 12/26/06, Matthew Wilcox <matthew@wil.cx> wrote:

> @@ -326,6 +335,10 @@ static void get_node_path(struct device *dev, struct hardware_path *path)
>  static char *print_hwpath(struct hardware_path *path, char *output)
>  {
>         int i;
> +
> +       if (is_pdc_pat())
> +               output += sprintf(output, "%u/", path->flags & HWP_CELL);
> +

I suppose this change needs to go in pdcspath_layer_read() as well?
(in pdc_stable.c)

AIUI that means that the 'write' procedure needs some rewrite to cope
with this additional field, doesn't it?

Put another way, changing the console/kbd/etc paths with the
pdc_stable driver with this patch applied will just harm the box,
right?

> diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
> index ea1b7a6..66afab8 100644
> --- a/drivers/parisc/pdc_stable.c
> +++ b/drivers/parisc/pdc_stable.c

> @@ -597,19 +598,28 @@ pdcs_timer_read(struct subsystem *entry, char *buf)
>  {
>         char *out = buf;
>         struct pdcspath_entry *pathentry;
> +       int timer;
>
>         if (!entry || !buf)
>                 return -EINVAL;
>
> +       /*
> +        * PDC PAT machines use the timer field for something different.
> +        * I don't know where they keep the timer field now ...
> +        */
> +       if (is_pdc_pat())
> +               return -ENODEV;

I guess the best thing would be to simply not expose the 'timer' file
in sysfs on those boxen, I'll check how to do that cleanly.

HTH, nite all ;)

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

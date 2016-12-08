From: bojan prtvar <prtvar.b@gmail.com>
Subject: Re: [patch] parisc: perf: return -EFAULT on error
Date: Thu, 8 Dec 2016 15:53:42 +0100
Message-ID: <CAOmT4fTi+7r=1OJsumVC_+ET-NXcGjsZ5+t5ppm0eZZ2VeuF-A@mail.gmail.com>
References: <20161208113200.GC11382@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20161208113200.GC11382@elgon.mountain>
List-ID: <linux-parisc.vger.kernel.org>

Hi Dan,

On Thu, Dec 8, 2016 at 12:32 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> -       if ((err = copy_from_user(&image_type, buf, sizeof(uint32_t))) != 0)
> -               return err;

Why not delete err?

Regards,
Bojan

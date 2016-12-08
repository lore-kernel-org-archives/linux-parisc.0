From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] parisc: perf: return -EFAULT on error
Date: Thu, 8 Dec 2016 18:10:15 +0300
Message-ID: <20161208151014.GW8176@mwanda>
References: <20161208113200.GC11382@elgon.mountain>
 <CAOmT4fTi+7r=1OJsumVC_+ET-NXcGjsZ5+t5ppm0eZZ2VeuF-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To: bojan prtvar <prtvar.b@gmail.com>
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <CAOmT4fTi+7r=1OJsumVC_+ET-NXcGjsZ5+t5ppm0eZZ2VeuF-A@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 08, 2016 at 03:53:42PM +0100, bojan prtvar wrote:
> Hi Dan,
> 
> On Thu, Dec 8, 2016 at 12:32 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > -       if ((err = copy_from_user(&image_type, buf, sizeof(uint32_t))) != 0)
> > -               return err;
> 
> Why not delete err?

Gar... I'm sorry.  I'll resend.

regards,
dan carpenter


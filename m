From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] parisc: convert /proc/pdc/{lcd,led} to seq_file
Date: Sat, 28 Nov 2009 22:17:52 -0700
Message-ID: <20091129051752.GA14332@lackof.org>
References: <20091127065112.GC26327@x200.malnet.ru> <20091128061354.GA21113@lackof.org> <20091128092509.GA4375@x200.malnet.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>, kyle@mcmartin.ca,
	akpm@linux-foundation.org, linux-parisc@vger.kernel.org
To: Alexey Dobriyan <adobriyan@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091128092509.GA4375@x200.malnet.ru>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Nov 28, 2009 at 12:25:09PM +0300, Alexey Dobriyan wrote:
> On Fri, Nov 27, 2009 at 11:13:54PM -0700, Grant Grundler wrote:
> > On Fri, Nov 27, 2009 at 09:51:12AM +0300, Alexey Dobriyan wrote:
> > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > 
> > No commit comment?
> 
> No, subject says it's all.

The subject line says what the patch does, not why you wrote the patch.
Your comments below are an example of what I was looking for.

> 
> > > -	ent = create_proc_entry("led", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
> > > +	ent = proc_create_data("led", S_IRUGO|S_IWUSR, proc_pdc_root,
> > > +				&led_proc_fops, (void *)LED_NOLCD); /* LED */
> > 
> > Documentation/filesystems/seq_file.txt says to use create_proc_entry().
> > I couldn't find any documentation on proc_create_data().
> > Is this really the preferred API?
> 
> Yes, it's slightly less racy than create_proc_entry().
> create_proc_entry() is going to be removed in fact.

Ok. Please add a sentence about which race you are worried about.
This isn't to discuss the race - it's just informative to explain
why there is a plan to replace the API. I'm willing to go along with
that.

Are you removing create_proc_entry() ? Is this patch part of a grand plan?
(All good things to include in a commit comment)

Also updating Documentation/filesystems/seq_file.txt would be very
helpful given you understand why proc_create_data() should replace
create_proc_entry().

thanks!
grant

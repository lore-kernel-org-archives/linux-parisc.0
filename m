From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH] parisc: convert /proc/pdc/{lcd,led} to seq_file
Date: Sat, 28 Nov 2009 12:25:09 +0300
Message-ID: <20091128092509.GA4375@x200.malnet.ru>
References: <20091127065112.GC26327@x200.malnet.ru>
 <20091128061354.GA21113@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@mcmartin.ca, akpm@linux-foundation.org,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091128061354.GA21113@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Nov 27, 2009 at 11:13:54PM -0700, Grant Grundler wrote:
> On Fri, Nov 27, 2009 at 09:51:12AM +0300, Alexey Dobriyan wrote:
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> 
> No commit comment?

No, subject says it's all.

> > -	ent = create_proc_entry("led", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
> > +	ent = proc_create_data("led", S_IRUGO|S_IWUSR, proc_pdc_root,
> > +				&led_proc_fops, (void *)LED_NOLCD); /* LED */
> 
> Documentation/filesystems/seq_file.txt says to use create_proc_entry().
> I couldn't find any documentation on proc_create_data().
> Is this really the preferred API?

Yes, it's slightly less racy than create_proc_entry().

create_proc_entry() is going to be removed in fact.

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA06215
	for <parisc-linux@puffin.external.hp.com>; Sun, 7 Nov 1999 05:52:51 -0700
Date: Sun, 7 Nov 1999 13:55:16 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Andi <der_fisch@fischlustig.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cant use  rbootd
Message-ID: <19991107135516.O25252@mencheca.ch.genedata.com>
References: <199911030250.TAA16563@puffin.external.hp.com> <19991106192023.F11609@mathe.stud.uni-erlangen.de> <19991107125314.N25252@mencheca.ch.genedata.com> <99110713214800.00507@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <99110713214800.00507@beavis>; from Andi on Sun, Nov 07, 1999 at 01:18:39PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Nov 07, 1999 at 01:18:39PM +0100, Andi wrote:
> Hi,
> 
> I am using an rbootd running on Debian 2.1 , but my HP 712/60 cant find it, I
> put the correct ethernet adress in the /etc/rbootd.conf
> 
> but nothing happens if i type
> 
> BOOT_ADMIN> search lan

Is rbootd definitely running?  I find that if it can't change to the
appropriate directory, it just exits silently.

BTW, /export/hp is exactly the same length as /usr/local, so

sed -e s:/export/hp:/usr/local:

allows you to use /usr/local/rbootd as somewhere to put kernels if you
don't fancy clusteering your /.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

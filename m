Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA14313
	for <parisc-linux@puffin.external.hp.com>; Mon, 24 Jul 2000 02:08:46 -0600
Message-ID: <20000724081006.25948.qmail@web514.mail.yahoo.com>
Date: Mon, 24 Jul 2000 01:10:06 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] HIL support on 715/old ?
To: Gyula Matics <mgyula@pi.satimex.tvnet.hu>, parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

--- Gyula Matics <mgyula@pi.satimex.tvnet.hu> wrote:
> > As I wrote earlier to this list ( see
> >
>
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/06-Jun/0018.html
> > ) the linux-2.3-pre8 is not able to boot on a
> 715/old.
> > It hangs during the initialization of the ASP
> chip. So
> > I guess that HIL (which depends on ASP) is not
> working
> > right now either.
> 
> actually, the hang happens during parport
> initialization, when it tests
> for ps2 (bi-directional) support.
> 
> It works fine without parport support.
> 
> Gyula
> 
> 

Thanks for the tip. Now the kernel boots until the
sash prompt.

Ulrich


__________________________________________________
Do You Yahoo!?
Get Yahoo! Mail – Free email you can access from anywhere!
http://mail.yahoo.com/

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA31218
	for <parisc-linux@puffin.external.hp.com>; Mon, 2 Oct 2000 08:25:37 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 2 Oct 2000 14:26:32 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13g6Xt-0004NO-00; Mon, 02 Oct 2000 15:26:21 +0100
Date: Mon, 2 Oct 2000 15:26:21 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] I am not your mother!
Message-ID: <20001002152621.A9761@parcelfarce.linux.theplanet.co.uk>
References: <20000930200218.A25304@parcelfarce.linux.theplanet.co.uk> <87u2avmioo.fsf@ottawa.linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87u2avmioo.fsf@ottawa.linuxcare.com>; from dhd@linuxcare.com on Mon, Oct 02, 2000 at 10:17:11AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 02, 2000 at 10:17:11AM -0400, David Huggins-Daines wrote:
> Matthew Wilcox <matthew@wil.cx> writes:
> 
> > Is there anything which can be done to make updating the website easier?
> 
> I keep losing the password, that's the only problem.

It's tunnelled over ssh.  You can put your identity.pub in the appropriate
machine's authorized_keys file.  Hm, I should probably take mine out :-)
It's currently up to date.

> I'd really prefer to have the website be updated from a cron job.

Doable.  I'd prefer this as well -- or even better from a trigger which
runs as soon as there's a cvs commit to the website directory.

> Obviously it would be better for it to be hosted on PEHC in this case,
> since otherwise we'd have to store the password in the clear on
> PEHC or whatever machine runs that job.

I think the plan is to move it to pehc once pehc's been upgraded.
Matt?  Any idea on when this'll happen?

-- 
Revolutions do not require corporate support.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA19587
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 10:56:56 -0700
To: Alex deVries <adevries@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New web site in CVS... 
In-Reply-To: Message from Alex deVries <adevries@linuxcare.com>
   of "Mon, 18 Dec 2000 11:05:48 EST." <3A3E35DC.1DA98F7@linuxcare.com>
References: <3A3E35DC.1DA98F7@linuxcare.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Dec 2000 11:01:41 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001218180141.298CE37CA1@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Alex deVries writes...

> 
> I've checked in the redone web site into CVS; it's in a module called
> 'web'.
[snip]
> 
> The content, however, I'd appreciate feedback and CVS commits on. 
> Please be constructive.

Ok I just committed some fixes. I have a couple comments,

- someone should run a link checker over the site. I tried a lot by hand but 
didn't want to spend the time to do all the weekly reports, etc.

- weekly/index.html shows the last update from May 12, 2000 and the links are 
broken. I don't know if we should go to the trouble to change all the old 
reports(and probably shouldn't for historical reasons) but if we released a 
new weekly report it would displace this old/b0rken one.

- hardware/index.html is not done. I will take a look at it shortly.

-- 
Matt Taggart
taggart@fc.hp.com

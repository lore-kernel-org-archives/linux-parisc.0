Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA01710
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 17:16:04 -0700
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com, jes@linuxcare.com
Subject: Re: [parisc-linux] phase 2 gcc build fails 
In-Reply-To: Message from Alan Modra <alan@linuxcare.com.au>
   of "Thu, 14 Dec 2000 11:07:01 EST." <Pine.LNX.4.21.0012141101510.2565-100000@front.linuxcare.com.au>
References: <Pine.LNX.4.21.0012141101510.2565-100000@front.linuxcare.com.au> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Dec 2000 17:20:46 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001214002046.6D9BE37CA1@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Alan Modra writes...

> On Wed, 13 Dec 2000, Matt Taggart wrote:
> 
> > Anyone have an idea?
> 
> I probably broke the CVS repo, when I ran "cvs admin -b" following your
> updated recipe.  I do have a checked-out tree, to probably can put things
> back as they were.

Since admin -b reverts the default branch, wouldn't importing cygnus source 
fix things?

* taggart gets out the mang-signal

-- 
Matt Taggart
taggart@fc.hp.com

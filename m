From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Sun, 1 Nov 2009 20:40:26 -0500
Message-ID: <20091102014025.GA12169@hiauly1.hia.nrc.ca>
References: <20091029233501.152D1500F@hiauly1.hia.nrc.ca> <4AEB6CEB.6010205@gmx.de> <20091101231654.GA11493@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091101231654.GA11493@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 01 Nov 2009, John David Anglin wrote:

> On Fri, 30 Oct 2009, Helge Deller wrote:
> 
> > But when compiling the kernel something is still wrong.
> > I tried it a few times now, recompiled binutils, the kernel and so on.
> > I'm not 100% sure that I did everything correct, but I still think there is
> > something wrong...
> 
> I believe that you are correct but I think we have another unrelated bug.
> It appears that the unwind data is getting messed up in the link of
> built-in.o.

It seems the unwind data is being sorted by ld -r.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

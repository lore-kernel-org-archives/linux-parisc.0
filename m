From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: I have 12GB of RAM but I can only use 1GB?
Date: Thu, 20 Sep 2012 00:19:59 -0400
Message-ID: <505A996F.4040807@systemhalted.org>
References: <CAE2sS1i5E9FDB_5aw+mTySEysOjuLjOQn7S_pOL5-EMBOudqPg@mail.gmail.com> <2698994.p4ZeTnMdFO@donald.sf-tec.de> <BLU0-SMTP21E4975DA9B1176FC72936979B0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP21E4975DA9B1176FC72936979B0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9/19/2012 7:26 PM, John David Anglin wrote:
> On 19-Sep-12, at 2:06 AM, Rolf Eike Beer wrote:
> 
>> IIRC you need CONFIG_DISCONTIGMEM.
> 
> Enclosed is my latest kernel patch against 3.5.4.
> 
> One of things it addresses is an issue with CONFIG_DISCONTIGMEM introduced in 3.4.
> 
> Another new thing is a hack which tries to paper over a softirq problem.  For some reason,
> we sometimes run off the end of the vector pending list causing a panic.  This is probably related
> to the restart issues discussed by Al Viro as things were worse with Al's suggested change.

Rolf, Thibaut (on Google+), thanks for pointing out that 
without CONFIG_DISCONTIGMEM we don't pickup the other 
ranges. I have a patch to make the kernel warnings messages
clearer about this.

Dave, Thanks for the patch!

Cheers,
Carlos.


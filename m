Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 18 Aug 2003 23:08:29 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Chuck Slivkoff <caslivkoff@speakeasy.net>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: xchat colors (Was Re:  [parisc-linux] xfree86 4.2.1-9 build problem)
Message-ID: <20030819050829.GF27208@dsl2.external.hp.com>
References: <20030815172142.GA19042@dsl2.external.hp.com> <F09536E0-CFFC-11D7-B685-000393581E44@speakeasy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <F09536E0-CFFC-11D7-B685-000393581E44@speakeasy.net>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Aug 16, 2003 at 11:18:50AM -0400, Chuck Slivkoff wrote:
> If you can accept the "off" colors that 
> an 8-bit TrueColor default visual would give you (due to the uneven 
> 3/3/2 split between R/G/B), that would be the easiest solution & would 
> ensure that all clients can get the colors they want.

Chuck, thanks again!

I can live with off colors since this seems to work.
(thanks again Alan too)

I'll submit a patch to xchat so at least it checks the
gdk return values and complains if it can't get the colors.

thanks,
grant

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] alpha/parisc: Removing config variable
	DEBUG_RWLOCK
Date: Fri, 16 Nov 2007 10:32:48 -0700
Message-ID: <20071116173248.GB13967@colo.lackof.org>
References: <473C065D.1000000@gmail.com>
	<20071115190605.GF20892@colo.lackof.org>
	<alpine.LFD.0.9999.0711151453230.4568@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: kernel-janitors@vger.kernel.org,
 ink@jurassic.park.msu.ru,
 Andrew Morton <akpm@linux-foundation.org>,
 parisc-linux@parisc-linux.org,
 Jiri Olsa <olsajiri@gmail.com>,
 rth@twiddle.net
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <alpine.LFD.0.9999.0711151453230.4568@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Nov 15, 2007 at 02:54:45PM -0500, Robert P. J. Day wrote:
...
> > > -# CONFIG_DEBUG_RWLOCK is not set
> > >  # CONFIG_DEBUG_RODATA is not set
> 
> IIRC, you typically don't bother fixing up the defconfig files --
> those will be regenerated eventually.

It's not automatic though. So I don't mind the update.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

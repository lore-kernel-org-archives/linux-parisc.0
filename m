From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: 2.6.14-rc2-pa6 issues on C3000
Date: Thu, 20 Oct 2005 12:34:58 -0600
Message-ID: <20051020183458.GA4784@colo.lackof.org>
References: <20051020062518.GG29348@colo.lackof.org>
	<200510201743.j9KHhO2F024222@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200510201743.j9KHhO2F024222@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Oct 20, 2005 at 01:43:24PM -0400, John David Anglin wrote:
> > On Wed, Oct 19, 2005 at 06:53:40PM -0400, John David Anglin wrote:
> > > Ok, these are the warnings from make modules_install install:
> > > 
> > > if [ -r System.map -a -x /sbin/depmod ]; then /sbin/depmod -ae -F System.map  2.
> > > 6.14-rc2-pa7; fi
> > > WARNING: /lib/modules/2.6.14-rc2-pa7/kernel/net/ipv6/xfrm6_tunnel.ko needs unkno
> > > wn symbol xfrm6_rcv_spi
> > 
> > To help rule out toolchain differences, I repeated building -pa7 on
> > "unstable" debian using c3000_defconfig. That's using gcc v4.0.2.
> 
> The problem is caused by using cvs binutils-2.16.91 20051016.

Ah ok - this is currently installed on gsyprf7 (aka ios):
ii  binutils       2.16.1cvs20050 The GNU assembler, linker and binary utiliti

(debian unstable)

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

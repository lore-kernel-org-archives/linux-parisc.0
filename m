From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] KDB v4.4 support for parisc-linux
Date: Sat, 7 Aug 2004 15:30:28 -0400
Message-ID: <20040807193028.GO2672@baldric.uwo.ca>
References: <20040806220054.GB546@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040806220054.GB546@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Aug 06, 2004 at 03:00:54PM -0700, Randolph Chung wrote:
> KDB 4.4 support for parisc-linux is now available. 
> 
> To use it, first get the arch-indep kdb patch from SGI:
> ftp://oss.sgi.com/projects/kdb/download/v4.4/kdb-v4.4-2.6.8-rc2-common-1.bz2
> 
> Then apply the parisc-specific patch:
> http://ftp.parisc-linux.org/patches/kdb-v4.4-2.6.8-rc2-parisc-1.bz2
> 
> Tested in 32-bit UP and 64-bit UP/SMP against 2.6.8-rc2-pa6. There are
> still various bugs and unimplemented features, but it might still be
> interesting.

Wicked! I'll have to test this right now for my lws changes.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Randolph Chung <randolph@tausq.org>
Subject: Re: flush_kernel_[di]cache_page question? [WAS: [parisc-linux]
	2.6.10-rc1-pa11 profile data
Date: Fri, 26 Nov 2004 09:13:32 -0800
Message-ID: <20041126171332.GI9148@tausq.org>
References: <20041111081154.GR15714@tausq.org>
	<418A81170000898E@mail-8-bnl.mail.tiscali.sys>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A81170000898E@mail-8-bnl.mail.tiscali.sys>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I try google on the p-l m-l but I didn't reach to find out why those chain
> of 15 f[di]c,m?

16, actually (including the one in the delay slot of the cmpib).

,m is post increment, so we are just doing an unrolled loop of

fdc offset(address)
offset = offset + cache_stride

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] 2.6.10-rc1-pa11 profile data
Date: Thu, 11 Nov 2004 10:51:52 -0800
Message-ID: <20041111185152.GV15714@tausq.org>
References: <20041111075431.GB9768@colo.lackof.org>
	<20041111081154.GR15714@tausq.org> <4193AE3C.9020509@tiscali.be>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4193AE3C.9020509@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> i.e. flush_kernel_[di]cache_page is few used versus 
> flush_kernel_[di]cache_range_asm while flush_user_[di]cache_range_asm is 
> more used then flush_user_[di]cache_page.
> 
> Isn't it strange?

could it be that kernel mappings tend to be bigger and user mappings
tend to be smaller? i'm only guessing here...

> mmm also:
>  49576 machine_restart                          774.6250

this is an artifact of the way the measurements are done. these are
actually calls to cpu_idle().

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

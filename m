From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] 2.6.9-rc2-pa5 build failures
Date: Sun, 19 Sep 2004 23:55:16 -0700
Message-ID: <20040920065516.GD22642@tausq.org>
References: <20040919104202.GB22642@tausq.org>
	<200409192000.i8JK01wr025911@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409192000.i8JK01wr025911@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

In reference to a message from John David Anglin, dated Sep 19:
> > > I thought it was just my config that failed to build -pa5
> > > until I looked at:
> > > 	http://cvs.parisc-linux.org/download/linux-2.6/
> > 
> > sigh, it's a problem with gcc-3.0....
> 
> Does the problem affect currently active branches?

no, i don't think so.

the problem is that gcc doesn't seem to like an asm() output specifier
that contains multiple quoted strings... so this doesn't work:

asm("" : "=" "r"(x))

but this does:
asm("" : "=r"(x))

with gcc-3.3, both forms are ok.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

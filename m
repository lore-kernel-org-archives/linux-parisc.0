From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: Mon, 29 Nov 2004 15:57:37 -0800
Message-ID: <20041129235737.GQ6359@tausq.org>
References: <20041127064710.GL9148@tausq.org>
	<200411292353.iATNrAc4005771@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200411292353.iATNrAc4005771@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

In reference to a message from John David Anglin, dated Nov 29:
> > to fix this we will probably need to introduce long branch stubs into 
> > into the kernel module loader. anybody want to give this a shot?
> 
> Another option which is probably less work is to build your kernel
> and modules with -mpa-risc-2-0.  This should give you 22-bit branches.

btw, Dave, pls correct me if i'm wrong:
is it correct that the problem only occurs because we are producing a .o
from multiple .o's? inside a single .o gcc should ensure that all
branches can reach the beginning and end of that .o using a 17-bit
relative branches, right?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

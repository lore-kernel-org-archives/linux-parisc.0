From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [RFC] Fix compat_sys_timer_create kernel security
	hole.
Date: Mon, 1 Aug 2005 23:42:23 -0400
Message-ID: <20050802034219.GB9703@systemhalted.org>
References: <20050801151506.GW9703@systemhalted.org>
	<20050801164250.GX9703@systemhalted.org>
	<20050802001505.GA9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050802001505.GA9703@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 01, 2005 at 08:15:09PM -0400, Carlos O'Donell wrote:
> On Mon, Aug 01, 2005 at 12:42:54PM -0400, Carlos O'Donell wrote:
> > parisc,
> > 
> > Another crash. Remember in the compat case that the source and destination
> > addresses may have sr's both set to zero since you are copying into a 
> > temporary kernel structure.
> > 
> > Backtrace:
> >  [<0000000010325ef4>] copy_to_user+0x34/0x40
> >  [<00000000101711dc>] sys_timer_create+0x294/0x8c8
> >  [<00000000101836f4>] compat_sys_timer_create+0x74/0xa8
> >  [<0000000010107f8c>] syscall_exit+0x0/0x14
> 
> Found my own bug. 

James Bottomley deserves credit here :)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

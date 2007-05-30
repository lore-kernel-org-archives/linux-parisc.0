From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3
Date: Wed, 30 May 2007 01:56:28 -0400
Message-ID: <20070530055628.GA18850__4160.45886599949$1416624378$gmane$org@fattire.cabal.ca>
References: <JIT7A2$DBBD069B2D6747164554FD17CA1B6184@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <JIT7A2$DBBD069B2D6747164554FD17CA1B6184@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 29, 2007 at 05:34:50PM +0200, Joel Soete wrote:
> Hello Helge, Kyle,
> 
> I just noticed the same pb you mentioned but with 2.6.22-rc2 rebuild with
> gcc-4.1.3 20070518 (debian pkg) ro run 32bit up kernel only:
> patst004 login: Backtrace:
> [<10111500>] unwind_once+0x154/0x38c
> [<10110aa0>] get_wchan+0x3c/0x80
> [<101a939c>] do_task_stat+0x69c/0x6a4
> [<101a6b88>] proc_info_read+0xc4/0x104
> [<1016d724>] vfs_read+0xb4/0x164
> [<1016dbec>] sys_read+0x4c/0x90

I have no idea what caused this, but the infinite recursion should be
fixed once I push the fixes out. I can look at this over the weekend
maybe (sorry, I don't have any machines kicking around plugged in and
wired up that can run 32-bit atm.)

Cheers,
	Kyle M.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

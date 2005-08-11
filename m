From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] New debian libc6 2.3.5: glibc bug or kernel bug???
Date: Thu, 11 Aug 2005 08:09:00 -0400
Message-ID: <20050811120900.GH18837@roadwarrior.mcmartin.ca>
References: <IL1WV5$C263D00B95D5C9242114A7D700723650@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IL1WV5$C263D00B95D5C9242114A7D700723650@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 11, 2005 at 11:25:53AM +0200, Joel Soete wrote:
>  kernel BUG at mm/mmap.c:????
> Backtrace:
> [<1015c5e8>] exit_mmap+0x1b8/0x1d8
> [<10126614>] mmput+0x44/0xbc
> [<1012a928>] do_exit+0xd4/0xa04
> [<1012b2bc>] do_group_exit+0x64/0xcc
> [<1010d12c>] syscall_exit+0x0/0x14
> 
> Kernel panic - not syncing: BUG!
> 

I can confirm this, my C3000 panicked during `make oldconfig' though
I didn't think it was running unstable, nor did I get a backtrace, though
it seems syslogd may have gotten it.

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

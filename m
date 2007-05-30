From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Status of 2.6.22-rc3
Date: Wed, 30 May 2007 15:20:02 +0200
Message-ID: <JIUVPE$FBD64A69CDAA2AEBDDC759CB9078E755__17124.5902347893$1416624379$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "kyle" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Tue, May 29, 2007 at 05:34:50PM +0200, Joel Soete wrote:
> > Hello Helge, Kyle,
> > 
> > I just noticed the same pb you mentioned but with 2.6.22-rc2 rebuild =
with
> > gcc-4.1.3 20070518 (debian pkg) ro run 32bit up kernel only:
> > patst004 login: Backtrace:
> > [<10111500>] unwind_once+0x154/0x38c
> > [<10110aa0>] get_wchan+0x3c/0x80
> > [<101a939c>] do_task_stat+0x69c/0x6a4
> > [<101a6b88>] proc_info_read+0xc4/0x104
> > [<1016d724>] vfs_read+0xb4/0x164
> > [<1016dbec>] sys_read+0x4c/0x90
> 
> I have no idea what caused this, but the infinite recursion should be
> fixed once I push the fixes out. I can look at this over the weekend
> maybe (sorry, I don't have any machines kicking around plugged in and
> wired up that can run 32-bit atm.)
> 
> Cheers,
> 	Kyle M.
> 
> 
Kyle,

Good news: your latest commit seems to fix the pb.

I rebuild it for b2k and b180 config (32 bit only) and boot it successful=
ly on
the 2 systems ;-)

More then top, I rebuild a kernel on b2k, git pull and tar kernel tree sr=
c on
b180 (and some other day-today stuf scp, apt-get, ...), all seems ok ;-)

Thanks a lot,
    Joel =0A---=0Ahttp://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

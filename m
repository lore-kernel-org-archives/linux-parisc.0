Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA04806
	for <parisc-linux@puffin.external.hp.com>; Sun, 7 Nov 1999 04:09:43 -0700
Date: Sun, 7 Nov 1999 12:12:05 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] sash commands
Message-ID: <19991107121205.M25252@mencheca.ch.genedata.com>
References: <19991105021334.J25252@mencheca.ch.genedata.com> <19991106193330.I11609@mathe.stud.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991106193330.I11609@mathe.stud.uni-erlangen.de>; from Philipp Rumpf on Sat, Nov 06, 1999 at 07:33:30PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Nov 06, 1999 at 07:33:30PM +0100, Philipp Rumpf wrote:
> > -mount is known to not work.  I need to speak to prumpf about why this is.
> 
> If I see this correctly this is the 4-argument problem.  Our current (hacked)
> syscall support only supports the register arguments because supporting the
> other ones too just would mean nobody ever got around to fix syscall support :)

Partly.  I should be less gnomic..

Yes, the 4-argument problem is relevant, but it's not the only thing.
sash (since it's a linux program) uses the linux arguments to sys_mount(),
so rather than both writing hpux_mount(), I decided to convince sash to
use the Linux entry point for sys_mount(), and that's what the sash-willy
in puffin.external.hp.com's /tmp has different to the other sashes.

Then I discovered that Linux syscalls were not working because we didn't
have a page mapped at 0xC000'1000, then I discovered we didn't have a
page mapped at 0xC000'0000 either and there was instead a nasty kludge
in fault.c to handle hpux syscalls.  So I added a nasty kludge in there
to make linux syscalls work too (and they don't have the 4-argument
limitation, due to the syscall convention which I decreed).

Now I'm blundering around in the mm system trying to figure out how to
get gateway pages working properly.

> If anyone else needs to send me email (or needed in the last two weeks or so),
> please use the new ugly address Philipp.H.Rumpf@mathe.stud.uni-erlangen.de. As
> I don't work for SuSE any more, prumpf@suse.de is very likely to be invalid
> shortly and I am not sure how often I'll be able to check it before.

The return address on this one was prumpf@mathe.stud.uni-erlangen.de.
I'm using the ugly address you quote there.

> > Ditto -sync.
> 
> what's the problem with sync ?

The same as the problem with -umount -- rather hard to test that it's
working :-)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id AAA08338
	for <parisc-linux@puffin.external.hp.com>; Sat, 18 Nov 2000 00:36:17 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13x2Mp-0000DH-00; Sat, 18 Nov 2000 07:24:55 +0000
Date: Sat, 18 Nov 2000 07:24:54 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Paul Bame <bame@noam.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10
Message-ID: <20001118072454.C30151@parcelfarce.linux.theplanet.co.uk>
References: <E13vj2z-00035b-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E13vj2z-00035b-00@noam.fc.hp.com>; from bame@noam.fc.hp.com on Tue, Nov 14, 2000 at 09:35:01AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 14, 2000 at 09:35:01AM -0700, Paul Bame wrote:
> 
> I've attached an overview of differences between our CVS linux sources

ok, here's my memories.

>      * Lots of RCS $Revision$ differences in ACPI (a different 'cvs
>        import' would've eliminated these differences).

i assume someone's already done the appropriate cvs admin -ko magic
to fix this?

>      * drivers/char/Config.in: changes to support LASI, parisc real-time
>        clock (CONFIG_GENRTC)

istr this was `stolen' from the m68k port by sammy.

>      * drivers/char/serial.c: support for GSC and A500 serial

if they're working, send to Ted and he'll do an update with Linus at
some point.  <tytso@valinux.com>

>      * drivers/net/eepro100.c: no clue about this one

we were trying to get it to work for the Jan NYLWE show.  i doubt we have
any changes of note.  does anyone have an eepro in an hp?

>      * drivers/video: STI and HP FB video drivers (iodccon is probably
>        worthless)

agreed on iodccon.  unless we're using it up until the point that one of
the more advanced consoles takes over?  i don't think we are now.

>      * fs/binfmt_elf.c,exec.c: changes for stack-grows-up?

Yes, that's what they're for.

>      * fs/nfs/read.c: probably unnecessary hack for broken parisc64 gcc

we certainly don't want to send it upstream, but we don't want to take it
out until the bug is fixed.  is fixing that bug on the webshite todo list?

>      * include/linux/binfmts.h,fs.h,kernel.h,tty.h,udf_fs_sb.h:
>        unnecessary differences?

mostly, yes.

>      * include/linux/init.h: we use different section names -- why????,
>        probably some unnecessary other differences too

because we use -ffunction-sections.  text.init clashes with a function called
init, and the linker just merges it into the text segment.  we need it to
be separate, so it became init.text.  there's patches around to do this for
other architectures too.  just bad naming choices initially.

>      * include/linux/wait.h: parisc debugging -- should be removed

yeah, that can die now.

>      * scripts/*: MANY differences here. Looks like a combination of
>        things we hacked to fix configuration problems plus MAYBE not
>        updating these files from new Linux versions in the past. 'make
>        menuconfig' is significantly different from upstream. Even the
>        mkdep.c program is different.

ok.  mea extremely culpa here.  i had an exclude file which included the
scripts/ directory.  someone should now ditch our stuff, take what's in
-test10, hack it till it works for us and check it in.

-- 
Revolutions do not require corporate support.

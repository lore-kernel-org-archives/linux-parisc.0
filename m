Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Wed, 17 Feb 1999 20:39:10 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Sender: pjlahaie@sims-ha.videotron.net
To: "hppa-linux@puffingroup.com" <hppa-linux@puffingroup.com>
Message-id: <36CB6F3E.5860DA3E@ottawa.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [hppa-linux] binutils / egcs oddity (yet another)
Resent-Message-ID: <"HoAQY1.0.Tq6.5zsos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

I've been trying to get egcs to build a binary that will run on
MkLinux, unfortunately, it's (once again) doing odd things.
If I take the standard crt0.o shipped with MkLinux and use the MkLinux
nm on it, I get the following:

00000000 T $START$
00000004 D $global$
00000000 D __environ
         U _start
00000000 D environ

    If I run the new x-binutils from the 2.9 series I get the following:

00000000 T $START$
20000004 D $global$
20000000 D __environ
         U _start
20000000 D environ

   For some reason, it's putting some symbols really far out.  If I do a
link with the standard MkLinux tools, I get main as my last symbol
and it's in the "0000axxx" range (on a program with an empty main
file).  If I try the same program with egcs/binutils 2.9 I get:

200093c0 D __environ
200093c0 D environ
200093c4 D $global$
200093c8 D _exit_dummy_ref
200093d0 D _exit_dummy_decl


   As my last symbols.  I've been studying the GNU ld linker scripts but
they don't seem to be the culprits.  I could run gdb on ld and
find out where it's getting that 0x20000000.  But this will probably be
lots of effort and are we looking for MkLinux binary compatibility?
If we aren't then we should just make the Linux/HPPA port loader capable
of dealing with the standard egcs HPPA-ELF output.

										- Paul

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.

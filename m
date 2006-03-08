From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [Fwd: Re: [parisc-linux] Re: gcj can't make shared libs on hppa]
Date: Tue, 7 Mar 2006 19:36:13 -0500 (EST)
Message-ID: <200603080036.k280aD1s015303@hiauly1.hia.nrc.ca>
References: <119aab440603060847i5cd87f25tc50fb5699429d5ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440603060847i5cd87f25tc50fb5699429d5ab@mail.gmail.com>
	from "Carlos O'Donell" at Mar 6, 2006 11:47:47 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I was too hasty in calling this a linker bug.  We end up with the
> > following relocations in the shared library as a result of the above
> > relocation in the object file:
> >
> > 00010f34 R_PARISC_PLABEL32  *ABS*+0x00010f46
> > 00010f44 R_PARISC_IPLT     *ABS*+0x000009a8
> >
> > The reason for the segmentation fault is the R_PARISC_IPLT isn't
> > being handled correctly and the indirect call to the constructor
> > for the library branches to the wrong location.
> 
> Can you explain what is broken?

If I knew that, I probably would have fixed the problem ;(

> Where does it branch to?

(gdb) stepi
0x400abb94 in __do_global_ctors_aux () from ./liba1.so.0
(gdb)
0x400ab9c4 in $$dyncall () from ./liba1.so.0
(gdb)
0x400ab9c4 in $$dyncall () from ./liba1.so.0
(gdb)
0x400ab9d4 in $$dyncall () from ./liba1.so.0
(gdb)
0x400ab9d8 in $$dyncall () from ./liba1.so.0
(gdb)
0x08000240 in ?? ()
(gdb) stepi

Program received signal SIGSEGV, Segmentation fault.
0x08000240 in ?? ()

Starting program: /home/dave/gcc_test/main
[Thread debugging using libthread_db enabled]
[New Thread 16384 (LWP 29346)]
[Switching to Thread 16384 (LWP 29346)]

Breakpoint 3, 0x400abb90 in __do_global_ctors_aux () from ./liba1.so.0
(gdb) p/x $r22
$3 = 0x8000240

This is just before the call to $$dyncall.  As can be seen, $r22
doesn't point to a function descriptor.  There doesn't seem to be
a function at 0x8000240.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

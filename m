Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.calyx.net (mail.calyx.com [216.82.160.19])
	by dsl2.external.hp.com (Postfix) with SMTP id 3F0F2482C
	for <parisc-linux@parisc-linux.org>; Tue, 11 Dec 2001 15:41:39 -0700 (MST)
Date: Tue, 11 Dec 2001 17:41:31 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.BSO.4.33.0112111703370.22364-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] HIL driver
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I got my first HIL mouse motion today :-)

I expect to have the new HIL driver suite doing something useful
in the next several days.  Could someone contact me about how
to go about committing the work?  (CVS access would be easiest for
me.)  I'll also need help with the config menu system since it
and I have a long history of not getting along with each other
and I'd prefer not to engage in endless ml discussions about what
files should go where, so someone with dictatorial authority
should decide that for me :-)

I currently have it building outside the kernel tree entirely
as modules, so it should be a very clean addition.

In case anyone's interested, the modules I have written
and/or will soon write are as follows:

        +-- (planned) hp_sdc_beeper  +-- (planned) hil_hpux
        +-- hp_sdc_rtc               +-- (planned) hil_kbd
hp_sdc -+-- hp_sdc_mlc --- hil_mlc --+-- hil_ptr

hp_sdc allows sharing of the i8042 SDC between the other modules.
hil_mlc abstracts hil bus devices into serio's such that they
can be attached either to a tty or to a linux-input device driver.
hp_sdc_mlc emulates direct access to an MLC indirectly through the SDC,
thus if there are any systems with directly connected MLCs (either
by design or hackery) a raw_mlc module can be written for them.

hil_hpux would allow emulation of HPUX's userspace HIL access (I
seem to remember that HPUX had such an animal) for running old HPUX
closed-source binaries.

I could also use a hand from someone at HP about a couple peculiarities
I am currently forced to work around -- seems the i8042 doesn't
behave as documented in a couple of corner cases:

1) When APE is off and error reporting is 0, and you send a DHR with
timeout 0 the i8042 is not supposed to watchdog the command, but
it does anyway, flooding the machine with IRQs.

2) When APE is turned back on the i8042 reconfigures the loop even
if error reporting is turned on, which it is not supposed to do.

I imagine a few surreptitious register pokes in the right places
will smack it into line.  I also suspect that the docs I have
omit a few details that are present in docs for previous models,
but if I cannot solve the above two the workarounds aren't horribly
ugly.

I can e-mail anyone a tarball of the work-in-progress if they want to hose
up their system or just laugh at my gratuitous spinlocks :-)

Anyway, back to fun with tasklets.

Tnx,

--
Brian S. Julin
